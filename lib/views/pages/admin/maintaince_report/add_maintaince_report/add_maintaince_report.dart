import 'package:facility_managing/res/constants/app_colors.dart';
import 'package:facility_managing/views/widgets/app_bar.dart';
import 'package:facility_managing/views/widgets/app_button.dart';
import 'package:facility_managing/views/widgets/app_textfield.dart';
import 'package:facility_managing/views/widgets/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddMaintainceReport extends StatefulWidget {
  const AddMaintainceReport({super.key});

  @override
  State<AddMaintainceReport> createState() => _AddMaintainceReportState();
}

class _AddMaintainceReportState extends State<AddMaintainceReport> {
  final nameCtrl = TextEditingController();
  final fixCtrl = TextEditingController();
  final dateCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBackAppBar(title: "Maintenance Report"),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            4.hSpace(context),
            AppTextfield(
              hint: "Full Name",
              ctr: nameCtrl,
              textInputType: TextInputType.name,
              autofillHints: const [AutofillHints.name],
            ),
            1.hSpace(context),
            AppTextfield(
              hint: "What need to be fix",
              ctr: fixCtrl,
              textInputType: TextInputType.name,
              autofillHints: const [AutofillHints.name],
            ),
            1.hSpace(context),
            AppTextfield(
              hint: "What need to be fix",
              ctr: fixCtrl,
              textInputType: TextInputType.name,
              autofillHints: const [AutofillHints.name],
            ),
            1.hSpace(context),
            AppTextfield(
              hint: "What need to be fix",
              ctr: fixCtrl,
              textInputType: TextInputType.name,
              autofillHints: const [AutofillHints.name],
            ),
            1.hSpace(context),
            AppTextfield(
              hint: "Date",
              ctr: dateCtrl,
              textInputType: TextInputType.datetime,
              autofillHints: const [AutofillHints.oneTimeCode],
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 12),
                child: SvgPicture.asset(
                  "assets/icons/date.svg",
                  color: AppColors.primary,
                ),
              ),
            ),
            Spacer(),
            AppButton.primary(context, buttonText: 'Report ', onPressed: () {}),
            2.hSpace(context),
          ],
        ),
      ),
    );
  }
}
