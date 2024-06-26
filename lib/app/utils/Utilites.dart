// ignore_for_file: avoid_types_as_parameter_names, file_names

import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:thulasi/app/IncludesFiles/_sidemenu.dart';
import 'package:thulasi/app/routes/route_management.dart';

abstract class Utilities{

  static void showLoader() async {
    await Get.dialog(
      WillPopScope(
        onWillPop: ()async=> false,
         child: Center(
          child: SizedBox(
            height: 300,
            width: 200,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Image.asset("assets/logo.png"),
                  LoadingAnimationWidget.staggeredDotsWave(
                    color: Colors.white,
                    size: 100,
                  ),
                ],
              ),
            ),
          ),
      ),
       ),
      barrierDismissible: false,
    );
  }

  static void showMapLoader() async {
    await Get.dialog(
      Scaffold(
        body: Center(
          child: SizedBox(
            height: 300,
            width: 200,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Image.asset("assets/logo.png"),
                  LoadingAnimationWidget.staggeredDotsWave(
                    color: Colors.white,
                    size: 100,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  static void closeLoader() {
    closeDialog();
  }

  static void closeDialog() {
    if (Get.isDialogOpen ?? false) Get.back<void>();
  }

  static alertsnackBar(title,msg,int) {
    return Get.snackbar(
        title,
        msg,
        colorText: Colors.white,
        backgroundColor: int==1?Colors.deepOrange:int==2?Colors.red:Colors.green,
        icon: int==1? const Icon(Icons.add_alert):int==2?const Icon(Icons.error):const Icon(Icons.ac_unit_outlined),
        snackPosition: SnackPosition.TOP,
    );
  }

  static alertsidemenu(context){
    showAnimatedDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (BuildContext context, void Function(void Function()) setState) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: const SideMenu(),
          );
        },
        );
      },
      animationType: DialogTransitionType.slideFromLeft,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(seconds: 1),
    );
  }

  static showDialaogboxWarning(context, String message) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(message),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,textStyle: const TextStyle(color: Colors.white)),
              child: const Text('Ok'),
              onPressed: () {
                Get.back();
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }

  static showDialaogboxWarningMessage(context, String message,String tittle) {
    return Get.dialog(
      WillPopScope(
        onWillPop: () async=>false,
        child: SizedBox(
          height: 250,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Material(
                      child: SizedBox(
                        width: 280,
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            Text(tittle, textAlign: TextAlign.center,),
                            const SizedBox(height: 15),
                            Text(message, textAlign: TextAlign.center,),
                            const SizedBox(height: 20),
                            //Buttons
                            SizedBox(
                              width: 100,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: const Color(0xFFFFFFFF), backgroundColor: Colors.amber, minimumSize: const Size(0, 45),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Text(
                                  'YES',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static showDialaogboxSavedMessage(context, String message,String tittle) {
    return Get.dialog(
      WillPopScope(
        onWillPop: () async=>false,
        child: SizedBox(
          height: 250,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Material(
                      child: SizedBox(
                        width: 280,
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            Text(tittle, textAlign: TextAlign.center,),
                            const SizedBox(height: 15),
                            Text(message, textAlign: TextAlign.center,),
                            const SizedBox(height: 20),
                            //Buttons
                            SizedBox(
                              width: 100,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: const Color(0xFFFFFFFF), backgroundColor: Colors.green, minimumSize: const Size(0, 45),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: () {
                                  Get.back();
                                  Get.back();
                                },
                                child: const Text(
                                  'YES',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static logot(){
    RouteManageMent.goToLogin();
  }


}