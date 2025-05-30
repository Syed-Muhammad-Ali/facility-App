// ignore_for_file: deprecated_member_use

import 'package:facility_managing/res/constants/app_colors.dart';
import 'package:flutter/material.dart';

// class ColorTheme extends Theme {
//   static ThemeData themeData = ThemeData(
//     // Set all colors to white
//     colorScheme: ColorScheme.fromSeed(
//       seedColor: Colors.white,
//       brightness: Brightness.light,
//     ),
//     useMaterial3: true,
//     // brightness: Brightness.light,
//     // canvasColor: Colors.white,
//     // cardColor: Colors.white,
//     // dialogBackgroundColor: Colors.white,
//     // disabledColor: Colors.white,
//     // dividerColor: Colors.white,

//     // focusColor: Colors.white,
//     // highlightColor: Colors.white,
//     // hintColor: Colors.white,
//     // hoverColor: Colors.white,
//     // indicatorColor: Colors.white,
//     // primaryColor: Colors.white,
//     // primaryColorDark: Colors.white,
//     // primaryColorLight: Colors.white,
//     // scaffoldBackgroundColor: Colors.white,
//     // secondaryHeaderColor: Colors.white,
//     // splashColor: Colors.white,
//     // unselectedWidgetColor: Colors.white,
//     // // Typography & Iconography
//     // iconTheme: const IconThemeData(color: Colors.white),
//     // primaryIconTheme: const IconThemeData(color: Colors.white),
//     // // Component Themes
//     // appBarTheme: const AppBarTheme(
//     //   backgroundColor: Colors.white,
//     //   foregroundColor: Colors.white,
//     //   surfaceTintColor: Colors.white,
//     // ),
//     // Add other component themes here if needed
//   );

//   ColorTheme(Widget child, {super.key}) : super(child: child, data: themeData);
// }

class AppTheme {
  static ThemeData get theme => ThemeData(
    primaryColor: AppColors.primary,
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.white,
    secondaryHeaderColor: AppColors.white,
    brightness: Brightness.light,
    canvasColor: Colors.white,
    cardColor: Colors.white,
    dialogBackgroundColor: Colors.white,
    disabledColor: Colors.white,
    dividerColor: Colors.white,
    focusColor: Colors.white,
    // highlightColor: Colors.white,
    // hintColor: Colors.white,
    // // hoverColor: Colors.white,
    indicatorColor: Colors.white,
    primaryColorDark: Colors.white,
    primaryColorLight: Colors.white,
    // splashColor: Colors.white,
    // unselectedWidgetColor: Colors.white,
    // textTheme: _textTheme,
    inputDecorationTheme: _inputDecorationTheme,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.black,
      selectionColor: AppColors.primary.withOpacity(0.3),
      selectionHandleColor: AppColors.primary,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.white,
      surfaceTintColor: Colors.white,
    ),
  );

  // static final TextTheme _textTheme = TextTheme(
  //   bodySmall: AppStyle.bodySmall,
  //   bodyMedium: AppStyle.bodyMedium,
  //   bodyLarge: AppStyle.bodyLarge,
  // );
  static final InputDecorationTheme _inputDecorationTheme =
      InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: BorderSide(color: AppColors.borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: BorderSide(color: AppColors.borderColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: BorderSide(color: AppColors.borderColor),
        ),
        // hintStyle: AppStyle.textFieldHintStyle,
      );
}
