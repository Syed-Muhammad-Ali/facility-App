import 'package:facility_managing/res/routes/routes_name.dart';
import 'package:facility_managing/views/pages/admin/MWR/MWR_page.dart';
import 'package:facility_managing/views/pages/admin/MWR/bookings/add_booking/add_booking_page.dart';
import 'package:facility_managing/views/pages/admin/MWR/bookings/bookings_page.dart';
import 'package:facility_managing/views/pages/admin/MWR/event/add_event/add_event_page.dart';
import 'package:facility_managing/views/pages/admin/MWR/event/event_details/event_details_page.dart';
import 'package:facility_managing/views/pages/admin/MWR/event/event_page.dart';
import 'package:facility_managing/views/pages/admin/MWR/operating_hour_MWR/operating_hour_MWR_page.dart';
import 'package:facility_managing/views/pages/admin/chaplains_center/activities/activities_page.dart';
import 'package:facility_managing/views/pages/admin/chaplains_center/activities/add_activities/add_activities_page.dart';
import 'package:facility_managing/views/pages/admin/chaplains_center/bus_schedule/add_bus_schedule/add_schedule_page.dart';
import 'package:facility_managing/views/pages/admin/chaplains_center/bus_schedule/bus_schedule_page.dart';
import 'package:facility_managing/views/pages/admin/chaplains_center/chaplains_center_page.dart';
import 'package:facility_managing/views/pages/admin/chaplains_center/church_service/church_service_details/church_service_deatils.dart';
import 'package:facility_managing/views/pages/admin/chaplains_center/church_service/church_service_page.dart';
import 'package:facility_managing/views/pages/admin/chaplains_center/church_service_item/church_service_item.dart';
import 'package:facility_managing/views/pages/admin/chaplains_center/team/team_page.dart';
import 'package:facility_managing/views/pages/admin/dining_facility/dining_facility_page.dart';
import 'package:facility_managing/views/pages/admin/dining_facility/feedback/feedback_details/feedback_details.dart';
import 'package:facility_managing/views/pages/admin/dining_facility/feedback/feedback_page.dart';
import 'package:facility_managing/views/pages/admin/dining_facility/menu_list/add_menu/add_menu_page.dart';
import 'package:facility_managing/views/pages/admin/dining_facility/menu_list/menu_list_page.dart';
import 'package:facility_managing/views/pages/admin/dining_facility/opening_hours/opening_hours_page.dart';
import 'package:facility_managing/views/pages/admin/home/home_page.dart';
import 'package:facility_managing/views/pages/admin/maintaince_report/add_maintaince_report/add_maintaince_report.dart';
import 'package:facility_managing/views/pages/admin/maintaince_report/maintaince_report_page.dart';
import 'package:facility_managing/views/pages/authentication/signIn/signIn_page.dart';
import 'package:facility_managing/views/pages/authentication/signUp/signUp_page.dart';
import 'package:facility_managing/views/pages/splash/splash_page.dart';
import 'package:facility_managing/views/pages/user/bnb/bnb_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  static appRoutes() => [
    // Local Admin Screen Name
    GetPage(
      name: RouteName.splashPage,
      page: () => const SplashPage(),
      // transition: Transition.rightToLeftWithFade,
      // transitionDuration: const Duration(milliseconds: 800),
    ),
    GetPage(name: RouteName.signInPage, page: () => const SignInPage()),
    GetPage(name: RouteName.signUpPage, page: () => const SignUpPage()),

    // User Side Screen Name
    GetPage(name: RouteName.bnbPage, page: () => const BNBPage()),

    // Driver Side Screen Name
    GetPage(name: RouteName.homePage, page: () => const HomePage()),
    GetPage(
      name: RouteName.diningFacilityPage,
      page: () => const DiningFacilityPage(),
    ),
    GetPage(name: RouteName.menuListPage, page: () => const MenuListPage()),
    GetPage(name: RouteName.addMenuPage, page: () => const AddMenuPage()),
    GetPage(name: RouteName.openingHoursPage, page: () => OpeningHoursPage()),
    GetPage(name: RouteName.feedbackPage, page: () => FeedbackPage()),
    GetPage(name: RouteName.feedbackDetails, page: () => FeedbackDetails()),
    GetPage(
      name: RouteName.chaplainsCenterPage,
      page: () => ChaplainsCenterPage(),
    ),
    GetPage(name: RouteName.churchServicePage, page: () => ChurchServicePage()),
    GetPage(name: RouteName.activitiesPage, page: () => ActivitiesPage()),
    GetPage(name: RouteName.addActivitiesPage, page: () => AddActivitiesPage()),
    GetPage(name: RouteName.busSchedulePage, page: () => BusSchedulePage()),
    GetPage(name: RouteName.addSchedulePage, page: () => AddSchedulePage()),
    GetPage(
      name: RouteName.churchServiceDetails,
      page: () => ChurchServiceDetails(),
    ),
    GetPage(name: RouteName.churchServiceItem, page: () => ChurchServiceItem()),
    GetPage(
      name: RouteName.maintainceReportPage,
      page: () => MaintainceReportPage(),
    ),
    GetPage(
      name: RouteName.addMaintainceReport,
      page: () => AddMaintainceReport(),
    ),
    GetPage(name: RouteName.mwrPage, page: () => MWRPage()),
    GetPage(name: RouteName.eventPage, page: () => EventPage()),
    GetPage(name: RouteName.eventDetailsPage, page: () => EventDetailsPage()),
    GetPage(name: RouteName.addEventPage, page: () => AddEventPage()),
    GetPage(
      name: RouteName.operatingHourMWRPage,
      page: () => OperatingHourMWRPage(),
    ),
    GetPage(name: RouteName.bookingsPage, page: () => BookingsPage()),
    GetPage(name: RouteName.addBookingPage, page: () => AddBookingPage()),
    GetPage(name: RouteName.teamPage, page: () => TeamPage()),
  ];
}
