// ignore_for_file: must_be_immutable

import 'package:facility_managing/res/constants/app_colors.dart';
import 'package:facility_managing/views/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomBackAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? iconTab;
  final bool showAction;
  VoidCallback? ontap;
  final String? iconPath;

  CustomBackAppBar({
    super.key,
    required this.title,
    this.iconTab,
    this.showAction = false,
    this.ontap,
    this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Stack(
        alignment: Alignment.center,
        children: [
          AppText(
            title,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.barTextColor,
            fontFamily: AppFontFamily.roboto,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: ontap ?? () => Get.back(),
              borderRadius: BorderRadius.circular(10),
              child: const Icon(
                Icons.arrow_back_ios_new,
                size: 18,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      actions:
          showAction
              ? [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: GestureDetector(
                    onTap: iconTab,
                    child: SvgPicture.asset(
                      height: 25,
                      width: 25,
                      iconPath == null || iconPath!.isEmpty
                          ? "assets/icons/add.svg"
                          : iconPath!,
                    ),
                  ),
                ),
              ]
              : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
