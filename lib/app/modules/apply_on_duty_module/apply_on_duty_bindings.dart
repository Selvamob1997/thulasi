
import 'package:get/get.dart';
import 'package:thulasi/app/modules/apply_on_duty_module/apply_on_duty_controller.dart';


class ApplyOnDutyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApplyOnDutyController());
  }
}