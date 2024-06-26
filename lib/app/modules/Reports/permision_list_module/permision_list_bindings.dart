import 'package:get/get.dart';
import 'package:thulasi/app/modules/Reports/permision_list_module/permision_list_controller.dart';


class PermisionListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PermisionListController());
  }
}