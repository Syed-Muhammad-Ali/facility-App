import 'package:facility_managing/res/routes/routes_name.dart';
import 'package:facility_managing/views/pages/admin/MWR/components/MWR_Container.dart';
import 'package:facility_managing/views/widgets/app_bar.dart';
import 'package:facility_managing/views/widgets/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MWRPage extends StatefulWidget {
  const MWRPage({super.key});

  @override
  State<MWRPage> createState() => _MWRPageState();
}

class _MWRPageState extends State<MWRPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBackAppBar(title: "MWR & Events Page"),
      body: Column(
        children: [
          2.hSpace(context),
          MWRContainer(
            title: "Bookings",
            onTap: () {
              Get.toNamed(RouteName.bookingsPage);
            },
          ),
          MWRContainer(
            title: "Event",
            onTap: () {
              Get.toNamed(RouteName.eventPage);
            },
          ),
          MWRContainer(
            title: "Operating Hours MWR",
            onTap: () {
              Get.toNamed(RouteName.operatingHourMWRPage);
            },
          ),
          MWRContainer(
            title: "Operating Hours MFLC",
            onTap: () {
              /* action */
            },
          ),
          MWRContainer(
            title: "Operating Hours Red Cross",
            onTap: () {
              /* action */
            },
          ),
        ],
      ),
    );
  }
}
