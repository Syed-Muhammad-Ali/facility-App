import 'package:facility_managing/res/constants/app_colors.dart';
import 'package:facility_managing/views/widgets/app_text.dart';
import 'package:flutter/material.dart';

class ToggleRowWidget extends StatelessWidget {
  final String label;
  final String? text;
  final bool value;
  final ValueChanged<bool> onChanged;

  const ToggleRowWidget({
    super.key,
    required this.label,
    this.text,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(label, fontSize: 14, fontWeight: FontWeight.w600),
        Row(
          children: [
            Transform.scale(
              scale: 0.55,
              child: Switch(
                value: value,
                onChanged: onChanged,
                activeColor: Colors.white,
                activeTrackColor: AppColors.green,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
