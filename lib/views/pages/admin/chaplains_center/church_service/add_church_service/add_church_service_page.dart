import 'package:facility_managing/views/widgets/app_bar.dart';
import 'package:facility_managing/views/widgets/app_button.dart';
import 'package:facility_managing/views/widgets/app_textfield.dart';
import 'package:facility_managing/views/widgets/extension_sizebox.dart';
import 'package:facility_managing/views/widgets/pick_DateTime.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddChurchServicePage extends StatefulWidget {
  const AddChurchServicePage({super.key});

  @override
  State<AddChurchServicePage> createState() => _AddChurchServicePageState();
}

class _AddChurchServicePageState extends State<AddChurchServicePage> {
  final titleCtrl = TextEditingController();
  final dateCtrl = TextEditingController();
  final locationCtrl = TextEditingController();
  final detailsCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBackAppBar(title: "Add Service"),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            2.hSpace(context),
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
              hint: "Location",
              ctr: locationCtrl,
              textInputType: TextInputType.streetAddress,
              autofillHints: const [AutofillHints.location],
            ),
            1.hSpace(context),
            AppTextfield(
              hint: "Description",
              ctr: detailsCtrl,
              textInputType: TextInputType.multiline,
              autofillHints: const [AutofillHints.name],
              maximumLines: 8,
              minimumLines: 8,
            ),
            Spacer(),
            AppButton.primary(context, buttonText: 'Send ', onPressed: () {}),
            2.hSpace(context),
          ],
        ),
      ),
    );
  }
}
