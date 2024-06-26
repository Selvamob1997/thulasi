
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thulasi/app/IncludesFiles/_appbar.dart';
import 'package:thulasi/app/modules/apply_on_duty_module/apply_on_duty_controller.dart';


class ApplyOnDutyPage extends GetView<ApplyOnDutyController> {
  @override
  Widget build(BuildContext context)=>GetBuilder<ApplyOnDutyController>(builder: (controler) {
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
                child: MyAppBar(screenName: 'OnDuty Form',),
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
                    controller: controler.Ondutysessiontype,
                    onChanged: (String value) {},
                    cursorColor: Colors.blue,
                    readOnly: true,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'Onduty session type',
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
                                itemCount: controler.secOnduty.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                    title: Text(controler.secOnduty[index].toString()),
                                    onTap: () {
                                      controler.Ondutysessiontype.text = controler.secOnduty[index].toString();
                                      controller.datechecking(controler.Ondutysessiontype.text);
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
                    controller: controler.fromdate,
                    readOnly:true ,
                    onTap: (){
                      if(controller.datepicker){

                      }else{
                        controler.selectToDate(1,context);
                      }


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
                    readOnly:true ,
                    onTap: (){
                      if(controller.datepicker){

                      }else{
                        controler.selectToDate(2,context);
                      }

                    },
                    cursorColor: Colors.black12,
                    keyboardType: TextInputType.text,
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: height/30),
                child: Material(
                  elevation: 2.0,
                  borderRadius: BorderRadius.all(Radius.circular(height/10)),
                  color: Colors.white,
                  shadowColor: Colors.black,
                  child: TextField(
                    controller: controler.fromLocation,
                    cursorColor: Colors.black12,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'From Location',
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
                    controller: controler.tolocation,
                    cursorColor: Colors.black12,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'To Location',
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
                    controller: controler.fromTime,
                    readOnly:true ,
                    onTap: (){
                      controler.selectFromTime(context);
                    },
                    cursorColor: Colors.black12,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'From Time',
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
                    controller: controler.toTime,
                    readOnly:true ,
                    onTap: (){
                      controler.selectToTime(context);
                    },
                    cursorColor: Colors.black12,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'To Time',
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
                    controller: controler.purposecomment,
                    onChanged: (String value) {},
                    cursorColor: Colors.black12,
                    keyboardType: TextInputType.text,
                    maxLength: 50,
                    decoration: InputDecoration(
                        labelText: 'Purpose',
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
              controller.getDocNo==0?controler.postSave(2):controler.postSave(3);
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
              child: Text(controller.getDocNo==0?'Send OnDuty Request':'Update OnDuty Request',style: TextStyle(color: Colors.white,fontSize: height/35,fontWeight: FontWeight.bold),),

            ),
          )
        ],
      ),
    );
  });
}
