// ignore_for_file: prefer_if_null_operators, use_key_in_widget_constructors, must_be_immutable, deprecated_member_use

import 'package:facility_managing/res/constants/app_colors.dart';
import 'package:facility_managing/views/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//common textfield

class AppTextfield extends StatefulWidget {
  Widget? prefixIcon;
  Widget? suffixIcon;
  Widget? errorWidget;
  Function()? onTap;
  Function(String)? onchanged;
  String? Function(String?)? validator;
  String? hint;
  double? hintSize;
  Widget? subWidget;
  String? labelText;
  Color? filledColor;
  Color? borderColor;
  String title;
  final TextEditingController? ctr;
  TextInputType? textInputType;
  double? height;
  int? maxLength;
  double? width;
  double bottomSpace;
  double? radius;
  bool? readOnly;
  bool isPasswordField;
  bool isUnderlined;
  FocusNode? focusNode;
  bool hideKeyboard;
  int? maximumLines;
  int? minimumLines;
  TextCapitalization? textCapitalization;
  bool? useCountFormater;
  Color? hintColor;
  Color? textColor;
  Color? cursorColor;
  Color? suffixIconColor;
  final Iterable<String>? autofillHints;

  AppTextfield({
    this.prefixIcon,
    this.readOnly,
    this.errorWidget,
    this.validator,
    this.hint = '',
    this.subWidget,
    this.title = '',
    this.bottomSpace = 12,
    this.suffixIcon,
    this.ctr,
    this.height,
    this.onTap,
    this.borderColor,
    this.isPasswordField = false,
    this.onchanged,
    this.textInputType,
    this.maxLength,
    this.radius,
    this.filledColor,
    this.maximumLines,
    this.minimumLines,
    this.width,
    this.focusNode,
    this.labelText,
    this.isUnderlined = false,
    this.hideKeyboard = true,
    this.textCapitalization,
    this.useCountFormater,
    this.hintColor,
    this.textColor,
    required this.autofillHints,
    this.cursorColor,
    this.suffixIconColor,
    this.hintSize,
  });

  @override
  State<AppTextfield> createState() => _AppTextfieldState();
}

class _AppTextfieldState extends State<AppTextfield> {
  bool isObscure = true;

  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.bottomSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != '')
            Padding(
              padding: EdgeInsets.only(bottom: widget.isUnderlined ? 0 : 11),
              child: Row(
                children: [
                  AppText(
                    widget.title,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: widget.textColor ?? AppColors.grey,
                  ),
                  const Spacer(),
                  if (widget.subWidget != null) widget.subWidget!,
                ],
              ),
            ),
          SizedBox(
            height: widget.height,
            width: widget.width,
            child: TextFormField(
              onTapOutside: (event) {
                if (widget.hideKeyboard) {
                  _focusNode.unfocus();
                  // FocusScope.of(context).unfocus();
                }
              },
              inputFormatters:
                  (widget.useCountFormater ?? false)
                      ? [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'[\d.]'),
                        ), // Allow only digits and period
                        CurrencyInputFormatter(), // Apply currency formatting
                      ]
                      : null,
              focusNode: widget.focusNode ?? _focusNode,
              onChanged: widget.onchanged ?? (value) {},
              textCapitalization:
                  widget.textCapitalization ?? TextCapitalization.sentences,
              onTap: widget.onTap,
              maxLines: widget.maximumLines ?? 1,
              minLines: widget.minimumLines ?? 1,
              readOnly: widget.readOnly ?? false,
              controller: widget.ctr,
              maxLength: widget.maxLength,
              keyboardType: widget.textInputType,
              autofillHints: widget.autofillHints,
              obscureText: widget.isPasswordField ? isObscure : false,
              obscuringCharacter: '*',
              cursorColor: widget.cursorColor ?? AppColors.black,
              validator: widget.validator,
              style: TextStyle(
                fontSize: 14,
                color: widget.textColor ?? AppColors.black,
              ),
              decoration: InputDecoration(
                labelText: widget.labelText,
                labelStyle: TextStyle(fontSize: 13, color: Colors.white),
                contentPadding: EdgeInsets.fromLTRB(
                  widget.isUnderlined ? 0 : 12,
                  4,
                  12,
                  4,
                ),
                counterText: '',
                filled: true,
                fillColor:
                    widget.filledColor ?? AppColors.primary.withOpacity(0.1),
                prefixIcon: widget.prefixIcon,
                prefixIconConstraints: const BoxConstraints(
                  maxWidth: 40,
                  minWidth: 30,
                  minHeight: 30,
                ),
                suffixIconConstraints: BoxConstraints(
                  minHeight: 25,
                  minWidth: 35,
                  maxHeight: 35,
                  maxWidth: 35,
                ),
                suffixIcon:
                    widget.isPasswordField
                        ? GestureDetector(
                          onTap: () {
                            setState(() {
                              isObscure = !isObscure;
                            });
                          },
                          child: Icon(
                            isObscure
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            size: 20,
                            color: widget.suffixIconColor ?? AppColors.primary,
                          ),
                        )
                        : widget.suffixIcon,
                errorStyle: TextStyle(fontSize: 12, color: Colors.red),
                hintText: widget.hint,
                hintStyle: TextStyle(
                  fontSize: widget.hintSize ?? 14,
                  fontWeight: FontWeight.w400,
                  color: widget.hintColor ?? AppColors.primary,
                ),
                focusedBorder: border(
                  widget.borderColor ?? AppColors.primary.withOpacity(0.37),
                ),
                errorBorder: border(widget.borderColor ?? Colors.red),
                enabledBorder: border(
                  widget.borderColor ?? AppColors.primary.withOpacity(0.37),
                ),
                border: border(
                  widget.borderColor ?? AppColors.primary.withOpacity(0.37),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  InputBorder border(Color color) {
    return widget.isUnderlined
        ? UnderlineInputBorder(
          borderSide: BorderSide(color: color),
          borderRadius: BorderRadius.circular(0),
        )
        : OutlineInputBorder(
          borderSide: BorderSide(color: color),
          borderRadius: BorderRadius.circular(widget.radius ?? 8),
        );
  }
}

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Allow only numbers and a single period
    String newText = newValue.text;

    // If the input is empty, return 0.00
    if (newText.isEmpty) {
      return newValue.copyWith(
        text: '',
        selection: const TextSelection.collapsed(offset: 0),
      );
    }

    // Prevent more than one period in the text
    if (newText.indexOf('.') != newText.lastIndexOf('.')) {
      return oldValue; // Ignore input if there's more than one period
    }

    // Limit the number of digits after the decimal point
    if (newText.contains('.')) {
      String decimalPart = newText.split('.')[1];
      if (decimalPart.length > 2) {
        return oldValue; // Ignore if more than 2 digits after the decimal
      }
    }

    // Prevent input of more than 2 decimal places
    return newValue;
  }
}
