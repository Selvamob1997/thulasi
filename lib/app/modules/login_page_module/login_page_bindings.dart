
import 'package:get/get.dart';
import 'package:thulasi/app/modules/login_page_module/login_page_controller.dart';

class LoginPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginPageController());
  }
}