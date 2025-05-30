import 'package:facility_managing/views/pages/user/dining/components/user_datTimeContainer.dart';
import 'package:facility_managing/views/widgets/app_bar.dart';
import 'package:facility_managing/views/widgets/extension_sizebox.dart';
import 'package:flutter/material.dart';

class UserOpeningHourPage extends StatefulWidget {
  const UserOpeningHourPage({super.key});

  @override
  State<UserOpeningHourPage> createState() => _UserOpeningHourPageState();
}

class _UserOpeningHourPageState extends State<UserOpeningHourPage> {
  bool days = true;
  final List<Map<String, String>> schedule = [
    {'day': 'Monday', 'time': '10:00 AM - 5:30 PM'},
    {'day': 'Tuesday', 'time': '10:00 AM - 5:30 PM'},
    {'day': 'Wednesday', 'time': '10:00 AM - 5:30 PM'},
    {'day': 'Thursday', 'time': '10:00 AM - 5:30 PM'},
    {'day': 'Friday', 'time': '10:00 AM - 5:30 PM'},
    {'day': 'Saturday', 'time': '10:00 AM - 5:30 PM'},
    {'day': 'Sunday', 'time': 'Off'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBackAppBar(
        title: "Opening Hours",
        showAction: true,
        iconPath: "assets/icons/chaplain.svg",
      ),
      body: Column(
        children: [
          2.hSpace(context),
          ListView.builder(
            itemCount: schedule.length,
            shrinkWrap: true,
            physics: AlwaysScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final daySchedule = schedule[index];
              return GestureDetector(
                child: UserDayTimeCard(
                  day: daySchedule['day']!,
                  timeText: daySchedule['time']!,
                  svgAssetPath: 'assets/icons/clock.png',
                  onEdit: () {},
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
