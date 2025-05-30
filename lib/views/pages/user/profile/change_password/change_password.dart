import 'package:facility_managing/views/widgets/app_bar.dart';
import 'package:facility_managing/views/widgets/app_button.dart';
import 'package:facility_managing/views/widgets/app_textfield.dart';
import 'package:facility_managing/views/widgets/extension_sizebox.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final currentPassCtrl = TextEditingController();
  final newPassCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBackAppBar(title: "Change Password"),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            2.hSpace(context),
            AppTextfield(
              hint: "Current Password",
              ctr: currentPassCtrl,
              autofillHints: const [AutofillHints.password],
              textInputType: TextInputType.visiblePassword,
              isPasswordField: true,
            ),
            AppTextfield(
              hint: "New Password ",
              ctr: newPassCtrl,
              autofillHints: const [AutofillHints.password],
              textInputType: TextInputType.visiblePassword,
              isPasswordField: true,
            ),
            Spacer(),
            AppButton.primary(
              context,
              onPressed: () {
                // Get.toNamed(RouteName.signInPage);
              },

              buttonText: 'Update',
            ),
            2.hSpace(context),
          ],
        ),
      ),
    );
  }
}
