
import 'package:get/get.dart';
import 'package:thulasi/app/modules/Reports/leave_approve_module/leave_approve_controller.dart';


class LeaveApproveBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LeaveApproveController());
  }
}