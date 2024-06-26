
import 'package:get/get.dart';
import 'app_pages.dart';
abstract class RouteManageMent{

  static void goToLogin(){
    Get.offNamedUntil(Routes.LOGIN_PAGE, (route) => false);
  }
  static void goToDashboard(){
    Get.offNamed(Routes.DASH_BOARD);
    //Get.toNamed(Routes.LOGIN_PAGE);
  }
  static void goToMaspActivity(){
    //Get.offNamed(Routes.MAPS_ACTIVITY);
    Get.toNamed(Routes.MAPS_ACTIVITY);
  }
  static void goToApplyLeave(){
    //Get.offNamed(Routes.MAPS_ACTIVITY);
    Get.offNamed(Routes.APPLY_LEAVE,arguments:<String,dynamic>{
      'ScreenName':'Leave Form',
      'DocNo':0
    });
  }

  static void goToSiteVisit(){
    Get.offNamed(Routes.SITE_VIST,arguments:<String,dynamic>{
      'ScreenName':'Site Visit'
    });
  }
  static void goToProfile(){
    Get.offNamed(Routes.MY_PROFILE_PAGE,arguments:<String,dynamic>{
      'ScreenName':'Profile'
    });
  }

  static void goToOnDuty(){
    Get.offNamed(Routes.APPLY_ON_DUTY,arguments:<String,dynamic>{
      'ScreenName':'Site Visit',
      'DocNo':0
    });
  }

  static void goToPermision(){
    Get.offNamed(Routes.APPLY_PERMISION,arguments:<String,dynamic>{
      'ScreenName':'Site Visit',
      'DocNo':0
    });
  }
  static void goToLeaveList(){
    Get.toNamed(Routes.LEAVE_LIST,arguments:<String,dynamic>{
      'ScreenName':'Site Visit'
    });
  }
  static void goToPermisionList(){
    Get.toNamed(Routes.PERMISION_LIST,arguments:<String,dynamic>{
      'ScreenName':'Site Visit'
    });
  }
  static void goToOndutyList(){
    Get.toNamed(Routes.ON_DUTY_MASTER,arguments:<String,dynamic>{
      'ScreenName':'Site Visit'
    });
  }
  static void goToSiteVistList(){
    Get.toNamed(Routes.SITE_VISIT_REPORTS,arguments:<String,dynamic>{
      'ScreenName':'Site Visit'
    });
  }
  static void goToHoliyDayList(){
    Get.toNamed(Routes.HOLI_DAY_LIST,arguments:<String,dynamic>{
      'ScreenName':'Holiday List'
    });
  }
}