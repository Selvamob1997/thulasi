import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thulasi/app/IncludesFiles/_appbar.dart';
import 'package:thulasi/app/modules/Reports/onduty_master_approve_module/onduty_master_approve_controller.dart';


class OndutyMasterApprovePage extends GetView<OndutyMasterApproveController> {
  @override
  Widget build(BuildContext context)=>GetBuilder<OndutyMasterApproveController>(builder: (controller) {
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
                                        Icon(
                                          controller.secScreenData[index].status.toString()=="P"? Icons.pending:
                                          controller.secScreenData[index].status.toString()=="H"? Icons.pending:
                                          Icons.check_circle,
                                          color: controller.secScreenData[index].status.toString()=="P"? Colors.orangeAccent:
                                          controller.secScreenData[index].status.toString()=="H"? Colors.red:
                                          Colors.green,

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

                     // ),
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
