
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thulasi/app/IncludesFiles/_appbar.dart';

import 'package:thulasi/app/modules/apply_leave_module/apply_leave_controller.dart';


class ApplyLeavePage extends GetView<ApplyLeaveController> {
  const ApplyLeavePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)=>GetBuilder<ApplyLeaveController>(builder: (controler) {
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
                child: MyAppBar(screenName: 'Leave Form',),
              ),
              // SizedBox(height: height/60,),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: height/30),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: [
              //       Material(
              //         elevation: 2.0,
              //         borderRadius: BorderRadius.all(Radius.circular(height/10)),
              //         color: Colors.white,
              //         shadowColor: Colors.black,
              //         child: Column(
              //           children: [
              //             Text("Count OF EL"),
              //             Container(
              //               height: height/20,
              //               width: width/2,
              //               alignment: Alignment.center,
              //               child: Text(controler.ELLeave.toString(),),
              //             ),
              //           ],
              //         ),
              //       ),
              //       // Material(
              //       //   elevation: 2.0,
              //       //   borderRadius: BorderRadius.all(Radius.circular(height/10)),
              //       //   color: Colors.white,
              //       //   shadowColor: Colors.black,
              //       //   child: Column(
              //       //     children: [
              //       //       Text("Count OF SL"),
              //       //       Container(
              //       //         height: height/20,
              //       //         width: width/4,
              //       //         alignment: Alignment.center,
              //       //         child: Text(controler.SLLeave.toString(),),
              //       //       ),
              //       //     ],
              //       //   ),
              //       // ),
              //       Material(
              //         elevation: 2.0,
              //         borderRadius: BorderRadius.all(Radius.circular(height/10)),
              //         color: Colors.white,
              //         shadowColor: Colors.black,
              //         child: Column(
              //           children: [
              //             Text("Count OF COFF"),
              //             Container(
              //               height: height/20,
              //               width: width/3,
              //               alignment: Alignment.center,
              //               child: Text(controler.Comff.toString(),),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(height: height/60,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: height/30),
                child: Material(
                  elevation: 2.0,
                  borderRadius: BorderRadius.all(Radius.circular(height/10)),
                  color: Colors.white,
                  shadowColor: Colors.black,
                  child: TextField(
                    controller: controler.leaveType,
                    onChanged: (String value) {},
                    cursorColor: Colors.blue,
                    readOnly: true,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'Leave Type',
                        prefixIcon: Material(
                          elevation: 0,
                          borderRadius: BorderRadius.all(Radius.circular(height/15)),
                          child: const Icon(
                            Icons.pan_tool_alt,
                            color: Colors.orange,
                          ),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                    onTap: (){
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Choose Leave Type'),
                            content: SizedBox(
                              width: double.minPositive,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: controler.secLeaveTypeList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                    title: Text(controler.secLeaveTypeList[index].descripition),
                                    onTap: () {

                                      controler.leaveType.text = controler.secLeaveTypeList[index].descripition;
                                      controler.leaveCode = controler.secLeaveTypeList[index].code;
                                        Navigator.pop(context,);

                                    },
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: height/60,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: height/30),
                child: Material(
                  elevation: 2.0,
                  borderRadius: BorderRadius.all(Radius.circular(height/10)),
                  color: Colors.white,
                  shadowColor: Colors.black,
                  child: TextField(
                    controller: controller.fromdate,
                    readOnly:true ,
                    onTap: (){
                      controller.selectToDate(1,context);
                    },
                    cursorColor: Colors.black12,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'From Date',
                        prefixIcon: Material(
                          elevation: 0,
                          borderRadius: BorderRadius.all(Radius.circular(height/15)),
                          child: const Icon(
                            Icons.date_range,
                            color: Colors.orange,
                          ),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                  ),
                ),
              ),
              SizedBox(height: height/60,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: height/30),
                child: Material(
                  elevation: 2.0,
                  borderRadius: BorderRadius.all(Radius.circular(height/10)),
                  color: Colors.white,
                  shadowColor: Colors.black,
                  child: TextField(
                    controller: controler.todate,
                    readOnly: true,
                    onChanged: (String value) {},
                    cursorColor: Colors.black12,
                    keyboardType: TextInputType.text,
                    onTap: (){
                      controller.selectToDate(2,context);
                    },
                    decoration: InputDecoration(
                        labelText: 'To Date',
                        prefixIcon: Material(
                          elevation: 0,
                          borderRadius: BorderRadius.all(Radius.circular(height/15)),
                          child: const Icon(
                            Icons.date_range,
                            color: Colors.orange,
                          ),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                  ),
                ),
              ),
              SizedBox(height: height/60,),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: height/30),
                      child: Material(
                        borderRadius: BorderRadius.all(Radius.circular(height/10)),
                        elevation: 2.0,
                        color: Colors.white,
                        shadowColor: Colors.black,
                        child:  TextField(
                          readOnly: true,
                          controller: controller.nodays,
                          cursorColor: Colors.black12,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: 'No Of Days',
                              prefixIcon: Material(
                                elevation: 0,
                                borderRadius: BorderRadius.all(Radius.circular(height/15)),
                                child: const Icon(
                                  Icons.date_range,
                                  color: Colors.orange,
                                ),
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: height/30),
                      child: Material(
                        borderRadius: BorderRadius.all(Radius.circular(height/10)),
                        elevation: 2.0,
                        color: Colors.white,
                        shadowColor: Colors.black,
                        child: IconButton(
                          onPressed: () {
                            controler.oFFdayCalc();
                          },
                          icon: Icon(controler.nodays.text=='0.5'?Icons.check_circle_rounded :Icons.check_box_outline_blank_sharp,color: Colors.deepOrange,size: height/30,),),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height/60,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: height/30),
                child: Material(
                  elevation: 2.0,
                  borderRadius: BorderRadius.all(Radius.circular(height/10)),
                  color: Colors.white,
                  shadowColor: Colors.black,
                  child: TextField(
                    controller: controler.comments,
                    onChanged: (String value) {},
                    cursorColor: Colors.black12,
                    keyboardType: TextInputType.text,
                    maxLength: 50,
                    decoration: InputDecoration(
                        labelText: 'Reason',
                        prefixIcon: Material(
                          elevation: 0,
                          borderRadius: BorderRadius.all(Radius.circular(height/15)),
                          child: const Icon(
                            Icons.comment,
                            color: Colors.orange,
                          ),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                  ),
                ),
              ),
            ],
          ),
        ),
        persistentFooterButtons: [
          InkWell(
            onTap: (){
              controller.getDocNo==0?controller.postDataSave(2):controller.postDataSave(3);
            },
            child: Container(
              height: height/15,
              width: width,
              decoration: BoxDecoration(
                  color: controller.getDocNo==0?Colors.orangeAccent:Colors.green,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(width/7),
                    bottomRight: Radius.circular(width/7),
                  )
              ),
              alignment: Alignment.center,
              child: Text(controller.getDocNo==0?'Send Leave Request':'Update Leave Request',style: TextStyle(color: Colors.white,fontSize: height/35,fontWeight: FontWeight.bold),),

            ),
          )
        ],
      ),
    );
  });
}
