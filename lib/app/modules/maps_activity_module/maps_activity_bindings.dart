
import 'package:get/get.dart';
import 'package:thulasi/app/modules/maps_activity_module/maps_activity_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class MapsActivityBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MapsActivityController());
  }
}