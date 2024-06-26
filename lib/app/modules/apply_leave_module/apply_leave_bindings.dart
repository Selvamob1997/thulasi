
import 'package:get/get.dart';
import 'package:thulasi/app/modules/apply_leave_module/apply_leave_controller.dart';


class ApplyLeaveBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApplyLeaveController());
  }
}