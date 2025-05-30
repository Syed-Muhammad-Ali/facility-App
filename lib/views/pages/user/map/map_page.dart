// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:facility_managing/views/pages/user/MWR_event/MWR_events.dart';
import 'package:facility_managing/views/pages/user/dining/dining_page.dart';
import 'package:facility_managing/views/pages/user/user_chaplain_center/user_bus_schedule/user_bus_schedule.dart';
import 'package:facility_managing/views/pages/user/user_chaplain_center/user_chaplain_center.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image/image.dart' as img;

Future<BitmapDescriptor> getCustomMarker(
  String assetPath, {
  int width = 80,
}) async {
  ByteData data = await rootBundle.load(assetPath);
  Uint8List bytes = data.buffer.asUint8List();

  img.Image? baseImage = img.decodeImage(bytes);
  img.Image resizedImage = img.copyResize(baseImage!, width: width);

  Uint8List resizedBytes = Uint8List.fromList(img.encodePng(resizedImage));

  return BitmapDescriptor.fromBytes(resizedBytes);
}

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> _controller = Completer();

  final List<Map<String, dynamic>> locations = [
    {
      'position': LatLng(37.7749, -122.4194),
      'label': 'Bus Schedule',
      'iconPath': 'assets/icons/bus_schedule.png',
    },
    {
      'position': LatLng(37.7780, -122.4150),
      'label': 'Chaplain Center',
      'iconPath': 'assets/icons/chaplain_center.png',
    },
    {
      'position': LatLng(37.7795, -122.4125),
      'label': 'Dining Facility',
      'iconPath': 'assets/icons/dining_facility.png',
    },
    {
      'position': LatLng(37.7833, -122.4167),
      'label': 'MWR & Events',
      'iconPath': 'assets/icons/MWR_events.png',
    },
  ];

  final Set<Marker> _markers = {};
  Map<MarkerId, Offset> _labelPositions = {};
  GoogleMapController? _mapController;

  @override
  void initState() {
    super.initState();
    _loadMarkers();
  }

  Future<void> _loadMarkers() async {
    _markers.clear();

    // Load all icons concurrently
    List<Future<BitmapDescriptor>> iconFutures =
        locations.map((loc) {
          return getCustomMarker(loc['iconPath'], width: 100);
        }).toList();

    List<BitmapDescriptor> icons = await Future.wait(iconFutures);

    for (int i = 0; i < locations.length; i++) {
      final loc = locations[i];
      final markerId = MarkerId('marker_$i');
      final icon = icons[i];

      final marker = Marker(
        markerId: markerId,
        position: loc['position'],
        icon: icon,
        onTap: () {
          _onMarkerTap(i);
        },
      );
      _markers.add(marker);
    }

    setState(() {});
  }

  void _onMarkerTap(int index) {
    Widget screen;
    switch (index) {
      case 0:
        screen = UserBusSchedule();
        break;
      case 1:
        screen = const UserChaplainCenter();
        break;
      case 2:
        screen = const DiningPage();
        break;
      case 3:
        screen = MWREvents();
        break;
      default:
        screen = SizedBox();
    }
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));
  }

  Future<void> _updateLabelPositions() async {
    if (_mapController == null) return;

    Map<MarkerId, Offset> newPositions = {};

    for (int i = 0; i < locations.length; i++) {
      final loc = locations[i];
      final screenCoordinate = await _mapController!.getScreenCoordinate(
        loc['position'],
      );
      newPositions[MarkerId('marker_$i')] = Offset(
        screenCoordinate.x.toDouble(),
        screenCoordinate.y.toDouble(),
      );
    }

    setState(() {
      _labelPositions = newPositions;
    });
  }

  static const CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(37.7780, -122.4160),
    zoom: 15,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            zoomControlsEnabled: false,
            initialCameraPosition: _initialCameraPosition,
            markers: _markers,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              _mapController = controller;
              _updateLabelPositions();
            },
            onCameraMove: (_) {
              _updateLabelPositions();
            },
          ),

          // Text labels below markers
          ...locations.asMap().entries.map((entry) {
            final index = entry.key;
            final label = entry.value['label'] as String;
            final markerId = MarkerId('marker_$index');
            final pos = _labelPositions[markerId];

            if (pos == null) return Container();

            // Offset label below the marker icon (adjust as needed)
            final labelOffset = Offset(pos.dx - 40, pos.dy + 40);

            return Positioned(
              left: labelOffset.dx,
              top: labelOffset.dy,
              child: Container(
                width: 100,
                alignment: Alignment.center,
                child: Text(
                  label,
                  style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    shadows: [
                      Shadow(
                        blurRadius: 3,
                        color: Colors.white,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
