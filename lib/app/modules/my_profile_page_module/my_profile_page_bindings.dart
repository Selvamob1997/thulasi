
import 'package:get/get.dart';
import 'package:thulasi/app/modules/my_profile_page_module/my_profile_page_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class MyProfilePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyProfilePageController());
  }
}