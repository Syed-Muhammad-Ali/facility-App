import 'package:facility_managing/res/constants/app_colors.dart';
import 'package:facility_managing/res/routes/routes_name.dart';
import 'package:facility_managing/views/widgets/app_bar.dart';
import 'package:facility_managing/views/widgets/app_container.dart';
import 'package:facility_managing/views/widgets/app_text.dart';
import 'package:facility_managing/views/widgets/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MaintainceReportPage extends StatefulWidget {
  const MaintainceReportPage({super.key});

  @override
  State<MaintainceReportPage> createState() => _MaintainceReportPageState();
}

class _MaintainceReportPageState extends State<MaintainceReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBackAppBar(
        title: "Maintenance Report",
        showAction: true,
        iconTab: () {
          Get.toNamed(RouteName.addMaintainceReport);
        },
      ),
      body: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: AppContainer(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    "Fresh and invigorating flavors straight from the garden! Try adding a splash of citrus to enhance the brightness of the dish.",
                    fontFamily: AppFontFamily.roboto,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textColor,
                  ),
                  0.2.hSpace(context),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: AppText(
                      "27/02/2025, 2:10 PM",
                      fontSize: 10,
                      fontFamily: AppFontFamily.roboto,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
