// ignore_for_file: deprecated_member_use

import 'package:facility_managing/res/constants/app_colors.dart';
import 'package:facility_managing/views/widgets/app_bar.dart';
import 'package:facility_managing/views/widgets/app_button.dart';
import 'package:facility_managing/views/widgets/app_container.dart';
import 'package:facility_managing/views/widgets/app_dropdown.dart';
import 'package:facility_managing/views/widgets/app_text.dart';
import 'package:facility_managing/views/widgets/app_textfield.dart';
import 'package:facility_managing/views/widgets/extension_sizebox.dart';
import 'package:flutter/material.dart';

class ChaplainSingup extends StatefulWidget {
  const ChaplainSingup({super.key});

  @override
  State<ChaplainSingup> createState() => _ChaplainSingupState();
}

class _ChaplainSingupState extends State<ChaplainSingup> {
  final nameCtrl = TextEditingController();
  final surNameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final phoneNoCtrl = TextEditingController();
  bool showDetails = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBackAppBar(title: "Church Services Details"),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _tabButton("Sign Up", showDetails, () {
                  setState(() => showDetails = true);
                }),
                2.wSpace(context),
                _tabButton("Team", !showDetails, () {
                  setState(() => showDetails = false);
                }),
              ],
            ),
            2.hSpace(context),
            Expanded(child: showDetails ? _buildSignUpTab() : _buildTeamTab()),
          ],
        ),
      ),
    );
  }

  Widget _tabButton(String title, bool selected, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 42,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: selected ? AppColors.primary : Color(0xffEFEFEF),
            borderRadius: BorderRadius.circular(8),
          ),
          child: AppText(
            title,
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: selected ? AppColors.white : AppColors.grey,
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpTab() {
    return Column(
      children: [
        2.hSpace(context),
        AppTextfield(
          hint: "Name",
          ctr: nameCtrl,
          textInputType: TextInputType.name,
          autofillHints: const [AutofillHints.name],
        ),
        AppTextfield(
          hint: "Enter Full Name",
          ctr: surNameCtrl,
          textInputType: TextInputType.name,
          autofillHints: const [AutofillHints.nameSuffix],
        ),
        AppTextfield(
          hint: "Enter Email",
          ctr: emailCtrl,
          textInputType: TextInputType.emailAddress,
          autofillHints: const [AutofillHints.email],
        ),
        AppTextfield(
          hint: "Enter Phone Number",
          ctr: phoneNoCtrl,
          textInputType: TextInputType.phone,
          autofillHints: const [AutofillHints.telephoneNumber],
        ),
        0.5.hSpace(context),
        AppDropdown(
          items: ['ABC', 'Any', 'Other'],
          initialValue: 'ABC',
          hintText: 'Select Service Type',
          onChanged: (val) {
            print('Selected: $val');
          },
        ),
        Spacer(),
        AppButton.primary(context, buttonText: 'Sign Up ', onPressed: () {}),
        2.hSpace(context),
      ],
    );
  }

  Widget _buildTeamTab() {
    return Column(
      children: [
        2.hSpace(context),
        AppDropdown(
          items: ['Option 1', 'Option 2', 'Option 3'],
          hintText: 'Select Service Type',
          backgroundColor: AppColors.white,
          borderColor: AppColors.borderColor,
          hintColor: AppColors.grey,
          textColor: AppColors.black.withOpacity(0.40),
          borderRadius: 8,
          onChanged: (val) {
            print('Selected: $val');
          },
        ),
        2.hSpace(context),
        ...List.generate(5, (index) {
          return AppContainer(
            borderRadius: BorderRadius.circular(16),
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.all(6),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/pic11.png',
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                2.wSpace(context),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        "Marry Jane",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textColor,
                      ),
                      0.5.hSpace(context),
                      AppText(
                        "400 Broome St, New York, NY 10013, USA",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor,
                      ),
                      1.hSpace(context),
                      AppText(
                        "Service Type",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor.withOpacity(0.70),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}
