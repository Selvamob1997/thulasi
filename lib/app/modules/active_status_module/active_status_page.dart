import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:get/get.dart';
import 'package:thulasi/app/modules/active_status_module/active_status_controller.dart';

import '../../IncludesFiles/_appbar.dart';


class ActiveStatusPage extends GetView<ActiveStatusController> {
  const ActiveStatusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)=>GetBuilder<ActiveStatusController>(builder: (myController) {
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
                child: MyAppBar(screenName: 'Active Status',),
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
                        child: ListTile(
                          title: Column(
                            children: [
                              SizedBox(
                                width: width,
                                child: Text(
                                  controller.secScreenData[index].name.toString(),
                                  style: const TextStyle(color: Colors.purpleAccent,fontWeight: FontWeight.w700),
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
                                          controller.secScreenData[index].sattus.toString()=="Lunch"? Icons.pending:
                                          controller.secScreenData[index].sattus.toString()=="Active"?Icons.check_circle:
                                          Icons.cancel,
                                          color: controller.secScreenData[index].sattus.toString()=="P"? Colors.orangeAccent:
                                          controller.secScreenData[index].sattus.toString()=="Lunch"? Colors.pinkAccent:
                                          controller.secScreenData[index].sattus.toString()=="Active"? Colors.green:
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
                            child: Text(controller.secScreenData[index].empID.toString(),
                              style: TextStyle(color: Colors.white,fontSize: height/80),),
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