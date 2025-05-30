// ignore_for_file: deprecated_member_use

import 'package:facility_managing/res/constants/app_colors.dart';
import 'package:facility_managing/res/routes/routes_name.dart';
import 'package:facility_managing/views/widgets/app_bar.dart';
import 'package:facility_managing/views/widgets/app_container.dart';
import 'package:facility_managing/views/widgets/app_text.dart';
import 'package:facility_managing/views/widgets/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ChaplainsCenterPage extends StatefulWidget {
  const ChaplainsCenterPage({super.key});

  @override
  State<ChaplainsCenterPage> createState() => _ChaplainsCenterPageState();
}

class _ChaplainsCenterPageState extends State<ChaplainsCenterPage> {
  List<String> images = <String>[
    'assets/images/pic7.jpeg',
    'assets/images/pic6.jpeg',
    'assets/images/pic5.jpeg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBackAppBar(
        title: "Chaplains Center",
        showAction: true,
        iconPath: "assets/icons/chaplain.svg",
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
                Get.toNamed(RouteName.teamPage);
            },
            child: AppContainer(
              color: AppColors.primary.withOpacity(0.9),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              borderRadius: BorderRadius.circular(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'People Sign Up for ',
                          style: GoogleFonts.roboto(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                          ),
                          children: [
                            TextSpan(
                              text: "Sunday ",
                              style: GoogleFonts.roboto(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.primary,
                              ),
                            ),
                            TextSpan(
                              text: "Services",
                              style: GoogleFonts.roboto(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.arrow_forward, color: AppColors.primary),
                    ],
                  ),
                  1.hSpace(context),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      for (int i = 0; i < images.length; i++)
                        Align(
                          widthFactor: .25,
                          alignment: Alignment.center,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 1),
                            ),
                            margin: EdgeInsets.only(left: i.toDouble() * 18),
                            child: CircleAvatar(
                              radius: 14,
                              backgroundImage: AssetImage(images[i]),
                            ),
                          ),
                        ),
                      SizedBox(width: 32),
                      GestureDetector(
                        onTap: () {},
                        child: Center(
                          child: AppText(
                            '+5',
                            fontSize: 16,
                            fontFamily: AppFontFamily.roboto,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          ChaplainContainer(
            svgIconPath: 'assets/icons/bus.svg',
            title: 'Bus Schedule',
            description:
                'Lorem ipsum dolor sit amet consectetur. Rhoncus pellentesque mi ac neque pulvinar ultrices. Mauris imperdiet bibendum pretium aliquet pellentesque ultricies feugiat.',
            onTap: () {
              Get.toNamed(RouteName.busSchedulePage);
            },
          ),
          ChaplainContainer(
            svgIconPath: 'assets/icons/activities.svg',
            title: 'Activities',
            description:
                'Lorem ipsum dolor sit amet consectetur. Rhoncus pellentesque mi ac neque pulvinar ultrices. Mauris imperdiet bibendum pretium aliquet pellentesque ultricies feugiat.',
            onTap: () {
              Get.toNamed(RouteName.activitiesPage);
            },
          ),
          ChaplainContainer(
            svgIconPath: 'assets/icons/church.svg',
            title: 'Church Service',
            description:
                'Lorem ipsum dolor sit amet consectetur. Rhoncus pellentesque mi ac neque pulvinar ultrices. Mauris imperdiet bibendum pretium aliquet pellentesque ultricies feugiat.',
            onTap: () {
              Get.toNamed(RouteName.churchServicePage);
            },
          ),
          ChaplainContainer(
            svgIconPath: 'assets/icons/church.svg',
            title: 'Church Service Times',
            description:
                'Lorem ipsum dolor sit amet consectetur. Rhoncus pellentesque mi ac neque pulvinar ultrices. Mauris imperdiet bibendum pretium aliquet pellentesque ultricies feugiat.',
            onTap: () {
              Get.toNamed(RouteName.churchServiceItem);
            },
          ),
        ],
      ),
    );
  }
}

class ChaplainContainer extends StatelessWidget {
  final String svgIconPath;
  final String title;
  final String description;
  final VoidCallback? onTap;

  const ChaplainContainer({
    super.key,
    required this.svgIconPath,
    required this.title,
    required this.description,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AppContainer(
        borderRadius: BorderRadius.circular(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(svgIconPath, width: 36, height: 36),
                const SizedBox(width: 12),
                Expanded(
                  child: AppText(
                    title,
                    fontSize: 12,
                    fontFamily: AppFontFamily.roboto,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                ),
                const Icon(Icons.arrow_forward, color: AppColors.primary),
              ],
            ),
            const SizedBox(height: 12),
            AppText(
              description,
              fontSize: 10,
              fontFamily: AppFontFamily.roboto,
              fontWeight: FontWeight.w400,
              color: AppColors.darkGrey,
            ),
          ],
        ),
      ),
    );
  }
}
