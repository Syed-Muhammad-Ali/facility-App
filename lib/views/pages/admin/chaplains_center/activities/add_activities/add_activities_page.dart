import 'package:facility_managing/views/widgets/app_bar.dart';
import 'package:facility_managing/views/widgets/app_button.dart';
import 'package:facility_managing/views/widgets/app_textfield.dart';
import 'package:facility_managing/views/widgets/extension_sizebox.dart';
import 'package:facility_managing/views/widgets/pick_DateTime.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddActivitiesPage extends StatefulWidget {
  const AddActivitiesPage({super.key});

  @override
  State<AddActivitiesPage> createState() => _AddActivitiesPageState();
}

class _AddActivitiesPageState extends State<AddActivitiesPage> {
  final titleCtrl = TextEditingController();
  final dateCtrl = TextEditingController();
  final timeCtrl = TextEditingController();
  final detailsCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBackAppBar(title: "Add Activity"),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            AppTextfield(
              hint: "Enter Title",
              ctr: titleCtrl,
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
            AppTextfield(
              hint: "Time",
              ctr: timeCtrl,
              readOnly: true,
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
            1.hSpace(context),
            AppTextfield(
              hint: "Activity Details here...",
              ctr: detailsCtrl,
              textInputType: TextInputType.multiline,
              autofillHints: const [AutofillHints.name],
              maximumLines: 8,
              minimumLines: 8,
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
