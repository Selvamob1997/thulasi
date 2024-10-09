import 'package:thulasi/app/modules/active_status_module/active_status_controller.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class ActiveStatusBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ActiveStatusController());
  }
}