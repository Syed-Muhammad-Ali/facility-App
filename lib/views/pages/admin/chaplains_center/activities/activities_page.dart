import 'package:facility_managing/res/constants/app_colors.dart';
import 'package:facility_managing/res/routes/routes_name.dart';
import 'package:facility_managing/views/widgets/app_bar.dart';
import 'package:facility_managing/views/widgets/app_container.dart';
import 'package:facility_managing/views/widgets/app_text.dart';
import 'package:facility_managing/views/widgets/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage({super.key});

  @override
  State<ActivitiesPage> createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
  final List<ActivityItem> activities = List.generate(
    5,
    (index) => ActivityItem(
      title: 'Activity Name',
      description:
          'Lorem ipsum dolor sit amet consectetur. Rhoncus pellentesque mi ac neque pulvinar ultrices. Mauris imperdiet bibendum pretium aliquet pellentesque ultricies feugiat.',
      dateTime: '20/02/2025, 5:30 PM',
      svgIconPath: 'assets/icons/activities.svg',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBackAppBar(
        title: "Activities",
        showAction: true,
        iconTab: () {
          Get.toNamed(RouteName.addActivitiesPage);
        },
      ),

      body: Column(
        children: [
          2.hSpace(context),
          Expanded(
            child: ListView.builder(
              itemCount: activities.length,
              itemBuilder: (context, index) {
                final activity = activities[index];
                return AppContainer(
                  borderRadius: BorderRadius.circular(8),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Top row: Icon, Title, 3-dot menu
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            activity.svgIconPath,
                            // height: 24,
                            // width: 24,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: AppText(
                              activity.title,
                              fontSize: 12,
                              fontFamily: AppFontFamily.roboto,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ),
                          const Icon(Icons.more_vert),
                        ],
                      ),
                      const SizedBox(height: 8),
                      AppText(
                        activity.description,
                        fontSize: 10,
                        fontFamily: AppFontFamily.roboto,
                        fontWeight: FontWeight.w400,
                        color: AppColors.darkGrey,
                      ),
                      const SizedBox(height: 12),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: AppText(
                          activity.dateTime,
                          fontSize: 10,
                          fontFamily: AppFontFamily.roboto,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black.withOpacity(0.36),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ActivityItem {
  final String title;
  final String description;
  final String dateTime;
  final String svgIconPath;

  ActivityItem({
    required this.title,
    required this.description,
    required this.dateTime,
    required this.svgIconPath,
  });
}
