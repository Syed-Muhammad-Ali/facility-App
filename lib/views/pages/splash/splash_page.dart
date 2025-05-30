import 'dart:async';

import 'package:facility_managing/res/constants/app_colors.dart';
import 'package:facility_managing/res/routes/routes_name.dart';
import 'package:facility_managing/views/widgets/app_text.dart';
import 'package:facility_managing/views/widgets/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  int seconds = 2;
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () => Get.toNamed(RouteName.signInPage));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset("assets/images/logo.png")),
          4.hSpace(context),
          AppText(
            "WCamp Reedo",
            fontSize: 24,
            fontFamily: AppFontFamily.roboto,
            fontWeight: FontWeight.w500,
            color: AppColors.primary,
          ),
        ],
      ),
    );
  }
}
