import '../../app/modules/miss_punch_module/miss_punch_page.dart';
import '../../app/modules/miss_punch_module/miss_punch_bindings.dart';
import '../../app/modules/active_status_module/active_status_page.dart';
import '../../app/modules/active_status_module/active_status_bindings.dart';
import 'package:thulasi/app/modules/Reports/leave_list_module/leave_list_bindings.dart';
import 'package:thulasi/app/modules/Reports/leave_list_module/leave_list_page.dart';
import 'package:thulasi/app/modules/Reports/on_duty_master_module/on_duty_master_bindings.dart';
import 'package:thulasi/app/modules/Reports/on_duty_master_module/on_duty_master_page.dart';
import 'package:thulasi/app/modules/Reports/permision_list_module/permision_list_bindings.dart';
import 'package:thulasi/app/modules/Reports/permision_list_module/permision_list_page.dart';
import 'package:thulasi/app/modules/Reports/site_visit_reports_module/site_visit_reports_bindings.dart';
import 'package:thulasi/app/modules/Reports/site_visit_reports_module/site_visit_reports_page.dart';
import 'package:thulasi/app/modules/apply_leave_module/apply_leave_bindings.dart';
import 'package:thulasi/app/modules/apply_leave_module/apply_leave_page.dart';
import 'package:thulasi/app/modules/apply_on_duty_module/apply_on_duty_bindings.dart';
import 'package:thulasi/app/modules/apply_on_duty_module/apply_on_duty_page.dart';
import 'package:thulasi/app/modules/apply_permision_module/apply_permision_bindings.dart';
import 'package:thulasi/app/modules/dash_board_module/dash_board_bindings.dart';
import 'package:thulasi/app/modules/holi_day_list_module/holi_day_list_bindings.dart';
import 'package:thulasi/app/modules/holi_day_list_module/holi_day_list_page.dart';
import 'package:thulasi/app/modules/login_page_module/login_page_bindings.dart';
import 'package:thulasi/app/modules/login_page_module/login_page_page.dart';
import 'package:thulasi/app/modules/maps_activity_module/maps_activity_bindings.dart';
import 'package:thulasi/app/modules/maps_activity_module/maps_activity_page.dart';
import 'package:thulasi/app/modules/my_profile_page_module/my_profile_page_bindings.dart';
import 'package:thulasi/app/modules/my_profile_page_module/my_profile_page_page.dart';
import 'package:thulasi/app/modules/reports_module/reports_bindings.dart';
import 'package:thulasi/app/modules/reports_module/reports_page.dart';
import 'package:thulasi/app/modules/site_vist_module/site_vist_bindings.dart';
import 'package:thulasi/app/modules/site_vist_module/site_vist_page.dart';

import '../../app/modules/splash_screen_module/splash_screen_bindings.dart';
import '../../app/modules/splash_screen_module/splash_screen_page.dart';
import 'package:get/get.dart';

import '../modules/apply_permision_module/apply_permision_page.dart';
import '../modules/dash_board_module/dash_board_page.dart';
part './app_routes.dart';
/**
 * GetX Generator - fb.com/htngu.99
 * */

abstract class AppPages {
  static var initialpage = Routes.SPLASH_SCREEN;
  static final pages = [
    GetPage(
      name: Routes.SPLASH_SCREEN,
      page: () => SplashScreenPage(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: Routes.LOGIN_PAGE,
      page: () => LoginPagePage(),
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: Routes.DASH_BOARD,
      page: () =>  DashBoardPage(),
      binding: DashBoardBinding(),
    ),
    GetPage(
      name: Routes.MAPS_ACTIVITY,
      page: () => MapsActivityPage(),
      binding: MapsActivityBinding(),
    ),
    GetPage(
      name: Routes.APPLY_LEAVE,
      page: () =>  ApplyLeavePage(),
      binding: ApplyLeaveBinding(),
    ),
    GetPage(
      name: Routes.SITE_VIST,
      page: () => SiteVistPage(),
      binding: SiteVistBinding(),
    ),
    GetPage(
      name: Routes.MY_PROFILE_PAGE,
      page: () => MyProfilePagePage(),
      binding: MyProfilePageBinding(),
    ),
    GetPage(
      name: Routes.APPLY_PERMISION,
      page: () => ApplyPermisionPage(),
      binding: ApplyPermisionBinding(),
    ),
    GetPage(
      name: Routes.APPLY_ON_DUTY,
      page: () => ApplyOnDutyPage(),
      binding: ApplyOnDutyBinding(),
    ),
    GetPage(
      name: Routes.REPORTS,
      page: () => ReportsPage(),
      binding: ReportsBinding(),
    ),
    GetPage(
      name: Routes.LEAVE_LIST,
      page: () => LeaveListPage(),
      binding: LeaveListBinding(),
    ),
    GetPage(
      name: Routes.PERMISION_LIST,
      page: () => PermisionListPage(),
      binding: PermisionListBinding(),
    ),
    GetPage(
      name: Routes.ON_DUTY_MASTER,
      page: () => OnDutyMasterPage(),
      binding: OnDutyMasterBinding(),
    ),
    GetPage(
      name: Routes.SITE_VISIT_REPORTS,
      page: () => SiteVisitReportsPage(),
      binding: SiteVisitReportsBinding(),
    ),
    GetPage(
      name: Routes.HOLI_DAY_LIST,
      page: () => HoliDayListPage(),
      binding: HoliDayListBinding(),
    ),
    GetPage(
      name: Routes.ACTIVE_STATUS,
      page: () => ActiveStatusPage(),
      binding: ActiveStatusBinding(),
    ),
    GetPage(
      name: Routes.MISS_PUNCH,
      page: () => MissPunchPage(),
      binding: MissPunchBinding(),
    ),
  ];
}
