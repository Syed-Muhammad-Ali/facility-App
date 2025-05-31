// ignore_for_file: deprecated_member_use

import 'package:facility_managing/res/constants/app_colors.dart';
import 'package:facility_managing/res/routes/routes_name.dart';
import 'package:facility_managing/views/widgets/app_button.dart';
import 'package:facility_managing/views/widgets/app_text.dart';
import 'package:facility_managing/views/widgets/app_textfield.dart';
import 'package:facility_managing/views/widgets/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            10.hSpace(context),
            Center(
              child: Image.asset(
                "assets/images/logo.png",
                width: 90,
                height: 90,
              ),
            ),
            2.hSpace(context),
            AppText(
              "WCamp Reedo",
              fontSize: 24,
              fontFamily: AppFontFamily.roboto,
              fontWeight: FontWeight.w500,
              color: AppColors.primary,
            ),
            8.hSpace(context),
            AppText(
              "Sign In",
              fontSize: 18,
              fontFamily: AppFontFamily.roboto,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
            4.hSpace(context),
            AppTextfield(
              hint: "Email",
              ctr: emailCtrl,
              textInputType: TextInputType.emailAddress,
              autofillHints: const [AutofillHints.email],
            ),
            2.hSpace(context),
            AppTextfield(
              hint: "Password",
              ctr: passwordCtrl,
              autofillHints: const [AutofillHints.password],
              textInputType: TextInputType.visiblePassword,
              isPasswordField: true,
            ),
            1.hSpace(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppText(
                  "Forgot password ? Reset now",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.primary,
                  fontFamily: AppFontFamily.roboto,
                ),
              ],
            ),
            4.hSpace(context),
            AppButton.primary(
              context,
              buttonText: 'Sign In',
              onPressed: () {
                if (emailCtrl.text == "admin@gmail.com" &&
                    passwordCtrl.text == "123") {
                  Get.toNamed(RouteName.homePage);
                } else {
                  Get.toNamed(RouteName.bnbPage);
                }
              },
            ),
            2.hSpace(context),
            AppButton.primary(
              context,
              onPressed: () {
                Get.toNamed(RouteName.signUpPage);
              },
              // isShadow: true,
              buttonText: 'Sign Up',
              textColor: AppColors.primary,
              buttoncolor: AppColors.primary.withOpacity(.20),
            ),
          ],
        ),
      ),
    );
  }
}
