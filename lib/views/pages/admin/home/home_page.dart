import 'package:facility_managing/res/constants/app_colors.dart';
import 'package:facility_managing/res/routes/routes_name.dart';
import 'package:facility_managing/views/widgets/app_text.dart';
import 'package:facility_managing/views/widgets/extension_sizebox.dart';
import 'package:facility_managing/views/widgets/home_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/images/small_logo.png"),
                  AppText(
                    "Camp Reedo",
                    fontSize: 24,
                    fontFamily: AppFontFamily.roboto,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                  ),
                  SvgPicture.asset("assets/icons/notification.svg"),
                ],
              ),
              8.hSpace(context),
              Row(
                children: [
                  Expanded(
                    child: ContainerWidgets(
                      text: "Dining Facility",
                      iconPath: "assets/icons/Dining_facility.svg",
                      onTap: () {
                        Get.toNamed(RouteName.diningFacilityPage);
                      },
                    ),
                  ),
                  4.wSpace(context),
                  Expanded(
                    child: ContainerWidgets(
                      text: 'Chaplains center',
                      iconPath: "assets/icons/Chaplains_center.svg",
                      onTap: () {
                        Get.toNamed(RouteName.chaplainsCenterPage);
                      },
                    ),
                  ),
                ],
              ),
              3.hSpace(context),
              Row(
                children: [
                  Expanded(
                    child: ContainerWidgets(
                      text: "Maintenance reporting",
                      iconPath: "assets/icons/Maint_report .svg",
                      onTap: () {
                        Get.toNamed(RouteName.maintainceReportPage);
                      },
                    ),
                  ),
                  4.wSpace(context),
                  Expanded(
                    child: ContainerWidgets(
                      text: 'MWR',
                      iconPath: "assets/icons/MWR.svg",
                      onTap: () {
                        Get.toNamed(RouteName.mwrPage);
                      },
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
