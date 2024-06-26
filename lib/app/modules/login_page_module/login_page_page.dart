import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thulasi/app/modules/login_page_module/login_page_controller.dart';


import '../../IncludesFiles/FadeAnimation.dart';


class LoginPagePage extends GetView<LoginPageController> {
  @override
  Widget build(BuildContext context)=>GetBuilder<LoginPageController>(builder: (controller) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                width: width,
                height: height/4,
                color: Colors.white,
                child: Stack(
                  children: [
                    FadeAnimation(
                      1,
                      Container(
                        margin: EdgeInsets.only(top: height/80,left: width/3.5),
                        height: height/4,
                        width: width/1.5,
                        decoration: BoxDecoration(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.only(
                             // bottomRight: Radius.circular(height/2.7),
                              bottomLeft:Radius.circular(height/7.5),
                              topLeft: Radius.circular(height/9)
                          )
                        ),
                      ),
                    ),
                    FadeAnimation(
                      1.5,
                      Container(
                        margin: EdgeInsets.only(top: height/11.5,),
                        width: width/1.5,
                        height: height/15,
                        child: Image.asset("assets/icon.png"),
                      ),
                    ),
                    FadeAnimation(
                      1.9,
                      Container(
                        margin: EdgeInsets.only(top: height/5.5,left: width/2),
                        width: width/1.5,
                        height: height/15,
                        child: Text("Login",style: TextStyle(
                            fontSize: height/18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                        ),
                        ),
                      ),
                    ),
                  ],
                ),

              ),
              Container(
                height: height/20,
                width: width,
                color: Colors.white,
                alignment: Alignment.center,
                child: Text(controller.identifier.toString(),style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              ),
              Container(
                width: width,
                height: height/3,
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(height: height/10,),
                    FadeAnimation(
                      2.3,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: height/30),
                        child: Material(
                          elevation: 2.0,
                          borderRadius: BorderRadius.all(Radius.circular(height/10)),
                          child:
                          TextField(
                            controller: controller.username,
                            onChanged: (String value) {},
                            cursorColor: Colors.blue,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: "UserName",
                                prefixIcon: Material(
                                  elevation: 0,
                                  borderRadius: BorderRadius.all(Radius.circular(height/15)),
                                  child: const Icon(
                                    Icons.account_circle,
                                    color: Colors.blue,
                                  ),
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height/50,),
                    FadeAnimation(
                      2.8,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: height/30),
                        child: Material(
                          elevation: 2.0,
                          borderRadius: BorderRadius.all(Radius.circular(height/10)),
                          child: TextField(
                            controller: controller.password,
                            onChanged: (String value) {},
                            cursorColor: Colors.blue,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: "Password",
                                prefixIcon: Material(
                                  elevation: 0,
                                  borderRadius: BorderRadius.all(Radius.circular(height/15)),
                                  child: const Icon(
                                    Icons.lock,
                                    color: Colors.blue,
                                  ),
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height/50,),
                    FadeAnimation(
                      3.5,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: height/30),
                        child: Material(
                          elevation: 2.0,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(height/20),
                              bottomRight: Radius.circular(height/20),
                            bottomLeft: Radius.circular(height/100),
                            topRight: Radius.circular(height/100),
                          ),
                          child: InkWell(
                            onTap: (){
                              controller.logincheck();
                            },
                            child: Container(
                              height: height/15,
                              width: width/2,
                              decoration: BoxDecoration(
                                color: Colors.cyan.shade700,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(height/20),
                                    bottomRight: Radius.circular(height/20),
                                    bottomLeft: Radius.circular(height/100),
                                    topRight: Radius.circular(height/100),
                                )
                              ),
                              child: Row(

                                children: [
                                  SizedBox(width: width/20,),
                                  Icon(Icons.login,size: height/30,color: Colors.white,),
                                  SizedBox(width: width/20,),
                                  Text("Login",style: TextStyle(fontSize: height/40,color: Colors.white,fontWeight: FontWeight.bold),)

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
            ],
          ),
        ),
      ),
    );
  },
  );
}
