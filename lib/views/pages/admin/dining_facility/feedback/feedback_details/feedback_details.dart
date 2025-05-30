import 'package:facility_managing/res/constants/app_colors.dart';
import 'package:facility_managing/views/widgets/app_bar.dart';
import 'package:facility_managing/views/widgets/app_text.dart';
import 'package:flutter/material.dart';

class FeedbackDetails extends StatelessWidget {
  const FeedbackDetails({super.key});

  final String question = "How much are you satisfied with our taste?";
  final String description =
      "Fresh and invigorating flavors straight from the garden! Try adding a splash of citrus to enhance the brightness of the dish.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBackAppBar(title: "Feedback"),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.separated(
              itemCount: 4,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              separatorBuilder:
                  (_, __) => const Divider(height: 24, thickness: 1),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      question,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: AppFontFamily.roboto,
                      color: AppColors.black,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: const [
                        Icon(Icons.circle, color: AppColors.primary, size: 16),
                        SizedBox(width: 8),
                        AppText(
                          "Very Much",
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
            const Divider(height: 20, thickness: 1),
            AppText(
              "Description",
              fontSize: 12,
              fontWeight: FontWeight.w600,
              fontFamily: AppFontFamily.roboto,
              color: AppColors.black,
            ),
            const SizedBox(height: 8),
            AppText(
              description,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              fontFamily: AppFontFamily.roboto,
              color: AppColors.black,
            ),
          ],
        ),
      ),
    );
  }
}
