
import 'package:get/get.dart';
import 'package:thulasi/app/modules/Reports/site_visit_reports_module/site_visit_reports_controller.dart';


class SiteVisitReportsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SiteVisitReportsController());
  }
}