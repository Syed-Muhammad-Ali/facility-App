// ignore_for_file: deprecated_member_use

import 'package:facility_managing/res/constants/app_colors.dart';
import 'package:facility_managing/views/widgets/app_text.dart';
import 'package:flutter/material.dart';

class AppButton {
  static Widget primary(
    BuildContext context, {
    final VoidCallback? onPressed,
    final String buttonText = 'Button',
    final double heignt = 50,
    final double width = double.infinity,
    final bool isBorderButton = false,
    final bool isShadow = false,
    final Widget? child,
    final Color? textColor,
    final Color buttoncolor = AppColors.primary,
    final Color? borderColor,
    bool? loading = false,
  }) {
    return Material(
      elevation: isShadow ? 2 : 0,
      color: Colors.transparent,
      shadowColor:
          isShadow ? AppColors.black.withOpacity(0.7) : Colors.transparent,
      borderRadius: BorderRadius.circular(22),
      child:
          isBorderButton
              ? Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: MaterialButton(
                  onPressed: onPressed,
                  height: heignt,
                  minWidth: width,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(
                      color:
                          isBorderButton
                              ? borderColor ?? AppColors.borderColor
                              : Colors.transparent,
                    ),
                  ),
                  color: buttoncolor,
                  child:
                      child ??
                      AppText(
                        buttonText,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontFamily: AppFontFamily.roboto,
                        color: textColor ?? AppColors.white,
                      ),
                ),
              )
              : MaterialButton(
                onPressed: onPressed,
                height: heignt,
                minWidth: width,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    color:
                        isBorderButton
                            ? borderColor ?? AppColors.borderColor
                            : Colors.transparent,
                  ),
                ),
                color: buttoncolor,
                child:
                    child ??
                    // (loading == true
                    //     ? Center(
                    //         child: SleekCircularSlider(
                    //           appearance: CircularSliderAppearance(
                    //             spinnerMode: true,
                    //             customColors: CustomSliderColors(
                    //               trackColor: AppColors.grey,
                    //               progressBarColor: AppColors.white,
                    //               shadowColor: AppColors.white,
                    //               shadowMaxOpacity: 0.5,
                    //             ),
                    //             size: 30,
                    //           ),
                    //         ),
                    //       )
                    //     :
                    AppText(
                      buttonText,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontFamily: AppFontFamily.roboto,
                      color: textColor ?? AppColors.white,
                    ),

                // ),
              ),
      // child:
    );
  }

  static Widget text(
    BuildContext context, {
    final VoidCallback? onPressed,
    final String buttonText = 'Button',
    final TextStyle? style,
  }) {
    return TextButton(onPressed: onPressed, child: AppText(buttonText));
  }
}
