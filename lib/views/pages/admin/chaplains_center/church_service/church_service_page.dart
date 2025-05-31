import 'package:facility_managing/res/constants/app_colors.dart';
import 'package:facility_managing/res/routes/routes_name.dart';
import 'package:facility_managing/views/widgets/app_bar.dart';
import 'package:facility_managing/views/widgets/app_container.dart';
import 'package:facility_managing/views/widgets/app_text.dart';
import 'package:facility_managing/views/widgets/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChurchServicePage extends StatefulWidget {
  const ChurchServicePage({super.key});

  @override
  State<ChurchServicePage> createState() => _ChurchServicePageState();
}

class _ChurchServicePageState extends State<ChurchServicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBackAppBar(
        title: "Church Services",
        showAction: true,
        iconTab: () {
          Get.toNamed(RouteName.addChurchServicePage);
        },
      ),
      body: Column(
        children: [
          2.hSpace(context),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteName.churchServiceDetails);
                  },
                  child: AppContainer(
                    borderRadius: BorderRadius.circular(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: AppText(
                                "Service Name",
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: AppFontFamily.roboto,
                                color: AppColors.black,
                              ),
                            ),
                            const Icon(Icons.more_vert, size: 20),
                          ],
                        ),
                        const SizedBox(height: 6),
                        AppText(
                          '27/02/2025, 2:10 PM',
                          fontSize: 8,
                          fontWeight: FontWeight.w400,
                          fontFamily: AppFontFamily.roboto,
                          color: AppColors.darkGrey,
                        ),
                        const SizedBox(height: 2),
                        AppText(
                          '400 Broome St, New York, NY 10013, USA',
                          fontSize: 8,
                          fontWeight: FontWeight.w400,
                          fontFamily: AppFontFamily.roboto,
                          color: AppColors.darkGrey,
                        ),

                        const SizedBox(height: 12),

                        AppText(
                          'Lorem ipsum dolor sit amet consectetur. Rhoncus pellentesque mi ac neque pulvinar ultrices. Mauris imperdiet bibendum pretium aliquet pellentesque ultricies feugiat.',
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          fontFamily: AppFontFamily.roboto,
                          color: Colors.black87,
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
