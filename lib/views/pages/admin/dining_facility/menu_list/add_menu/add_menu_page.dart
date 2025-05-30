// ignore_for_file: deprecated_member_use, use_build_context_synchronously, avoid_print

import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:facility_managing/res/constants/app_colors.dart';
import 'package:facility_managing/views/widgets/app_bar.dart';
import 'package:facility_managing/views/widgets/app_button.dart';
import 'package:facility_managing/views/widgets/app_dropdown.dart';
import 'package:facility_managing/views/widgets/app_text.dart';
import 'package:facility_managing/views/widgets/app_textfield.dart';
import 'package:facility_managing/views/widgets/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class AddMenuPage extends StatefulWidget {
  const AddMenuPage({super.key});

  @override
  State<AddMenuPage> createState() => _AddMenuPageState();
}

class _AddMenuPageState extends State<AddMenuPage> {
  final titleCtrl = TextEditingController();
  final shortDesCtrl = TextEditingController();
  final addNoCtrl = TextEditingController();
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
      appBar: CustomBackAppBar(title: "Add New Menu"),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            4.hSpace(context),
            Center(
              child: AppText(
                "Add Details of the Menu Listing as much as you can ",
                fontSize: 12,
                fontFamily: AppFontFamily.roboto,
                color: AppColors.grey,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
              ),
            ),
            4.hSpace(context),
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
                                fontFamily: AppFontFamily.roboto,
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
              hint: "Title",
              ctr: titleCtrl,
              textInputType: TextInputType.name,
              autofillHints: const [AutofillHints.name],
            ),
            1.hSpace(context),
            AppTextfield(
              hint: "Short Description",
              ctr: shortDesCtrl,
              textInputType: TextInputType.text,
              autofillHints: const [AutofillHints.name],
            ),
            1.hSpace(context),
            AppDropdown(
              items: ['Monday', 'Tuesday', 'Wednesday'],
              initialValue: 'Monday',
              onChanged: (val) {
                print('Selected: $val');
              },
            ),
            2.hSpace(context),
            AppTextfield(
              hint: "\$00.00",
              ctr: addNoCtrl,
              textInputType: TextInputType.number,
              autofillHints: const [AutofillHints.telephoneNumber],
            ),
            6.hSpace(context),
            AppButton.primary(context, buttonText: 'Add ', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
