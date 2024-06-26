import 'package:get/get.dart';
import 'package:thulasi/app/modules/site_vist_module/site_vist_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class SiteVistBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SiteVistController());
  }
}