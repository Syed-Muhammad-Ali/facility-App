import 'package:facility_managing/res/constants/app_colors.dart';
import 'package:facility_managing/views/widgets/app_bar.dart';
import 'package:facility_managing/views/widgets/app_button.dart';
import 'package:facility_managing/views/widgets/app_text.dart';
import 'package:facility_managing/views/widgets/app_textfield.dart';
import 'package:facility_managing/views/widgets/extension_sizebox.dart';
import 'package:flutter/material.dart';

class UserFeedback extends StatefulWidget {
  const UserFeedback({super.key});

  @override
  State<UserFeedback> createState() => _UserFeedbackState();
}

class _UserFeedbackState extends State<UserFeedback> {
  final feedbackCtrl = TextEditingController();
  final Map<String, String> _answers = {};

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'How much are you satisfied with our taste?',
      'options': ['Very Much', 'Fairly', 'Not Much'],
    },
    {
      'question': 'How much are you satisfied with our Waiters?',
      'options': ['Very Much', 'Fairly', 'Not Much'],
    },
    {
      'question': 'How much are you satisfied with our Waiters?',
      'options': ['Very Much', 'Fairly', 'Not Much'],
    },
    {
      'question': 'Rating you would like to give.',
      'options': ['5 Star', '4 Star', '3 Star', 'Less than 3 Star'],
    },
  ];

  void _onOptionSelected(String question, String selectedOption) {
    setState(() {
      _answers[question] = selectedOption;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBackAppBar(title: "Feedback"),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: AlwaysScrollableScrollPhysics(),
                itemCount: _questions.length,
                itemBuilder: (context, index) {
                  final questionData = _questions[index];
                  final question = questionData['question'];
                  final options = questionData['options'] as List<String>;
                  final selected = _answers[question];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        question,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      ...options.map((option) {
                        return Transform.scale(
                          scale: 1,
                          child: RadioListTile<String>(
                            value: option,
                            groupValue: selected,
                            title: AppText(
                              option,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),

                            onChanged:
                                (value) =>
                                    _onOptionSelected(question, value ?? ''),
                            activeColor: AppColors.primary,
                            contentPadding: EdgeInsets.zero,
                            dense: true,
                            visualDensity: VisualDensity(
                              horizontal: -4,
                              vertical: -4,
                            ),
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        );
                      }),
                      2.hSpace(context),
                    ],
                  );
                },
              ),
              1.hSpace(context),
              AppText(
                "Any Suggestions",
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.black,
              ),
              1.hSpace(context),
              AppTextfield(
                hint:
                    "Any Recommendation to make anything better describe here....",
                hintColor: AppColors.grey,
                ctr: feedbackCtrl,
                maximumLines: 8,
                minimumLines: 8,
                hintSize: 8,
                filledColor: Colors.transparent,
                borderColor: AppColors.grey,
                textInputType: TextInputType.text,
                autofillHints: const [AutofillHints.name],
              ),
              3.hSpace(context),
              AppButton.primary(
                context,
                onPressed: () {
                  // Get.toNamed(RouteName.signUpPage);
                },
                // isShadow: true,
                buttonText: 'Submit',
              ),
              3.hSpace(context),
            ],
          ),
        ),
      ),
    );
  }
}
