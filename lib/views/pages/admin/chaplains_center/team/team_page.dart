// ignore_for_file: deprecated_member_use

import 'package:facility_managing/res/constants/app_colors.dart';
import 'package:facility_managing/views/widgets/app_bar.dart';
import 'package:facility_managing/views/widgets/app_container.dart';
import 'package:facility_managing/views/widgets/app_text.dart';
import 'package:facility_managing/views/widgets/app_textfield.dart';
import 'package:facility_managing/views/widgets/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TeamPage extends StatefulWidget {
  const TeamPage({super.key});

  @override
  State<TeamPage> createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  final searchCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBackAppBar(title: "Team"),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            AppTextfield(
              height: context.h * 0.05,
              hint: "Search Name here...",
              hintColor: AppColors.black.withOpacity(0.40),
              ctr: searchCtrl,
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
            2.hSpace(context),
            ...List.generate(5, (index) {
              return AppContainer(
                borderRadius: BorderRadius.circular(16),
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.all(6),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/pic11.png',
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                    2.wSpace(context),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            "Marry Jane",
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textColor,
                          ),
                          0.5.hSpace(context),
                          AppText(
                            "400 Broome St, New York, NY 10013, USA",
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textColor,
                          ),
                          1.hSpace(context),
                          AppText(
                            "Service Type",
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textColor.withOpacity(0.70),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
