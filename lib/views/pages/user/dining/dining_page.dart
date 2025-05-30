import 'package:facility_managing/res/routes/routes_name.dart';
import 'package:facility_managing/views/widgets/app_bar.dart';
import 'package:facility_managing/views/widgets/extension_sizebox.dart';
import 'package:facility_managing/views/widgets/home_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiningPage extends StatefulWidget {
  const DiningPage({super.key});

  @override
  State<DiningPage> createState() => _DiningPageState();
}

class _DiningPageState extends State<DiningPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBackAppBar(title: "Dining"),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              4.hSpace(context),
              Row(
                children: [
                  Expanded(
                    child: ContainerWidgets(
                      text: "Menu",
                      iconPath: "assets/icons/Dining_facility.svg",
                      onTap: () {
                        Get.toNamed(RouteName.userMenuPage);
                      },
                    ),
                  ),
                  4.wSpace(context),
                  Expanded(
                    child: ContainerWidgets(
                      text: 'Opening Hours',
                      iconPath: "assets/icons/opening_hours.svg",
                      onTap: () {
                        Get.toNamed(RouteName.userOpeningHourPage);
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
                      text: "Feedback",
                      iconPath: "assets/icons/Maint_report .svg",
                      onTap: () {
                        Get.toNamed(RouteName.userFeedback);
                      },
                    ),
                  ),
                  4.wSpace(context),
                  Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
