
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:get/get.dart';
import 'package:thulasi/app/modules/Reports/on_duty_master_module/on_duty_master_controller.dart';

import '../../../IncludesFiles/_appbar.dart';


class OnDutyMasterPage extends GetView<OnDutyMasterController> {
  @override
  Widget build(BuildContext context)=>GetBuilder<OnDutyMasterController>(builder: (controller) {
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
                child: MyAppBar(screenName: 'On duty Reports',),
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
                                  controller.secScreenData[index].empName .toString(),
                                  style: const TextStyle(color: Colors.purpleAccent,fontWeight: FontWeight.w700),
                                ),
                              ),
                              const SizedBox(height: 5,),
                              SizedBox(
                                width: width,
                                child: Text(
                                  controller.secScreenData[index].onDutyType .toString(),
                                  style: const TextStyle(color: Colors.pinkAccent,fontWeight: FontWeight.w700),
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
                                    style: const TextStyle(color: Colors.black45,fontWeight: FontWeight.w500)
                                ),
                              ),
                              const SizedBox(height: 5,),
                              SizedBox(
                                width: width,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        controller.secScreenData[index].fromTime.toString(),
                                        style: const TextStyle(color: Colors.teal,fontWeight: FontWeight.w500)
                                    ),
                                    Text(
                                        controller.secScreenData[index].fromTime.toString(),
                                        style: const TextStyle(color: Colors.teal,fontWeight: FontWeight.w500)
                                    ),
                                    Text(
                                        controller.secScreenData[index].toTime.toString(),
                                        style: const TextStyle(color: Colors.teal,fontWeight: FontWeight.w500)
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5,),
                              SizedBox(
                                width: width,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        controller.secScreenData[index].fromLoc.toString(),
                                        style: const TextStyle(color: Colors.red,fontWeight: FontWeight.w500)
                                    ),
                                    Text(
                                        controller.secScreenData[index].toLoc.toString(),
                                        style: const TextStyle(color: Colors.teal,fontWeight: FontWeight.w500)
                                    ),
                                  ],
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

                                        Text(
                                          controller.secScreenData[index].status.toString()=="P"? "Pending":
                                          controller.secScreenData[index].status.toString()=="R"? "Cancel":"Approved",
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5,),
                              Visibility(
                                visible: controller.sessionApprovel=="Y"?true:false,
                                child: SizedBox(
                                  width: width,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          ElevatedButton(onPressed: (){
                                            controller.statusUpdataion(controller.secScreenData[index].docNo, "A");
                                          }, child: Text("Approve")),
                                          SizedBox(width: width/100,),
                                          ElevatedButton(
                                            onPressed: (){
                                              controller.statusUpdataion(controller.secScreenData[index].docNo, "R");
                                            }, child: Text("Reject"),
                                            style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                                          ),

                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                              )
                            ],
                          ),
                          dense: true,
                          leading: CircleAvatar(
                            maxRadius: 30,
                            minRadius: 30,
                            backgroundColor:Colors.blueAccent,
                            child: Text(controller.secScreenData[index].docNo.toString(),
                              style: TextStyle(color: Colors.white,fontSize: height/80),),
                          ),
                          trailing: CircleAvatar(
                            backgroundColor:Colors.greenAccent,

                            maxRadius: 30,
                            minRadius: 30,
                            child: Container(
                              child: Text(
                                  controller.secScreenData[index].toTime.toString(),
                                  style:  TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: height/75)
                              ),
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
