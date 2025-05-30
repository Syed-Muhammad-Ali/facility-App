import 'package:facility_managing/res/constants/app_colors.dart';
import 'package:facility_managing/views/widgets/app_bar.dart';
import 'package:facility_managing/views/widgets/app_button.dart';
import 'package:facility_managing/views/widgets/app_textfield.dart';
import 'package:facility_managing/views/widgets/extension_sizebox.dart';
import 'package:facility_managing/views/widgets/pick_DateTime.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddBookingPage extends StatefulWidget {
  const AddBookingPage({super.key});

  @override
  State<AddBookingPage> createState() => _AddBookingPageState();
}

class _AddBookingPageState extends State<AddBookingPage> {
  final nameCtrl = TextEditingController();
  final dateCtrl = TextEditingController();
  final startTimeCtrl = TextEditingController();
  final endTimeCtrl = TextEditingController();
  final purposeCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBackAppBar(title: "Book a Room"),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            2.hSpace(context),
            AppTextfield(
              hint: "Full Name",
              ctr: nameCtrl,
              textInputType: TextInputType.name,
              autofillHints: const [AutofillHints.name],
            ),
            1.hSpace(context),
            AppTextfield(
              hint: "Write the Purpose",
              ctr: purposeCtrl,
              textInputType: TextInputType.name,
              autofillHints: const [AutofillHints.name],
            ),
            1.hSpace(context),
            AppTextfield(
              hint: "Date",
              ctr: dateCtrl,
              readOnly: true,
              onTap: () async {
                await pickDate(context, dateCtrl);
              },
              textInputType: TextInputType.datetime,
              autofillHints: const [AutofillHints.oneTimeCode],
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 12),
                child: SvgPicture.asset("assets/icons/date.svg"),
              ),
            ),
            1.hSpace(context),
            Row(
              children: [
                Expanded(
                  child: AppTextfield(
                    hint: "Start Time",
                    ctr: startTimeCtrl,
                    readOnly: true,
                    onTap: () async {
                      await pickTime(context, startTimeCtrl);
                    },
                    textInputType: TextInputType.datetime,
                    autofillHints: const [AutofillHints.oneTimeCode],
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: SvgPicture.asset(
                        "assets/icons/time.svg",
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
                2.wSpace(context),
                Expanded(
                  child: AppTextfield(
                    hint: "End Time",
                    ctr: endTimeCtrl,
                    readOnly: true,
                    onTap: () async {
                      await pickTime(context, endTimeCtrl);
                    },
                    textInputType: TextInputType.datetime,
                    autofillHints: const [AutofillHints.oneTimeCode],
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: SvgPicture.asset(
                        "assets/icons/time.svg",
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            AppButton.primary(context, buttonText: 'Book', onPressed: () {}),
            2.hSpace(context),
          ],
        ),
      ),
    );
  }
}
