// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:facility_managing/res/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;
  final List<BoxShadow>? boxShadow;
  final Widget child;
  double? height;
  double? width;

  AppContainer({
    super.key,
    required this.child,
    this.margin,
    this.padding,
    this.color,
    this.borderRadius,
    this.boxShadow,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin ?? const EdgeInsets.fromLTRB(15, 5, 15, 12),
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: color ?? AppColors.white,
        borderRadius:
            borderRadius ?? const BorderRadius.all(Radius.circular(16)),
        boxShadow:
            boxShadow ??
            [
              BoxShadow(
                color: AppColors.black.withOpacity(0.25),
                blurRadius: 4,
                offset: Offset(0, 0),
              ),
            ],
      ),
      child: child,
    );
  }
}
