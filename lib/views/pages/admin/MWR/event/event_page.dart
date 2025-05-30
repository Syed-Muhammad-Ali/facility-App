import 'package:facility_managing/res/constants/app_colors.dart';
import 'package:facility_managing/res/routes/routes_name.dart';
import 'package:facility_managing/views/widgets/app_bar.dart';
import 'package:facility_managing/views/widgets/app_container.dart';
import 'package:facility_managing/views/widgets/app_text.dart';
import 'package:facility_managing/views/widgets/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  final List<Map<String, String>> events = List.generate(
    6,
    (index) => {
      'title': 'Event Name',
      'description':
          'Lorem ipsum dolor sit amet consectetur. Nibh ultrices ornare tincidunt eu. Dolor tincidunt in pharetra vulputate sit elementum senectus pulvinar.',
      'imageUrl':
          index % 2 == 0 ? 'assets/images/pic8.png' : 'assets/images/pic9.png',
    },
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBackAppBar(
        title: "MWR & Events Page",
        showAction: true,
        iconTab: () {
          Get.toNamed(RouteName.addEventPage);
        },
      ),
      body: Column(
        children: [
          2.hSpace(context),
          Expanded(
            child: ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                final event = events[index];
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteName.eventDetailsPage);
                  },
                  child: AppContainer(
                    borderRadius: BorderRadius.circular(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            event['imageUrl']!,
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AppText(
                                    event['title']!,
                                    fontSize: 16,
                                    fontFamily: AppFontFamily.roboto,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textColor,
                                  ),
                                  const Icon(Icons.more_vert),
                                ],
                              ),
                              const SizedBox(height: 6),
                              AppText(
                                event['description']!,
                                fontSize: 10,
                                fontFamily: AppFontFamily.roboto,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff5D5D5D),
                                maxLines: 4,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
