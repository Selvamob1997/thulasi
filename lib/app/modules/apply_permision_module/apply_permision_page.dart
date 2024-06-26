import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thulasi/app/IncludesFiles/_appbar.dart';
import 'package:thulasi/app/modules/apply_permision_module/apply_permision_controller.dart';



class ApplyPermisionPage extends GetView<ApplyPermisionController> {
  @override
  Widget build(BuildContext context)=>GetBuilder<ApplyPermisionController>(builder: (controler) {
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
                child: MyAppBar(screenName: 'Permision Form',),
              ),
              SizedBox(height: height/60,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: height/30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Material(
                      elevation: 2.0,
                      borderRadius: BorderRadius.all(Radius.circular(height/10)),
                      color: Colors.white,
                      shadowColor: Colors.black,
                      child: Column(
                        children: [
                          Text("Total Permission"),
                          Container(
                            height: height/20,
                            width: width/2,
                            alignment: Alignment.center,
                            child: Text(controler.TotalPermision.toString(),),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: height/20,
                      width: width/3.5,
                      alignment: Alignment.center,

                    ),

                  ],
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
                      controler.selectToDate(1,context);
                    },
                    cursorColor: Colors.black12,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'Date',
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
                    controller: controler.totalTime,
                    cursorColor: Colors.black12,
                    keyboardType: TextInputType.text,
                    readOnly: true,
                    decoration: InputDecoration(
                        labelText: 'Total Time',
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
                    controller: controler.comments,
                    onChanged: (String value) {},
                    cursorColor: Colors.black12,
                    keyboardType: TextInputType.text,
                    maxLength: 50,
                    decoration: InputDecoration(
                        labelText: 'Reson',
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
                  color: controller.getDocNo==0? Colors.orangeAccent:Colors.green,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(width/7),
                    bottomRight: Radius.circular(width/7),
                  )
              ),
              alignment: Alignment.center,
              child: Text(controller.getDocNo==0?'Send Permision Request':'Update Permision Request',style: TextStyle(color: Colors.white,fontSize: height/35,fontWeight: FontWeight.bold),),

            ),
          )
        ],
      ),
    );
  });
}
