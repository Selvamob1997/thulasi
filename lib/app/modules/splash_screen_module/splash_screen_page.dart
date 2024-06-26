import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thulasi/app/modules/splash_screen_module/splash_screen_controller.dart';


class SplashScreenPage extends GetView<SplashScreenController> {
  const SplashScreenPage({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context)=> GetBuilder<SplashScreenController>(builder: (controller) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: width,
          height: height,
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: height/2.5,
                child: Image.asset("assets/logo.png"),
              ),
              CircularProgressIndicator()
            ],
          ),

        ),
      ),
    );
  });
}
