import 'package:facility_managing/res/constants/app_colors.dart';
import 'package:facility_managing/views/widgets/app_bar.dart';
import 'package:facility_managing/views/widgets/app_text.dart';
import 'package:facility_managing/views/widgets/extension_sizebox.dart';
import 'package:flutter/material.dart';

class EventDetailsPage extends StatefulWidget {
  const EventDetailsPage({super.key});

  @override
  State<EventDetailsPage> createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBackAppBar(title: "Event Details"),
      body: Builder(
        builder: (context) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.asset(
                    "assets/images/pic10.png",
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                3.hSpace(context),
                AppText(
                  "Event Name",
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
              ],
            ),
          );
        },
      ),
    );
  }
}
