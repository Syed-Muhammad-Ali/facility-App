import 'package:facility_managing/res/routes/routes.dart';
import 'package:facility_managing/res/routes/routes_name.dart';
import 'package:facility_managing/res/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      initialRoute: RouteName.splashPage,
      getPages: AppRoutes.appRoutes(),
    );
  }
}
