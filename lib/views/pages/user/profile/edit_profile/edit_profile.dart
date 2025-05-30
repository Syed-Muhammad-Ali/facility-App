import 'package:facility_managing/views/widgets/app_bar.dart';
import 'package:facility_managing/views/widgets/app_button.dart';
import 'package:facility_managing/views/widgets/app_textfield.dart';
import 'package:facility_managing/views/widgets/extension_sizebox.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final nameCtrl = TextEditingController();
  final surNameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final phoneNoCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBackAppBar(title: "Edit Info"),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            2.hSpace(context),
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
