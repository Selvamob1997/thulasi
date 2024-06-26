import 'package:get/get.dart';
import 'package:thulasi/app/modules/reports_module/reports_controller.dart';


class ReportsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReportsController());
  }
}