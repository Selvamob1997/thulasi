import 'package:thulasi/app/modules/miss_punch_module/miss_punch_controller.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class MissPunchBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MissPunchController());
  }
}