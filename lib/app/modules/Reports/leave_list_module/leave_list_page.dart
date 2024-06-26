import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:get/get.dart';
import 'package:thulasi/app/modules/Reports/leave_list_module/leave_list_controller.dart';
import '../../../IncludesFiles/_appbar.dart';


class LeaveListPage extends GetView<LeaveListController> {
  @override
  Widget build(BuildContext context)=>GetBuilder<LeaveListController>(builder: (controller) {
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
                child: MyAppBar(screenName: 'Leave Reports',),
              ),
              Container(
                height: height/1.2,
                width: width/1.1,
                child: ListView.builder(
                  itemCount: controller.secScreenData.length,
                  itemBuilder: (BuildContext context1, int index) {
                    return Card(
                      //color: Colors.red,
                      child: SwipeActionCell(
                        key: ObjectKey(index),
                        trailingActions: <SwipeAction>[
                          SwipeAction(
                              icon: const Icon(Icons.check_circle_rounded,color: Colors.green,),
                              onTap: (CompletionHandler handler) async {
                                if(controller.secScreenData[index].status=="H"){
                                  controller.statusUpdataion(controller.secScreenData[index].docNo, "P");
                                }else{
                                  log("Others");
                                }

                              },
                              color: Colors.black12),
                          SwipeAction(
                              icon: const Icon(Icons.cancel,color: Colors.red,),
                              onTap: (CompletionHandler handler) async {
                                if(controller.secScreenData[index].status=="P"){
                                  controller.statusUpdataion(controller.secScreenData[index].docNo, "H");
                                }else{
                                  log("Others");
                                }

                              },
                              color: Colors.black12),
                          SwipeAction(
                              icon: const Icon(Icons.remove_red_eye,color: Colors.deepOrange,),
                              onTap: (CompletionHandler handler) async {
                                controller.postDataPassing(controller.secScreenData[index].docNo);

                              },
                              color: Colors.black12),

                        ],
                        child: ListTile(
                          title: Column(
                            children: [
                              SizedBox(
                                width: width,
                                child: Text(
                                  controller.secScreenData[index].empName.toString(),
                                  style: const TextStyle(color: Colors.purpleAccent,fontWeight: FontWeight.w700),
                                ),
                              ),
                              const SizedBox(height: 5,),
                              SizedBox(
                                width: width,
                                child: Text(
                                    controller.secScreenData[index].fromDate.toString(),
                                    style: const TextStyle(color: Colors.black45,fontWeight: FontWeight.w500)
                                ),
                              ),
                              const SizedBox(height: 5,),
                              SizedBox(
                                width: width,
                                child: Text(
                                    controller.secScreenData[index].toDate.toString(),
                                    style: const TextStyle(color: Colors.teal,fontWeight: FontWeight.w500)
                                ),
                              ),
                              const SizedBox(height: 5,),
                              SizedBox(
                                width: width,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Text('Status      ',
                                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700)
                                        ),
                                        Icon(
                                            controller.secScreenData[index].status.toString()=="P"? Icons.pending:
                                            controller.secScreenData[index].status.toString()=="H"? Icons.pending:
                                            controller.secScreenData[index].status.toString()=="A"?Icons.check_circle:
                                            Icons.cancel,
                                          color: controller.secScreenData[index].status.toString()=="P"? Colors.orangeAccent:
                                          controller.secScreenData[index].status.toString()=="H"? Colors.pinkAccent:
                                          controller.secScreenData[index].status.toString()=="A"? Colors.green:
                                          Colors.red.shade600,

                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          dense: true,
                          leading: CircleAvatar(
                            backgroundColor:Colors.blueAccent,
                            child: Text(controller.secScreenData[index].docNo.toString(),
                              style: TextStyle(color: Colors.white,fontSize: height/80),),
                          ),
                          trailing: CircleAvatar(
                            backgroundColor:Colors.greenAccent,
                            child: Text(
                                controller.secScreenData[index].noDays.toString(),
                                style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w700)
                            ),

                          ),
                          onTap: (){


                          },
                        ),

                      ),
                    );
                  },
                ),
              )


            ],
          ),
        ),

      ),
    );
  });
}
