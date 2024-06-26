// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:thulasi/app/modules/my_profile_page_module/my_profile_page_controller.dart';
import '../../IncludesFiles/_appbar.dart';


class MyProfilePagePage extends GetView<MyProfilePageController> {
   MyProfilePagePage({Key? key}) : super(key: key);
  var dd = Get.arguments['ScreenName'];

  @override
  Widget build(BuildContext context)=>GetBuilder<MyProfilePageController>(builder: (controllermain) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                height: height/10,
                width: width,
                alignment: Alignment.center,
                child: MyAppBar(screenName: dd,),
              ),
              SizedBox(
                height: height/5,
                child: Stack(
                 children: [
                   Container(
                     height: height/8,
                    width: width/1.1,
                    margin: EdgeInsets.only(left: width/40,),
                    decoration: BoxDecoration(
                       color: Colors.lightBlueAccent,
                       borderRadius: BorderRadius.only( topLeft:  Radius.circular(height/100),topRight:  Radius.circular(height/100))
                    ),
                     child: Column(
                       children: [
                         SizedBox(
                           height: height/30,
                         ),
                       SizedBox(
                         height: height/30,
                         width: width/2,
                         child: Text(controllermain.sessionName,
                           style: TextStyle(
                               color: Colors.white,
                               fontSize: height/30,
                               fontWeight: FontWeight.bold),
                         ),
                       ),
                     ],
                   ),
                 ),
                   Container(
                     height: height/9,
                     width: width/4,
                     margin: EdgeInsets.only(top: height/14,left: width/15),
                     child: CircleAvatar(
                         backgroundColor: Colors.white,
                         child: Container(
                           height: height/10,
                           child: Lottie.asset('assets/user.json'),
                           decoration: BoxDecoration(
                             color: Colors.orangeAccent,
                             borderRadius: BorderRadius.all(Radius.circular(height/5))
                           ),
                         )
                     ),
                     decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius:BorderRadius.all(Radius.circular(height/10)),

                     ),
                   ),
                   Container(
                     height: height/18,
                     width: width/1.7,
                     margin: EdgeInsets.only(left: width/3,top: height/8),
                     alignment: Alignment.centerLeft,
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                         Text(controllermain.sessionDeptName,style: TextStyle(fontWeight: FontWeight.w500,fontSize: height/50,color: Colors.indigo),),
                         Text(controllermain.sessionEmail,style: TextStyle(fontWeight: FontWeight.w500,fontSize: height/75,color: Colors.black38),),
                       ],
                     ),
                   )
                 ],
                ),
              ),
              // Container(
              //   height: height/30,
              //   width: width/1.1,
              //   alignment: Alignment.center,
              //   decoration: BoxDecoration(
              //       color: Colors.white.withOpacity(0.7),
              //       borderRadius: BorderRadius.all(Radius.circular(height/45)),
              //     ),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Container(
              //         alignment: Alignment.centerLeft,
              //         margin: EdgeInsets.only(left: height/35),
              //         child: Text(controllermain.sessionSex,style: TextStyle(color: Colors.blue.shade900,fontSize: height/70,fontWeight: FontWeight.w700),),
              //       ),
              //        Container(
              //          margin: EdgeInsets.only(right: height/35),
              //          child: Icon(Icons.supervised_user_circle,color: Colors.redAccent,),
              //        ),
              //
              //     ],
              //   ),
              // ),
              // SizedBox(height: height/100,),
              // Container(
              //   height: height/30,
              //   width: width/1.1,
              //   alignment: Alignment.center,
              //   decoration: BoxDecoration(
              //     color: Colors.white.withOpacity(0.7),
              //     borderRadius: BorderRadius.all(Radius.circular(height/45)),
              //   ),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Container(
              //         alignment: Alignment.centerLeft,
              //         margin: EdgeInsets.only(left: height/35),
              //         child: Text(controllermain.sessionMaStatus,style: TextStyle(color: Colors.blue.shade900,fontSize: height/70,fontWeight: FontWeight.w700),),
              //       ),
              //       Container(
              //         margin: EdgeInsets.only(right: height/35),
              //         child: Icon(Icons.supervised_user_circle,color: Colors.redAccent,),
              //       ),
              //
              //     ],
              //   ),
              // ),
              // SizedBox(height: height/100,),
              Container(
                height: height/30,
                width: width/1.1,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  borderRadius: BorderRadius.all(Radius.circular(height/45)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: height/35),
                      child: Text(controllermain.sessionDOJ,style: TextStyle(color: Colors.blue.shade900,fontSize: height/70,fontWeight: FontWeight.w700),),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: height/35),
                      child: Icon(Icons.date_range,color: Colors.redAccent,),
                    ),

                  ],
                ),
              ),
              SizedBox(height: height/100,),
              Container(
                height: height/30,
                width: width/1.1,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  borderRadius: BorderRadius.all(Radius.circular(height/45)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: height/35),
                      child: Text(controllermain.sessionDOB,style: TextStyle(color: Colors.blue.shade900,fontSize: height/70,fontWeight: FontWeight.w700),),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: height/35),
                      child: Icon(Icons.date_range,color: Colors.redAccent,),
                    ),

                  ],
                ),
              ),
              SizedBox(height: height/100,),
              Container(
                height: height/30,
                width: width/1.1,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  borderRadius: BorderRadius.all(Radius.circular(height/45)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: height/35),
                      child: Text(controllermain.sessionMobile,style: TextStyle(color: Colors.blue.shade900,fontSize: height/70,fontWeight: FontWeight.w700),),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: height/35),
                      child: Icon(Icons.mobile_screen_share,color: Colors.redAccent,),
                    ),

                  ],
                ),
              ),
              SizedBox(height: height/100,),
              Container(
                height: height/30,
                width: width/1.1,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  borderRadius: BorderRadius.all(Radius.circular(height/45)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: height/35),
                      child: Text(controllermain.sessionBankAc,style: TextStyle(color: Colors.blue.shade900,fontSize: height/70,fontWeight: FontWeight.w700),),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: height/35),
                      child: Icon(Icons.account_balance_sharp,color: Colors.redAccent,),
                    ),

                  ],
                ),
              ),
              SizedBox(height: height/100,),
              Card(
                elevation: 5,
                color: Colors.white.withOpacity(0.8),
                child: Column(
                  children: [
                    Container(
                      height: height/25,
                      width: width/1.1,
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: width/50),
                      child: Row(
                        children: [
                          SizedBox(width: width/3,child:  const Text("Home Street",style: TextStyle(color: Colors.black38),)),
                          Text(controller.sessionHomeSt.toString()),
                        ],
                      ),
                    ),
                    Container(
                      height: height/30,
                      width: width/1.1,
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: width/50),
                      child: Row(
                        children: [
                          SizedBox(width: width/3,child:  const Text("Home City",style: TextStyle(color: Colors.black38),)),
                          Text(controller.sessionHomeCity.toString()),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(height: height/100,),
              Card(
                elevation: 5,
                color: Colors.amberAccent,
                child: Column(
                  children: [
                    Container(
                      height: height/25,
                      width: width/1.1,
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: width/50),
                      child: Row(
                        children: [
                          SizedBox(width: width/3,child:  const Text("Office Tel",style: TextStyle(color: Colors.black38),)),
                          Text(controller.sessionOffTel.toString(),style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w700),),
                        ],
                      ),
                    ),
                    Container(
                      height: height/30,
                      width: width/1.1,
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: width/50),
                      child: Row(
                        children: [
                          SizedBox(width: width/3,child:  const Text("Employee Type",style: TextStyle(color: Colors.black38),)),
                          Text(controller.sessionEmpType.toString(),style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w700)),
                        ],
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
  }
  );
}
