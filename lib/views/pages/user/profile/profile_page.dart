import 'dart:io';

import 'package:facility_managing/res/constants/app_colors.dart';
import 'package:facility_managing/res/routes/routes_name.dart';
import 'package:facility_managing/views/pages/user/profile/components/image_profile.dart';
import 'package:facility_managing/views/widgets/app_text.dart';
import 'package:facility_managing/views/widgets/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final List<Map<String, dynamic>> settingsOptions = [];
  File? imageFile;

  @override
  void initState() {
    super.initState();

    settingsOptions.addAll([
      {
        "icon": "assets/icons/user.svg",
        "title": "Edit Info",
        "onTap": () {
          Get.toNamed(RouteName.editProfile);
        },
      },
      {
        "icon": "assets/icons/lock.svg",
        "title": "Change Password",
        "onTap": () {
          Get.toNamed(RouteName.changePassword);
        },
      },
      {
        "icon": "assets/icons/delete.svg",
        "title": "Delete Account",
        "onTap": () {},
      },
      {"icon": "assets/icons/logout.svg", "title": "Log out", "onTap": () {}},
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            8.hSpace(context),
            // Center(child: ImageProfile(editProfileCtrl: editProfileCtrl)),
            Center(
              child: ImageProfile(
                imageFile: imageFile,
                onImagePicked: (file) {
                  setState(() {
                    imageFile = file;
                  });
                },
              ),
            ),
            2.hSpace(context),
            AppText(
              "Esther Howard",
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),

            ListView.separated(
              itemCount: settingsOptions.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder:
                  (context, index) =>
                      Divider(color: AppColors.black.withOpacity(.10)),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: SvgPicture.asset(settingsOptions[index]["icon"]!),
                  title: AppText(
                    settingsOptions[index]["title"]!,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontFamily: AppFontFamily.poppins,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: AppColors.primary,
                  ),
                  onTap: settingsOptions[index]["onTap"],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
