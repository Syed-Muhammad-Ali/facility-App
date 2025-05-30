import 'package:facility_managing/res/constants/app_colors.dart';
import 'package:facility_managing/views/widgets/app_container.dart';
import 'package:facility_managing/views/widgets/app_text.dart';
import 'package:facility_managing/views/widgets/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChurchServiceContainer extends StatelessWidget {
  final String day;
  final String timeText;
  final VoidCallback? onEdit;
  final String svgAssetPath;

  const ChurchServiceContainer({
    super.key,
    required this.day,
    required this.timeText,
    required this.svgAssetPath,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Row(
        children: [
          Image.asset(svgAssetPath, height: 40, width: 40, fit: BoxFit.contain),
          4.wSpace(context),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  day,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: AppFontFamily.roboto,
                  color: AppColors.textColor,
                ),
                0.5.hSpace(context),
                AppText(
                  timeText,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontFamily: AppFontFamily.roboto,
                  color: AppColors.textColor,
                ),
              ],
            ),
          ),
          Center(
            child: InkWell(
              onTap: onEdit,
              child: SvgPicture.asset("assets/icons/edit.svg"),
            ),
          ),
        ],
      ),
    );
  }
}
