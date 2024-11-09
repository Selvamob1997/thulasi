import 'package:thulasi/app/modules/site_visit_approve_module/site_visit_approve_controller.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class SiteVisitApproveBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SiteVisitApproveController());
  }
}