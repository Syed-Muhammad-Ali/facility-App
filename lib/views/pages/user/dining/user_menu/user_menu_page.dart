// ignore_for_file: deprecated_member_use

import 'package:facility_managing/res/constants/app_colors.dart';
import 'package:facility_managing/views/widgets/app_bar.dart';
import 'package:facility_managing/views/widgets/app_container.dart';
import 'package:facility_managing/views/widgets/app_text.dart';
import 'package:facility_managing/views/widgets/app_textfield.dart';
import 'package:facility_managing/views/widgets/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_group_list_view/flutter_group_list_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class UserMenuPage extends StatefulWidget {
  const UserMenuPage({super.key});

  @override
  State<UserMenuPage> createState() => _UserMenuPageState();
}

class _UserMenuPageState extends State<UserMenuPage> {
  final openTimeCtrl = TextEditingController();
  final Map<String, List<MenuItem>> menuData = const {
    'Sunday': [
      MenuItem(
        imageUrl: 'assets/images/pic4.png',
        title: 'Garden Vegetable Salad',
        subtitle: 'Crisp & refreshing from garden',
        price: '\$30',
      ),
      MenuItem(
        imageUrl: 'assets/images/pic4.png',
        title: 'Garden Vegetable Salad',
        subtitle: 'Crisp & refreshing from garden',
        price: '\$30',
      ),
      MenuItem(
        imageUrl: 'hassets/images/pic4.png',
        title: 'Garden Vegetable Salad',
        subtitle: 'Crisp & refreshing from garden',
        price: '\$30',
      ),
      MenuItem(
        imageUrl:
            'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=100&q=80',
        title: 'Garden Vegetable Salad',
        subtitle: 'Crisp & refreshing from garden',
        price: '\$30',
      ),
    ],
    'Monday': [
      MenuItem(
        imageUrl:
            'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=100&q=80',
        title: 'Garden Vegetable Salad',
        subtitle: 'Crisp & refreshing from garden',
        price: '\$30',
      ),
      MenuItem(
        imageUrl:
            'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=100&q=80',
        title: 'Garden Vegetable Salad',
        subtitle: 'Crisp & refreshing from garden',
        price: '\$30',
      ),
    ],
  };

  @override
  Widget build(BuildContext context) {
    final sections = menuData.entries.toList();

    return Scaffold(
      appBar: CustomBackAppBar(
        title: "Menu",
        showAction: true,
        iconPath: "assets/icons/chaplain.svg",
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: AppTextfield(
              height: context.h * 0.05,
              hint: "Search Name here...",
              hintColor: AppColors.black.withOpacity(0.40),
              ctr: openTimeCtrl,
              readOnly: true,
              filledColor: Colors.transparent,
              borderColor: AppColors.desColor,
              textInputType: TextInputType.datetime,
              autofillHints: const [AutofillHints.oneTimeCode],
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 12),
                child: SvgPicture.asset("assets/icons/search.svg"),
              ),
            ),
          ),
          Expanded(
            child: GroupListView(
              sectionCount: sections.length,
              itemInSectionCount: (section) => sections[section].value.length,
              itemInSectionBuilder: (
                BuildContext context,
                IndexPath indexPath,
              ) {
                final item = sections[indexPath.section].value[indexPath.index];
                return AppContainer(
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          "assets/images/pic4.png",
                          height: 72,
                          width: 72,
                          fit: BoxFit.cover,
                        ),
                      ),
                      3.wSpace(context),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              item.title,
                              fontSize: 16,
                              fontFamily: AppFontFamily.roboto,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textColor,
                            ),
                            0.5.hSpace(context),
                            AppText(
                              item.subtitle,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: AppFontFamily.roboto,
                              color: AppColors.textColor,
                            ),
                            1.hSpace(context),
                            AppText(
                              item.price,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: AppFontFamily.roboto,
                              color: AppColors.primary,
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.more_vert, size: 20),
                    ],
                  ),
                );
              },
              headerForSectionBuilder: (int section) {
                final day = sections[section].key;
                return Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                  child: RichText(
                    text: TextSpan(
                      text: 'Specially Planned for ',
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                      children: [
                        TextSpan(
                          text: day,
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder:
                  (IndexPath indexPath) => const SizedBox(height: 0),
            ),
          ),
        ],
      ),
    );
  }
}

class MenuItem {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String price;

  const MenuItem({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.price,
  });
}
