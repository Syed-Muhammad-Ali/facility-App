import 'package:facility_managing/res/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDialog {
  static Future<void> show(
    BuildContext context, {
    Widget? content,
    List<Widget>? actions,
    bool barrierDismissible = false,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
          content: content,
          actionsAlignment: MainAxisAlignment.center,
          actionsPadding: EdgeInsets.only(bottom: 12),
          actions: actions,
        );
      },
    );
  }
}
