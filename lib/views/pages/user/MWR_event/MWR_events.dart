// ignore_for_file: deprecated_member_use

import 'package:facility_managing/res/constants/app_colors.dart';
import 'package:facility_managing/res/routes/routes_name.dart';
import 'package:facility_managing/views/widgets/app_bar.dart';
import 'package:facility_managing/views/widgets/app_button.dart';
import 'package:facility_managing/views/widgets/app_container.dart';
import 'package:facility_managing/views/widgets/app_text.dart';
import 'package:facility_managing/views/widgets/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class MWREvents extends StatefulWidget {
//   const MWREvents({super.key});

//   @override
//   State<MWREvents> createState() => _MWREventsState();
// }

// class _MWREventsState extends State<MWREvents> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

class Event {
  final String imageUrl;
  final String title;
  final String date;
  final String address;
  final String description;

  Event({
    required this.imageUrl,
    required this.title,
    required this.date,
    required this.address,
    required this.description,
  });
}

class OperatingHours {
  final String day;
  final String time;

  OperatingHours(this.day, this.time);
}

class MWREvents extends StatelessWidget {
  MWREvents({super.key});

  final List<Event> events = [
    Event(
      imageUrl:
          'https://images.pexels.com/photos/57690/pexels-photo-57690.jpeg',
      title: 'Event Name',
      date: '20/02/2025, 5:30 PM',
      address: '47 W 13th St, New York, NY 10011, USA',
      description:
          'Lorem ipsum dolor sit amet consectetur. Nibh ultrices ornare tincidunt eu. Dolor tincidunt in pharetra vulputate sit elementum senectus pulvinar.',
    ),
    Event(
      imageUrl:
          'https://images.pexels.com/photos/3945316/pexels-photo-3945316.jpeg',
      title: 'Event Name',
      date: '20/02/2025, 5:30 PM',
      address: '47 W 13th St, New York, NY 10011, USA',
      description:
          'Lorem ipsum dolor sit amet consectetur. Nibh ultrices ornare tincidunt eu. Dolor tincidunt in pharetra vulputate sit elementum senectus pulvinar.',
    ),
  ];

  final Map<String, List<OperatingHours>> operatingHoursMap = {
    'Operating Hours Red Cross': [
      OperatingHours('Mon', '(7:30AM-9:00PM)'),
      OperatingHours('Tue', '(7:30AM-9:00PM)'),
      OperatingHours('Wed', '(7:30AM-9:00PM)'),
      OperatingHours('Thu', '(7:30AM-9:00PM)'),
      OperatingHours('Fri', '(7:30AM-9:00PM)'),
      OperatingHours('Sat', '(Closed)'),
      OperatingHours('Sun', '(Closed)'),
    ],
    'Operating Hours MWR': [
      OperatingHours('Mon', '(7:30AM-9:00PM)'),
      OperatingHours('Tue', '(7:30AM-9:00PM)'),
      OperatingHours('Wed', '(7:30AM-9:00PM)'),
      OperatingHours('Thu', '(7:30AM-9:00PM)'),
      OperatingHours('Fri', '(7:30AM-9:00PM)'),
      OperatingHours('Sat', '(Closed)'),
      OperatingHours('Sun', '(Closed)'),
    ],
    'Operating Hours MFLC': [
      OperatingHours('Mon', '(7:30AM-9:00PM)'),
      OperatingHours('Tue', '(7:30AM-9:00PM)'),
      OperatingHours('Wed', '(7:30AM-9:00PM)'),
      OperatingHours('Thu', '(7:30AM-9:00PM)'),
      OperatingHours('Fri', '(7:30AM-9:00PM)'),
      OperatingHours('Sat', '(Closed)'),
      OperatingHours('Sun', '(Closed)'),
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBackAppBar(title: "Events & Operating Hours"),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                'Events',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.textColor,
              ),
              2.hSpace(context),
              SizedBox(
                height: context.h * 0.4,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    final event = events[index];
                    return AppContainer(
                      width: 320,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                            child: Image.network(
                              event.imageUrl,
                              width: double.infinity,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  event.title,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textColor,
                                ),
                                0.5.hSpace(context),
                                AppText(
                                  event.date,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textColor.withOpacity(.56),
                                ),
                                0.5.hSpace(context),
                                AppText(
                                  event.address,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textColor.withOpacity(.56),
                                ),
                                1.hSpace(context),
                                AppText(
                                  event.description,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.grey,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              1.hSpace(context),
              ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  ...operatingHoursMap.entries.map((entry) {
                    return OperatingHoursExpansionTile(
                      title: entry.key,
                      hours: entry.value,
                    );
                  }),
                  1.hSpace(context),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteName.bookRoomPage);
                    },
                    child: AppContainer(
                      color: AppColors.primary.withOpacity(0.9),
                      padding: EdgeInsets.all(10),
                      margin: const EdgeInsets.only(
                        bottom: 5,
                        top: 5,
                        left: 5,
                        right: 5,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            "Book a Room",
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                          ),
                          1.hSpace(context),
                          AppText(
                            "Lorem ipsum dolor sit amet consectetur. Rhoncus pellentesque mi ac neque pulvinar ultrices. Mauris imperdiet bibendum pretium aliquet pellentesque ultricies feugiat. ",
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textColor,
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: AppButton.primary(
                              context,
                              heignt: context.h * 0.04,
                              width: context.w * 0.2,
                              onPressed: () {},
                              // isShadow: true,
                              buttonText: 'Sign Up',
                              buttoncolor: AppColors.white,
                              textColor: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OperatingHoursExpansionTile extends StatelessWidget {
  final String title;
  final List<OperatingHours> hours;

  const OperatingHoursExpansionTile({
    super.key,
    required this.title,
    required this.hours,
  });

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      padding: const EdgeInsets.only(),
      margin: const EdgeInsets.only(bottom: 5, top: 5, left: 5, right: 5),
      borderRadius: BorderRadius.circular(10),
      child: ExpansionTile(
        title: AppText(
          title,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.textColor,
        ),
        children:
            hours
                .map(
                  (hour) => Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 2.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          hour.day,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                        ),
                        AppText(
                          hour.time,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
      ),
    );
  }
}
