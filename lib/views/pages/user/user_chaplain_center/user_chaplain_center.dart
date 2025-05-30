// ignore_for_file: deprecated_member_use

import 'package:facility_managing/res/constants/app_colors.dart';
import 'package:facility_managing/res/routes/routes_name.dart';
import 'package:facility_managing/views/widgets/app_bar.dart';
import 'package:facility_managing/views/widgets/app_button.dart';
import 'package:facility_managing/views/widgets/app_container.dart';
import 'package:facility_managing/views/widgets/app_text.dart';
import 'package:facility_managing/views/widgets/chaplain_conatiner.dart';
import 'package:facility_managing/views/widgets/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class UserChaplainCenter extends StatefulWidget {
  const UserChaplainCenter({super.key});

  @override
  State<UserChaplainCenter> createState() => _UserChaplainCenterState();
}

class _UserChaplainCenterState extends State<UserChaplainCenter> {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            2.hSpace(context),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Container(
                width: context.w,
                height: context.h * 0.18,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/Cards.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '“The only way to do great work\nis to love what you do.”',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                        shadows: [
                          Shadow(
                            color: Colors.black45,
                            offset: Offset(1, 1),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                    ),
                    1.hSpace(context),
                    AppText(
                      "Steve Jobs",
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                      decorationColor: AppColors.white,
                      textDecoration: TextDecoration.underline,
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                // Get.toNamed(RouteName.teamPage);
              },
              child: AppContainer(
                color: AppColors.primary.withOpacity(0.9),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
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
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            for (int i = 0; i < images.length; i++)
                              Align(
                                widthFactor: .20,
                                alignment: Alignment.center,
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 1,
                                    ),
                                  ),
                                  margin: EdgeInsets.only(
                                    left: i.toDouble() * 12,
                                  ),
                                  child: CircleAvatar(
                                    radius: 10,
                                    backgroundImage: AssetImage(images[i]),
                                  ),
                                ),
                              ),
                            SizedBox(width: 20),
                            GestureDetector(
                              onTap: () {},
                              child: Center(
                                child: AppText(
                                  '+5',
                                  fontSize: 16,

                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    1.hSpace(context),
                    Row(
                      children: [
                        Expanded(
                          child: AppText(
                            "Lorem ipsum dolor sit amet consectetur. Rhoncus pellentesque mi ac neque pulvinar ultrices. Mauris imperdiet bibendum pretium aliquet pellentesque ultricies feugiat. ",
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textColor,
                          ),
                        ),
                        AppButton.primary(
                          context,
                          heignt: context.h * 0.04,
                          width: context.w * 0.2,
                          onPressed: () {
                            Get.toNamed(RouteName.chaplainSingup);
                          },
                          // isShadow: true,
                          buttonText: 'Sign Up',
                          buttoncolor: AppColors.white,
                          textColor: AppColors.primary,
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
                Get.toNamed(RouteName.userBusSchedule);
              },
            ),
            ChaplainContainer(
              svgIconPath: 'assets/icons/activities.svg',
              title: 'Activities',
              description:
                  'Lorem ipsum dolor sit amet consectetur. Rhoncus pellentesque mi ac neque pulvinar ultrices. Mauris imperdiet bibendum pretium aliquet pellentesque ultricies feugiat.',
              onTap: () {
                Get.toNamed(RouteName.userActivities);
              },
            ),

            ChaplainContainer(
              svgIconPath: 'assets/icons/church.svg',
              title: 'Church Service Times',
              description:
                  'Lorem ipsum dolor sit amet consectetur. Rhoncus pellentesque mi ac neque pulvinar ultrices. Mauris imperdiet bibendum pretium aliquet pellentesque ultricies feugiat.',
              onTap: () {
                Get.toNamed(RouteName.userChurchService);
              },
            ),
          ],
        ),
      ),
    );
  }
}
