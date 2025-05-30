import 'package:facility_managing/res/constants/app_colors.dart';
import 'package:facility_managing/views/pages/admin/dining_facility/opening_hours/components/dayTimeCard.dart';
import 'package:facility_managing/views/widgets/app_bar.dart';
import 'package:facility_managing/views/widgets/app_button.dart';
import 'package:facility_managing/views/widgets/app_dailog.dart';
import 'package:facility_managing/views/widgets/app_textfield.dart';
import 'package:facility_managing/views/widgets/extension_sizebox.dart';
import 'package:facility_managing/views/widgets/pick_DateTime.dart';
import 'package:facility_managing/views/widgets/toggleRowWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OpeningHoursPage extends StatefulWidget {
  const OpeningHoursPage({super.key});

  @override
  State<OpeningHoursPage> createState() => _OpeningHoursPageState();
}

class _OpeningHoursPageState extends State<OpeningHoursPage> {
  final openTimeCtrl = TextEditingController();
  final closetimeCtrl = TextEditingController();
  bool days = true;
  final List<Map<String, String>> schedule = [
    {'day': 'Monday', 'time': '10:00 AM - 5:30 PM'},
    {'day': 'Tuesday', 'time': '10:00 AM - 5:30 PM'},
    {'day': 'Wednesday', 'time': '10:00 AM - 5:30 PM'},
    {'day': 'Thursday', 'time': '10:00 AM - 5:30 PM'},
    {'day': 'Friday', 'time': '10:00 AM - 5:30 PM'},
    {'day': 'Saturday', 'time': '10:00 AM - 5:30 PM'},
    {'day': 'Sunday', 'time': 'Off'},
  ];

  void showDateTimeDailog(BuildContext context, String day) {
    CustomDialog.show(
      context,
      content: StatefulBuilder(
        builder: (context, setStateDialog) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ToggleRowWidget(
                label: day,
                value: days,
                onChanged: (val) {
                  setStateDialog(() {
                    days = val;
                  });
                  setState(() {}); // update parent state as well
                },
              ),
              2.hSpace(context),
              Row(
                children: [
                  Expanded(
                    child: AppTextfield(
                      title: "Opening Time",
                      hint: "8:00 AM",
                      hintColor: AppColors.grey,
                      ctr: openTimeCtrl,
                      readOnly: true,
                      filledColor: Colors.transparent,
                      borderColor: AppColors.grey,
                      onTap: () async {
                        await pickTime(context, openTimeCtrl);
                      },
                      textInputType: TextInputType.datetime,
                      autofillHints: const [AutofillHints.oneTimeCode],
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: SvgPicture.asset("assets/icons/time.svg"),
                      ),
                    ),
                  ),
                  2.wSpace(context),
                  Expanded(
                    child: AppTextfield(
                      title: "Closing Time",
                      hint: "8:00 PM",
                      hintColor: AppColors.grey,
                      ctr: closetimeCtrl,
                      readOnly: true,
                      filledColor: Colors.transparent,
                      borderColor: AppColors.grey,
                      onTap: () async {
                        await pickTime(context, closetimeCtrl);
                      },
                      textInputType: TextInputType.datetime,
                      autofillHints: const [AutofillHints.oneTimeCode],
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: SvgPicture.asset("assets/icons/time.svg"),
                      ),
                    ),
                  ),
                ],
              ),
              2.hSpace(context),
              AppButton.primary(
                context,
                buttonText: 'Add ',
                onPressed: () {},
                width: context.w * 0.65,
                heignt: context.h * 0.05,
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBackAppBar(title: "Opening Hours"),
      body: Column(
        children: [
          2.hSpace(context),
          ListView.builder(
            itemCount: schedule.length,
            shrinkWrap: true,
            physics: AlwaysScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final daySchedule = schedule[index];
              return GestureDetector(
                onTap: () => showDateTimeDailog(context, daySchedule['day']!),
                child: DayTimeCard(
                  day: daySchedule['day']!,
                  timeText: daySchedule['time']!,
                  svgAssetPath: 'assets/icons/clock.png',
                  onEdit: () {},
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
