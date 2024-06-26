
import 'package:get/get.dart';
import 'package:thulasi/app/modules/dash_board_module/dash_board_controller.dart';


class DashBoardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashBoardController());
  }
}