import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:thulasi/app/modules/dash_board_module/dash_board_controller.dart';

class DashBoardPage extends GetView<DashBoardController> {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>GetBuilder<DashBoardController>(builder: (controller) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height : height,
          width : width,
          decoration: const BoxDecoration(
            gradient:LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Colors.white,
              ],
            )
          ),
          child: Column(
            children: [
              SizedBox(
                height: height/40,
                width: width,
              ),
              SizedBox(
                height: height/3,
                child: Stack(
                  children: [
                    Container(
                      height: height/10,
                      width: width,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: (){
                              controller.getSideMenu(context);
                            }
                            ,child: Container(
                                height: height/25,
                                width: width/10,
                                margin: EdgeInsets.only(left: width/10),
                                child: Image.asset('assets/menu.png')
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              controller.getDashBoardData();
                            },
                            child: Container(
                                height: height/25,
                                width: width/25,
                                margin: EdgeInsets.only(right: width/10),
                                child: Icon(Icons.refresh,color: Colors.redAccent,size: height/30)
                            ),
                          )
                        ],

                      ),
                    ),
                    Container(
                      height: height/4,
                      width: width/1.1,
                      margin: EdgeInsets.only(left: width/20,top: height/12),
                      decoration: BoxDecoration(
                          color: Colors.blue.shade500,
                          borderRadius: BorderRadius.all(Radius.circular(height/50))
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: height/20,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                 height: height/30,
                                 width: width/2,
                                   child: Text(controller.sessionName.toString(),
                                     style: TextStyle(
                                         color: Colors.white,
                                         fontSize: height/30,
                                         fontWeight: FontWeight.bold),
                                   ),
                               ),
                              SizedBox(
                                height: height/30,
                                width: width/5,
                                child: Text('07 - OCT',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: height/60,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height/100,
                          ),
                          SizedBox(
                            height: height/30,
                            width: width/1.3,
                            child: Text(controller.sessionDeptName.toString(),
                              style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: height/50,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            height: height/60,
                          ),
                          Container(
                            height: 1,
                            width: width/1.2,
                            color: Colors.black12,
                          ),
                          SizedBox(
                            height: height/40,
                          ),
                          SizedBox(
                            height: height/50,
                            width: width/1.2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: width/4.5,
                                  alignment: Alignment.center,
                                  child: const Text('Total EL',style: TextStyle(color: Colors.white70,fontWeight: FontWeight.w700),),
                                ),
                                Container(
                                  width: width/4.5,
                                  alignment: Alignment.center,
                                  child: const Text('Total SL',style: TextStyle(color: Colors.white70,fontWeight: FontWeight.w700),),
                                ),
                                Container(
                                  width: width/7,
                                  alignment: Alignment.center,
                                  child: const Text('ComOff ',style: TextStyle(color: Colors.white70,fontWeight: FontWeight.w700),),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          SizedBox(
                            height: height/25,
                            width: width/1.2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: width/4.5,
                                  alignment: Alignment.center,
                                  child:  Text(controller.ELLeave.toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900),),
                                ),
                                Container(
                                  width: 1,
                                  color: Colors.white38,
                                ),
                                Container(
                                  width: width/4.5,
                                  alignment: Alignment.center,
                                  child:  Text(controller.SLLeave.toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900),),
                                ),
                                Container(
                                  width: 1,
                                  color: Colors.white38,
                                ),
                                Container(
                                  width: width/7,
                                  alignment: Alignment.center,
                                  child:  Text(controller.Comff.toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900),),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: height/8,
                      width: width/3.5,
                      margin: EdgeInsets.only(left: width/2.7),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Lottie.asset('assets/user.json')
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                        borderRadius:BorderRadius.all(Radius.circular(height/10)),

                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height/80,
                width: width,
              ),
              Container(
                height: height/25,
                width: width/1.1,
                decoration: BoxDecoration(
                  color: Colors.amber.shade100,
                  borderRadius:BorderRadius.all(Radius.circular(height/10)),
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: (){
                       controller.getdashboardNavigation(6);
                      },child: Container(
                        width: width/2.2,
                        alignment: Alignment.center,
                        child: const Text('Start Attendance',style: TextStyle(color: Colors.black54),),
                      ),
                    ),
                    Container(
                      width: width/2.2,
                      alignment: Alignment.center,
                      child: const Text('Attendance Report',style: TextStyle(color: Colors.black54),),
                      decoration: BoxDecoration(
                        color: Colors.amber.shade300,
                        borderRadius:BorderRadius.all(Radius.circular(height/10)),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height/2.5,
                width: width/1.1,
                child: Obx(()=>GridView.count(
                  crossAxisCount: 7,
                  childAspectRatio: 1,
                  children: [
                    for (int inxex = 0;inxex <controller.secScreenDashBoard.length;inxex++)
                    //if (itemodel.result[cat].itemName.toLowerCase().contains(search.toLowerCase()))
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Card(
                            elevation: 2,
                            color:controller.secScreenDashBoard[inxex].attStatus.toString()=="NA"?Colors.white:
                                  controller.secScreenDashBoard[inxex].attStatus.toString()=="HP"?Colors.cyanAccent:
                                  controller.secScreenDashBoard[inxex].attStatus.toString()=="P"?Colors.green:
                                  Colors.white,
                            child: Container(
                              alignment: Alignment.center,
                              width: width/1.1,
                              margin: const EdgeInsets.all(2),
                              child: Column(
                                children: [
                                  Text(
                                      controller.secScreenDashBoard[inxex].myDay.toString(),
                                      style: TextStyle(fontWeight: FontWeight.w600,
                                        fontSize: height/85,color: Colors.black45,)),
                                  Text(
                                      controller.secScreenDashBoard[inxex].day.toString(),
                                      style: TextStyle(fontWeight: FontWeight.w600,
                                        fontSize: height/50,color: Colors.black54,)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                  ],
                )),

              ),
              Text('Reports',style: TextStyle(color: Colors.black45,fontSize: height/40,fontWeight: FontWeight.w600),),
              SizedBox(
                height: height/12,
                width: width/1.1,
                child:SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: height/15,
                        width: width/5,
                        child: TextButton(
                          onPressed: () {
                           controller.getdashboardNavigation(7);
                          },
                          child: Text('Leave',style: TextStyle(color: Colors.green),),),
                      ),
                      SizedBox(
                        height: height/15,
                        width: width/4,
                        child: TextButton(
                          onPressed: () {
                            controller.getdashboardNavigation(8);
                          },
                          child: Text('Permission',style: TextStyle(color: Colors.orange),),),
                      ),
                      SizedBox(
                        height: height/15,
                        width: width/5,
                        child: TextButton(
                          onPressed: () {
                            controller.getdashboardNavigation(9);
                          },
                          child: Text('On duty',style: TextStyle(color: Colors.pinkAccent),),),
                      ),
                      SizedBox(
                        height: height/15,
                        width: width/5,
                        child: TextButton(
                          onPressed: () {
                            controller.getdashboardNavigation(10);
                          },
                          child: Text('Site Visit',style: TextStyle(color: Colors.cyan),),),
                      )

                    ],
                  ),
                ) ),
            ],
          ),

        ),
      ),
    );
  },
  );
}
