import 'package:facility_managing/views/widgets/app_bar.dart';
import 'package:facility_managing/views/widgets/app_button.dart';
import 'package:facility_managing/views/widgets/app_dropdown.dart';
import 'package:facility_managing/views/widgets/app_textfield.dart';
import 'package:facility_managing/views/widgets/extension_sizebox.dart';
import 'package:flutter/material.dart';

class AddAnnouncementPage extends StatefulWidget {
  const AddAnnouncementPage({super.key});

  @override
  State<AddAnnouncementPage> createState() => _AddAnnouncementPageState();
}

class _AddAnnouncementPageState extends State<AddAnnouncementPage> {
  final titleCtrl = TextEditingController();
  final detailsCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBackAppBar(title: "Add an Announcement"),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            AppTextfield(
              hint: "Enter Title",
              ctr: titleCtrl,
              textInputType: TextInputType.name,
              autofillHints: const [AutofillHints.name],
            ),

            1.hSpace(context),
            AppDropdown(
              items: ['ABC', 'Any', 'Other'],
              initialValue: 'ABC',
              hintText: 'Select Service Type',
              onChanged: (val) {
                print('Selected: $val');
              },
            ),
            3.hSpace(context),
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
