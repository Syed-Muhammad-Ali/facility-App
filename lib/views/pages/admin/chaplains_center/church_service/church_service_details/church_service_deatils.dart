import 'package:facility_managing/res/constants/app_colors.dart';
import 'package:facility_managing/views/widgets/app_bar.dart';
import 'package:facility_managing/views/widgets/app_container.dart';
import 'package:facility_managing/views/widgets/app_text.dart';
import 'package:facility_managing/views/widgets/extension_sizebox.dart';
import 'package:flutter/material.dart';

class ChurchServiceDetails extends StatefulWidget {
  const ChurchServiceDetails({super.key});

  @override
  State<ChurchServiceDetails> createState() => _ChurchServiceDetailsState();
}

class _ChurchServiceDetailsState extends State<ChurchServiceDetails> {
  bool showDetails = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBackAppBar(
        title: "Church Services Details",
        showAction: true,
        iconPath:
            showDetails ? "assets/icons/dotted.svg" : "assets/icons/add.svg",
        iconTab: () {
          if (showDetails) {
            // action when add icon tapped
          } else {
            // action when dotted icon tapped
          }
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _tabButton("Details", showDetails, () {
                  setState(() => showDetails = true);
                }),
                2.wSpace(context),
                _tabButton("Announcement", !showDetails, () {
                  setState(() => showDetails = false);
                }),
              ],
            ),
            2.hSpace(context),
            Expanded(
              child: showDetails ? _buildDetailsTab() : _buildAnnouncementTab(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabButton(String title, bool selected, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 42,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: selected ? AppColors.primary : Color(0xffEFEFEF),
            borderRadius: BorderRadius.circular(8),
          ),
          child: AppText(
            title,
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: selected ? AppColors.white : AppColors.grey,
          ),
        ),
      ),
    );
  }

  Widget _buildDetailsTab() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            "Service Name",
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
          1.hSpace(context),
          AppText(
            "27/02/2025, 2:10 PM",
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.darkGrey,
          ),
          1.hSpace(context),
          AppText(
            "400 Broome St, New York, NY 10013, USA",
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.darkGrey,
          ),
          1.hSpace(context),
          AppText(
            "Lorem ipsum dolor sit amet consectetur. Rhoncus pellentesque mi ac neque pulvinar ultrices. Mauris imperdiet bibendum pretium aliquet pellentesque ultricies feugiat. \n\n Lorem ipsum dolor sit amet consectetur. Rhoncus pellentesque mi ac neque pulvinar ultrices. Mauris imperdiet bibendum pretium aliquet pellentesque ultricies feugiat.",
            fontSize: 14,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.w400,
            color: AppColors.textColor,
          ),
          2.hSpace(context),
          AppText(
            "People who sign up for this service",
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
          const SizedBox(height: 12),
          ...List.generate(3, (index) {
            return AppContainer(
              borderRadius: BorderRadius.circular(8),
              margin: const EdgeInsets.only(bottom: 10),
              // padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/pic11.png',
                      width: 50,
                      height: 50,
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
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildAnnouncementTab() {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return AppContainer(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(14),
          borderRadius: BorderRadius.circular(8),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: AppText(
                      "Title",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                  ),
                  Icon(Icons.more_vert),
                ],
              ),
              1.hSpace(context),
              AppText(
                "Lorem ipsum dolor sit amet consectetur. Rhoncus pellentesque mi ac neque pulvinar ultrices. Mauris imperdiet bibendum pretium aliquet pellentesque ultricies feugiat.",
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: AppColors.desColor,
              ),
            ],
          ),
        );
      },
    );
  }
}
