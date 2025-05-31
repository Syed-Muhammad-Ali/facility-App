import 'package:facility_managing/views/widgets/app_bar.dart';
import 'package:facility_managing/views/widgets/app_button.dart';
import 'package:facility_managing/views/widgets/app_textfield.dart';
import 'package:facility_managing/views/widgets/extension_sizebox.dart';
import 'package:facility_managing/views/widgets/pick_DateTime.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddSchedulePage extends StatefulWidget {
  const AddSchedulePage({super.key});

  @override
  State<AddSchedulePage> createState() => _AddSchedulePageState();
}

class _AddSchedulePageState extends State<AddSchedulePage> {
  final busNoCtrl = TextEditingController();
  final pointCtrl = TextEditingController();
  final disPointCtrl = TextEditingController();
  final dateCtrl = TextEditingController();
  final timeCtrl = TextEditingController();
  final detailsCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBackAppBar(title: "Add New Schedule"),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            AppTextfield(
              hint: "Bus Number",
              ctr: busNoCtrl,
              textInputType: TextInputType.number,
              autofillHints: const [AutofillHints.telephoneNumber],
            ),
            1.hSpace(context),
            AppTextfield(
              hint: "Starting Point",
              ctr: pointCtrl,
              textInputType: TextInputType.text,
              autofillHints: const [AutofillHints.name],
            ),

            1.hSpace(context),
            AppTextfield(
              hint: "Time",
              ctr: timeCtrl,
              textInputType: TextInputType.datetime,
              readOnly: true,
              onTap: () async {
                await pickTime(context, timeCtrl);
              },
              autofillHints: const [AutofillHints.oneTimeCode],
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 12),
                child: SvgPicture.asset("assets/icons/time.svg"),
              ),
            ),
            1.hSpace(context),
            AppTextfield(
              hint: "Destination Point",
              ctr: disPointCtrl,
              textInputType: TextInputType.text,
              autofillHints: const [AutofillHints.name],
            ),
            1.hSpace(context),
            AppTextfield(
              hint: "Time",
              ctr: timeCtrl,
              onTap: () async {
                await pickTime(context, timeCtrl);
              },
              textInputType: TextInputType.datetime,
              autofillHints: const [AutofillHints.oneTimeCode],
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 12),
                child: SvgPicture.asset("assets/icons/time.svg"),
              ),
            ),
            Spacer(),
            AppButton.primary(context, buttonText: 'Add ', onPressed: () {}),
            2.hSpace(context),
          ],
        ),
      ),
    );
  }
}
