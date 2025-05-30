import 'package:facility_managing/res/constants/app_colors.dart';
import 'package:facility_managing/views/widgets/app_container.dart';
import 'package:facility_managing/views/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChaplainContainer extends StatelessWidget {
  final String svgIconPath;
  final String title;
  final String description;
  final VoidCallback? onTap;

  const ChaplainContainer({
    super.key,
    required this.svgIconPath,
    required this.title,
    required this.description,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AppContainer(
        borderRadius: BorderRadius.circular(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(svgIconPath, width: 36, height: 36),
                const SizedBox(width: 12),
                Expanded(
                  child: AppText(
                    title,
                    fontSize: 12,
                    fontFamily: AppFontFamily.roboto,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                ),
                const Icon(Icons.arrow_forward, color: AppColors.primary),
              ],
            ),
            const SizedBox(height: 12),
            AppText(
              description,
              fontSize: 10,
              fontFamily: AppFontFamily.roboto,
              fontWeight: FontWeight.w400,
              color: AppColors.darkGrey,
            ),
          ],
        ),
      ),
    );
  }
}
