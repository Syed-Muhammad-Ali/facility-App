// ignore_for_file: use_super_parameters, deprecated_member_use

import 'package:facility_managing/res/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppDropdown extends StatefulWidget {
  final List<String> items;
  final String? initialValue;
  final ValueChanged<String?>? onChanged;
  final String? hintText;

  /// Customizable colors and styles, optional.
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? hintColor;
  final Color? textColor;
  final double? borderRadius;

  const AppDropdown({
    Key? key,
    required this.items,
    this.initialValue,
    this.onChanged,
    this.hintText,
    this.backgroundColor,
    this.borderColor,
    this.hintColor,
    this.textColor,
    this.borderRadius,
  }) : super(key: key);

  @override
  State<AppDropdown> createState() => _AppDropdownState();
}

class _AppDropdownState extends State<AppDropdown> {
  late String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue =
        widget.initialValue ??
        (widget.items.isNotEmpty ? widget.items[0] : null);
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        widget.backgroundColor ?? AppColors.primary.withOpacity(0.1);
    final borderColor =
        widget.borderColor ?? AppColors.primary.withOpacity(0.37);
    final hintColor = widget.hintColor ?? AppColors.primary;
    final textColor = widget.textColor ?? AppColors.primary;
    final borderRadius = widget.borderRadius ?? 8.0;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedValue,
          hint:
              widget.hintText != null
                  ? Text(
                    widget.hintText!,
                    style: GoogleFonts.roboto(
                      color: hintColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                  : null,
          icon: const Icon(Icons.keyboard_arrow_down, color: AppColors.black),
          isExpanded: true,
          style: GoogleFonts.roboto(
            color: textColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue;
            });
            if (widget.onChanged != null) {
              widget.onChanged!(newValue);
            }
          },
          items:
              widget.items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
        ),
      ),
    );
  }
}
