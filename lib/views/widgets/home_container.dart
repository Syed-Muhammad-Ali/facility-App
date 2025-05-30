// ignore_for_file: must_be_immutable

import 'package:facility_managing/res/constants/app_colors.dart';
import 'package:facility_managing/views/widgets/app_text.dart';
import 'package:facility_managing/views/widgets/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContainerWidgets extends StatelessWidget {
  final String text;
  final String iconPath;
  final VoidCallback? onTap;
  double? height;
  double? width;
  ContainerWidgets({
    super.key,
    required this.text,
    required this.iconPath,
    this.onTap,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? context.h * 0.18,
        width: width,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(iconPath),
            2.hSpace(context),
            AppText(
              text,
              fontSize: 10,
              fontWeight: FontWeight.w500,
              fontFamily: AppFontFamily.roboto,
              color: AppColors.white,
            ),
          ],
        ),
      ),
    );
  }
}
