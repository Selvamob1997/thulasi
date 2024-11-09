import 'package:get/get.dart';
import 'package:thulasi/app/modules/Reports/permission_approve_module/permission_approve_controller.dart';

class PermissionApproveBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PermissionApproveController());
  }
}