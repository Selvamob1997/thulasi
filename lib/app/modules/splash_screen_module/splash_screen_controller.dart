import 'package:get/get.dart';
import 'package:thulasi/app/routes/route_management.dart';


class SplashScreenController extends GetxController{

  var name = ''.obs;
  @override
  void onInit() {
    Future.delayed(Duration(seconds: 5),()=>   RouteManageMent.goToLogin() );
    // TODO: implement onInit
    super.onInit();
  }
}
