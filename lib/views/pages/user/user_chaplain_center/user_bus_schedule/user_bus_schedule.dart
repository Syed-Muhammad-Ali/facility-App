// ignore_for_file: deprecated_member_use, use_full_hex_values_for_flutter_colors

import 'package:facility_managing/res/constants/app_colors.dart';
import 'package:facility_managing/views/widgets/app_bar.dart';
import 'package:facility_managing/views/widgets/app_container.dart';
import 'package:facility_managing/views/widgets/app_text.dart';
import 'package:facility_managing/views/widgets/dotted_container.dart';
import 'package:facility_managing/views/widgets/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BusScheduleItem {
  final String number;
  final String startTime;
  final String endTime;
  final String duration;

  BusScheduleItem({
    required this.number,
    required this.startTime,
    required this.endTime,
    required this.duration,
  });
}

class UserBusSchedule extends StatelessWidget {
  UserBusSchedule({super.key});

  final List<BusScheduleItem> schedules = List.generate(
    5,
    (index) => BusScheduleItem(
      number: '01072',
      startTime: '15:30',
      endTime: '17:30',
      duration: '1h 30m',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBackAppBar(title: "Bus Schedule"),
      body: Column(
        children: [
          2.hSpace(context),
          Expanded(
            child: ListView.builder(
              itemCount: schedules.length,
              itemBuilder: (context, index) {
                final item = schedules[index];
                return AppContainer(
                  borderRadius: BorderRadius.circular(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/bus.svg',
                            width: 24,
                            height: 24,
                          ),
                          3.wSpace(context),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                'Bus Number',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.darkGrey,
                              ),
                              AppText(
                                item.number,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black,
                              ),
                            ],
                          ),
                        ],
                      ),
                      1.hSpace(context),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                "Start",
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textColor,
                              ),
                              1.hSpace(context),
                              AppText(
                                "15:30",
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.darkGrey,
                              ),
                            ],
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: CustomPaint(
                                      painter: DottedLinePainter(),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 6,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0xff0D16340D),
                                      borderRadius: BorderRadius.circular(32),
                                      border: Border.all(
                                        color: Color(0xff0D16340D),
                                      ),
                                    ),
                                    child: AppText(
                                      item.duration,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.darkGrey,
                                    ),
                                  ),
                                  Expanded(
                                    child: CustomPaint(
                                      painter: DottedLinePainter(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              AppText(
                                "Destination",
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textColor,
                              ),
                              1.hSpace(context),
                              AppText(
                                "17:30",
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.darkGrey,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
