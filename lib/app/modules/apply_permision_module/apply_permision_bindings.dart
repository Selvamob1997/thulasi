
import 'package:get/get.dart';
import 'package:thulasi/app/modules/apply_permision_module/apply_permision_controller.dart';


class ApplyPermisionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApplyPermisionController());
  }
}