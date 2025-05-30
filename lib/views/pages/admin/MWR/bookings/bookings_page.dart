import 'package:facility_managing/res/constants/app_colors.dart';
import 'package:facility_managing/res/routes/routes_name.dart';
import 'package:facility_managing/views/widgets/app_bar.dart';
import 'package:facility_managing/views/widgets/app_container.dart';
import 'package:facility_managing/views/widgets/app_text.dart';
import 'package:facility_managing/views/widgets/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingsPage extends StatefulWidget {
  const BookingsPage({super.key});

  @override
  State<BookingsPage> createState() => _BookingsPageState();
}

class _BookingsPageState extends State<BookingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBackAppBar(
        title: "Bookings",
        showAction: true,
        iconTab: () {
          Get.toNamed(RouteName.addBookingPage);
        },
      ),
      body: Column(
        children: [
          2.hSpace(context),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                // final event = events[index];
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteName.eventDetailsPage);
                  },
                  child: AppContainer(
                    borderRadius: BorderRadius.circular(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppText(
                                        "John Doe",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.black,
                                      ),
                                      0.5.hSpace(context),
                                      AppText(
                                        "Date: 27/02/2025",
                                        fontSize: 8,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.darkGrey,
                                      ),
                                      0.5.hSpace(context),
                                      AppText(
                                        "Time: 2:30PM-3:30PM",
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.darkGrey,
                                      ),
                                    ],
                                  ),
                                  const Icon(Icons.more_vert),
                                ],
                              ),
                              1.hSpace(context),
                              AppText(
                                "Lorem ipsum dolor sit amet consectetur. Rhoncus pellentesque mi ac neque pulvinar ultrices. Mauris imperdiet bibendum pretium aliquet pellentesque ultricies feugiat. ",
                                fontSize: 10,
                                fontFamily: AppFontFamily.roboto,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textColor,
                                maxLines: 4,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
