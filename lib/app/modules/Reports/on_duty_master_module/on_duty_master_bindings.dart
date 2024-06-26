
import 'package:get/get.dart';
import 'package:thulasi/app/modules/Reports/on_duty_master_module/on_duty_master_controller.dart';


class OnDutyMasterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnDutyMasterController());
  }
}