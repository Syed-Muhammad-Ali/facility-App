// ignore_for_file: library_prefixes, non_constant_identifier_names, avoid_print, unnecessary_null_comparison, deprecated_member_use, use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import 'package:path_provider/path_provider.dart';

class ImageProfile extends StatelessWidget {
  final File? imageFile;
  final Function(File) onImagePicked;

  const ImageProfile({
    super.key,
    required this.imageFile,
    required this.onImagePicked,
  });

  Future<void> _pickImage(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final picked = await showModalBottomSheet<XFile?>(
      context: context,
      builder: (_) {
        return Container(
          height: 140,
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text("Take photo"),
                onTap: () async {
                  Navigator.pop(
                    context,
                    await picker.pickImage(source: ImageSource.camera),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text("Choose from gallery"),
                onTap: () async {
                  Navigator.pop(
                    context,
                    await picker.pickImage(source: ImageSource.gallery),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.close),
                title: const Text("Cancel"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );

    if (picked != null) {
      final permanentFile = await _saveImagePermanently(picked.path);
      onImagePicked(permanentFile);
    }
  }

  Future<File> _saveImagePermanently(String path) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = Path.basename(path);
    final image = File('${directory.path}/$name');
    return File(path).copy(image.path);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child:
              imageFile != null
                  ? Image.file(
                    imageFile!,
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                  )
                  : Image.asset(
                    'assets/images/profile.png',
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
        ),
        Positioned(
          bottom: -6,
          right: -6,
          child: GestureDetector(
            onTap: () => _pickImage(context),
            child: SvgPicture.asset(
              'assets/icons/profile_edit.svg',

              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}
