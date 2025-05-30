// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:facility_managing/res/constants/app_colors.dart';
import 'package:facility_managing/views/widgets/app_bar.dart';
import 'package:facility_managing/views/widgets/app_button.dart';
import 'package:facility_managing/views/widgets/app_text.dart';
import 'package:facility_managing/views/widgets/app_textfield.dart';
import 'package:facility_managing/views/widgets/extension_sizebox.dart';
import 'package:facility_managing/views/widgets/pick_DateTime.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({super.key});

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  final titleCtrl = TextEditingController();
  final dateCtrl = TextEditingController();
  final timeCtrl = TextEditingController();
  final detailsCtrl = TextEditingController();
  File? _imageFile;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(
      source: source,
      imageQuality: 80,
    );
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
    Navigator.pop(context);
  }

  void _showPicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext ctx) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
                onTap: () => _pickImage(ImageSource.camera),
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () => _pickImage(ImageSource.gallery),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBackAppBar(title: "Add Event"),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: _showPicker,
              child: DottedBorder(
                options: RoundedRectDottedBorderOptions(
                  radius: const Radius.circular(1),
                  color: AppColors.primary,
                  strokeWidth: 1,
                  dashPattern: const [6, 4],
                ),
                child: Container(
                  width: double.infinity,
                  height: context.h * 0.18,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.10),
                    borderRadius: BorderRadius.circular(1),
                  ),
                  child:
                      _imageFile == null
                          ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/images/upload_photo.svg",
                              ),
                              1.hSpace(context),
                              AppText(
                                "Upload Photo",
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.primary,
                              ),
                            ],
                          )
                          : ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.file(
                              _imageFile!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: 150,
                            ),
                          ),
                ),
              ),
            ),
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
