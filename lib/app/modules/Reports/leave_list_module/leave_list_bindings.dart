
import 'package:get/get.dart';
import 'package:thulasi/app/modules/Reports/leave_list_module/leave_list_controller.dart';


class LeaveListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LeaveListController());
  }
}