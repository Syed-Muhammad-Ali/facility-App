// ignore_for_file: deprecated_member_use

import 'package:facility_managing/res/constants/app_colors.dart';
import 'package:facility_managing/res/routes/routes_name.dart';
import 'package:facility_managing/views/widgets/app_button.dart';
import 'package:facility_managing/views/widgets/app_text.dart';
import 'package:facility_managing/views/widgets/app_textfield.dart';
import 'package:facility_managing/views/widgets/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameCtrl = TextEditingController();
  final surNameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final phoneNoCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final confrimPassCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            4.hSpace(context),
            Center(
              child: Image.asset(
                "assets/images/logo.png",
                width: 70,
                height: 70,
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
            4.hSpace(context),
            AppText(
              "Sign Up",
              fontSize: 18,
              fontFamily: AppFontFamily.roboto,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
            4.hSpace(context),
            AppTextfield(
              hint: "Name",
              ctr: nameCtrl,
              textInputType: TextInputType.name,
              autofillHints: const [AutofillHints.name],
            ),
            AppTextfield(
              hint: "Surname",
              ctr: surNameCtrl,
              textInputType: TextInputType.name,
              autofillHints: const [AutofillHints.nameSuffix],
            ),
            AppTextfield(
              hint: "Email",
              ctr: emailCtrl,
              textInputType: TextInputType.emailAddress,
              autofillHints: const [AutofillHints.email],
            ),
            AppTextfield(
              hint: "Phone Number",
              ctr: phoneNoCtrl,
              textInputType: TextInputType.phone,
              autofillHints: const [AutofillHints.telephoneNumber],
            ),
            // 2.hSpace(context),
            AppTextfield(
              hint: "Password",
              ctr: passwordCtrl,
              autofillHints: const [AutofillHints.password],
              textInputType: TextInputType.visiblePassword,
              isPasswordField: true,
            ),
            AppTextfield(
              hint: "Confirm Password",
              ctr: confrimPassCtrl,
              autofillHints: const [AutofillHints.password],
              textInputType: TextInputType.visiblePassword,
              isPasswordField: true,
            ),
            4.hSpace(context),
            AppButton.primary(context, buttonText: 'Sign Up', onPressed: () {}),
            2.hSpace(context),
            AppButton.primary(
              context,
              onPressed: () {
                Get.toNamed(RouteName.signInPage);
              },
              // isShadow: true,
              buttonText: 'Sign In',
              textColor: AppColors.primary,
              buttoncolor: AppColors.primary.withOpacity(.20),
            ),
            2.hSpace(context),
          ],
        ),
      ),
    );
  }
}
