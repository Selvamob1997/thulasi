
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:get/get.dart';
import 'package:thulasi/app/modules/Reports/site_visit_reports_module/site_visit_reports_controller.dart';

import '../../../IncludesFiles/_appbar.dart';



class SiteVisitReportsPage extends GetView<SiteVisitReportsController> {
  @override
  Widget build(BuildContext context)=>GetBuilder<SiteVisitReportsController>(builder: (controller) {
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
                child: MyAppBar(screenName: 'Miss Punch',),
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
                                //controller.postDataPassing(controller.secScreenData[index].docNo);
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
                                    controller.secScreenData[index].attendate.toString(),
                                    style: const TextStyle(color: Colors.black45,fontWeight: FontWeight.w500)
                                ),
                              ),
                              const SizedBox(height: 5,),
                              SizedBox(
                                width: width,
                                child: Row(
                                  children: [
                                    Container(
                                      width: width/4.5,
                                      child: Text(
                                          "Punch Type",
                                          style: const TextStyle(color: Colors.red,fontWeight: FontWeight.w500)
                                      ),
                                    ),
                                    Container(
                                      width: width/2.5,
                                      child: Text(
                                          controller.secScreenData[index].purchase.toString(),
                                          style: const TextStyle(color: Colors.teal,fontWeight: FontWeight.w500)
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5,),
                              SizedBox(
                                width: width,
                                child: Row(
                                  children: [
                                    Container(
                                      width: width/4.5,
                                      child: Text(
                                          "In Time",
                                          style: const TextStyle(color: Colors.teal,fontWeight: FontWeight.w500)
                                      ),
                                    ),
                                    Container(
                                      width: width/2.5,
                                      child: Text(
                                          controller.secScreenData[index].inTime.toString(),
                                          style: const TextStyle(color: Colors.teal,fontWeight: FontWeight.w500)
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5,),
                              SizedBox(
                                width: width,
                                child: Row(
                                  children: [
                                    Container(
                                      width: width/4.5,
                                      child: Text(
                                          "Out Time",
                                          style: const TextStyle(color: Colors.teal,fontWeight: FontWeight.w500)
                                      ),
                                    ),
                                    Container(
                                      width: width/2.5,
                                      child: Text(
                                          controller.secScreenData[index].outTime.toString(),
                                          style: const TextStyle(color: Colors.teal,fontWeight: FontWeight.w500)
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5,),
                              SizedBox(
                                width: width,
                                child: Row(
                                  children: [
                                    Container(
                                      width: width/4.5,
                                      child: Text(
                                          "Total Hrs",
                                          style: const TextStyle(color: Colors.teal,fontWeight: FontWeight.w500)
                                      ),
                                    ),
                                    Container(
                                      width: width/2.5,
                                      child: Text(
                                          controller.secScreenData[index].totalhrs.toString(),
                                          style: const TextStyle(color: Colors.teal,fontWeight: FontWeight.w500)
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                              const SizedBox(height: 5,),
                              SizedBox(
                                width: width,
                                child: Row(
                                  children: [
                                    Container(
                                      width: width/4.5,
                                      child: Text(
                                          "In Time",
                                          style: const TextStyle(color: Colors.teal,fontWeight: FontWeight.w500)
                                      ),
                                    ),
                                    Container(
                                      width: width/2.5,
                                      child: Text(
                                          controller.secScreenData[index].shifintime.toString(),
                                          style: const TextStyle(color: Colors.teal,fontWeight: FontWeight.w500)
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5,),
                              SizedBox(
                                width: width,
                                child: Row(
                                  children: [
                                    Container(
                                      width: width/4.5,
                                      child: Text(
                                          "Out Time",
                                          style: const TextStyle(color: Colors.teal,fontWeight: FontWeight.w500)
                                      ),
                                    ),
                                    Container(
                                      width: width/2.5,
                                      child: Text(
                                          controller.secScreenData[index].shifoutTime.toString(),
                                          style: const TextStyle(color: Colors.teal,fontWeight: FontWeight.w500)
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
                          onTap: (){},
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
