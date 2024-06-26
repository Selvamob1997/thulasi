
import 'package:get/get.dart';
import 'package:thulasi/app/modules/holi_day_list_module/holi_day_list_controller.dart';


class HoliDayListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HoliDayListController());
  }
}