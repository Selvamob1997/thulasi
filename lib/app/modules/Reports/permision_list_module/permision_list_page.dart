
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:get/get.dart';
import 'package:thulasi/app/modules/Reports/permision_list_module/permision_list_controller.dart';

import '../../../IncludesFiles/_appbar.dart';


class PermisionListPage extends GetView<PermisionListController> {
  @override
  Widget build(BuildContext context)=>GetBuilder<PermisionListController>(builder: (controller) {
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
                child: MyAppBar(screenName: 'Permision Reports',),
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
                                    controller.secScreenData[index].fromDate.toString(),
                                    style: const TextStyle(color: Colors.black45,fontWeight: FontWeight.w500)
                                ),
                              ),
                              const SizedBox(height: 5,),
                              SizedBox(
                                width: width,
                                child: Text(
                                    controller.secScreenData[index].fromTime.toString(),
                                    style: const TextStyle(color: Colors.teal,fontWeight: FontWeight.w500)
                                ),
                              ),
                              const SizedBox(height: 5,),
                              SizedBox(
                                width: width,
                                child: Text(
                                    controller.secScreenData[index].toTime.toString(),
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

                                        Text(
                                          controller.secScreenData[index].status.toString()=="P"? "Pending":
                                          controller.secScreenData[index].status.toString()=="H"? "Cancel":"Approved",
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
