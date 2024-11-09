
import 'package:get/get.dart';
import 'package:thulasi/app/modules/Reports/onduty_master_approve_module/onduty_master_approve_controller.dart';


class OndutyMasterApproveBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OndutyMasterApproveController());
  }
}