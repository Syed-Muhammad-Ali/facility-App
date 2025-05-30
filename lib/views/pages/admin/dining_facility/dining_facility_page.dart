import 'package:facility_managing/res/constants/app_colors.dart';
import 'package:facility_managing/res/routes/routes_name.dart';
import 'package:facility_managing/views/widgets/app_bar.dart';
import 'package:facility_managing/views/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiningFacilityPage extends StatefulWidget {
  const DiningFacilityPage({super.key});

  @override
  State<DiningFacilityPage> createState() => _DiningFacilityPageState();
}

class _DiningFacilityPageState extends State<DiningFacilityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBackAppBar(title: "Dinning facility"),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            MenuCard(
              imageUrl: 'assets/images/pic1.png',
              title: 'Menu List',
              onTap: () {
                Get.toNamed(RouteName.menuListPage);
              },
            ),
            MenuCard(
              imageUrl: 'assets/images/pic2.png',
              title: 'Opening Hours',
              onTap: () {
                Get.toNamed(RouteName.openingHoursPage);
              },
            ),
            MenuCard(
              imageUrl: 'assets/images/pic3.png',
              title: 'Feedback',
              onTap: () {
                Get.toNamed(RouteName.feedbackPage);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final bool isSvgIcon;
  final VoidCallback? onTap;

  const MenuCard({
    super.key,
    required this.imageUrl,
    required this.title,
    this.isSvgIcon = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF2F2F2),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.symmetric(vertical: 6),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset(
                  imageUrl,
                  height: 140,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
              ListTile(
                title: AppText(
                  title,
                  fontSize: 16,
                  fontFamily: AppFontFamily.roboto,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textColor,
                ),
                trailing: const Icon(Icons.arrow_forward),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
