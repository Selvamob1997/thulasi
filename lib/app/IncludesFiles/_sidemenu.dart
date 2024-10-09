// ignore_for_file: deprecated_member_use, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thulasi/app/IncludesFiles/FadeAnimation.dart';
import 'package:thulasi/app/modules/dash_board_module/dash_board_controller.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context)=>GetBuilder<DashBoardController>(builder: (controler)  {
    var SH = MediaQuery.of(context).size.height;
    var SW = MediaQuery.of(context).size.width;
    return Stack(
      children: <Widget>[
        Container(
          height: SH/1.2,
          width: SW/2.5,
          margin: const EdgeInsets.only(top: Constants.avatarRadius),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            gradient: const LinearGradient(
              colors: [Colors.transparent, Colors.transparent],
              begin: Alignment. topRight,
              end: Alignment.bottomLeft,
            ),
            borderRadius: BorderRadius.circular(Constants.padding),
            // boxShadow: [
            //   BoxShadow(
            //       color: Colors.black45, offset: Offset(0, 5), blurRadius: 5),
            // ]
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                FadeAnimation(
                  0.5,
                  InkWell(
                    onTap: (){

                    },
                    child: Container(
                      width: SW/2,
                      height: SH/10,
                      alignment: Alignment.centerLeft,

                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                FadeAnimation(
                  0.6,
                  InkWell(
                    onTap: (){
                      controler.getdashboardNavigation(3);
                    },
                    child: Container(
                      width: SW/2,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.green.shade100,
                          borderRadius: const BorderRadius.all(Radius.circular(10))
                      ),
                      child:  Text("Profile",
                        style: TextStyle(
                            color: Colors.black38,
                            fontSize:SH/60,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                FadeAnimation(
                  0.6,
                  InkWell(
                    onTap: (){
                      controler.getdashboardNavigation(1);
                    },
                    child: Container(
                      width: SW/2,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.green.shade100,
                          borderRadius: const BorderRadius.all(Radius.circular(10))
                      ),
                      child:  Text("Apply for Leave",
                        style: TextStyle(
                            color: Colors.black38,
                            fontSize:SH/60,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                FadeAnimation(
                  0.6,
                  InkWell(
                    onTap: (){
                      controler.getdashboardNavigation(11);
                    },
                    child: Container(
                      width: SW/2,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.green.shade100,
                          borderRadius: const BorderRadius.all(Radius.circular(10))
                      ),
                      child:  Text("Holiday List",
                        style: TextStyle(
                            color: Colors.black38,
                            fontSize:SH/60,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ),
                ),
                // const SizedBox(
                //   height: 10,
                // ),
                // FadeAnimation(
                //   0.6,
                //   InkWell(
                //     onTap: (){
                //       controler.getdashboardNavigation(2);
                //     },
                //     child: Container(
                //       width: SW/2,
                //       alignment: Alignment.centerLeft,
                //       padding: const EdgeInsets.all(20),
                //       decoration: BoxDecoration(
                //           color: Colors.green.shade100,
                //           borderRadius: const BorderRadius.all(Radius.circular(10))
                //       ),
                //       child:  Text("Site Visit",
                //         style: TextStyle(
                //             color: Colors.black38,
                //             fontSize:SH/60,
                //             fontWeight: FontWeight.w500
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 10,
                ),
                FadeAnimation(
                  0.6,
                  InkWell(
                    onTap: (){
                      controler.getdashboardNavigation(4);
                    },
                    child: Container(
                      width: SW/2,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.green.shade100,
                          borderRadius: const BorderRadius.all(Radius.circular(10))
                      ),
                      child:  Text("OnDuty",
                        style: TextStyle(
                            color: Colors.black38,
                            fontSize:SH/60,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                FadeAnimation(
                  0.6,
                  InkWell(
                    onTap: (){
                      controler.getdashboardNavigation(5);
                    },
                    child: Container(
                      width: SW/2,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.green.shade100,
                          borderRadius: const BorderRadius.all(Radius.circular(10))
                      ),
                      child:  Text("Permision",
                        style: TextStyle(
                            color: Colors.black38,
                            fontSize:SH/60,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                FadeAnimation(
                  0.6,
                  InkWell(
                    onTap: (){
                      controler.getdashboardNavigation(12);
                    },
                    child: Container(
                      width: SW/2,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.green.shade100,
                          borderRadius: const BorderRadius.all(Radius.circular(10))
                      ),
                      child:  Text("Active Status",
                        style: TextStyle(
                            color: Colors.black38,
                            fontSize:SH/60,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                FadeAnimation(
                  0.6,
                  InkWell(
                    onTap: (){
                      controler.postlogout();
                    },
                    child: Container(
                      width: SW/2,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.green.shade100,
                          borderRadius: const BorderRadius.all(Radius.circular(10))
                      ),
                      child:  Text("Logout",
                        style: TextStyle(
                            color: Colors.black38,
                            fontSize:SH/60,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),
                FadeAnimation(
                  0.6,
                  InkWell(
                    onTap: (){
                      controler.getdashboardNavigation(13);
                    },
                    child: Container(
                      width: SW/2,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.green.shade100,
                          borderRadius: const BorderRadius.all(Radius.circular(10))
                      ),
                      child:  Text("Miss Punch",
                        style: TextStyle(
                            color: Colors.black38,
                            fontSize:SH/60,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "Cancel",
                      style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  });
}

class Constants {
  Constants._();
  static const double padding = 20;
  static const double avatarRadius = 45;
}
