
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thulasi/app/IncludesFiles/_appbar.dart';
import 'package:thulasi/app/modules/holi_day_list_module/holi_day_list_controller.dart';


class HoliDayListPage extends GetView<HoliDayListController> {
  @override
  Widget build(BuildContext context)=>GetBuilder<HoliDayListController>(builder: (myController) {
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
                child: MyAppBar(screenName: 'Holiday List',),
              ),
              SizedBox(
                height: height/1.2,
                width: width,
                child: ListView.builder(
                  itemCount: myController.secScreenHoliday.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        dense: true,
                        title: Column(
                          children: [
                            Container(
                              height: height/40,
                              width: width,
                              alignment: Alignment.centerLeft,
                              child: Text(myController.secScreenHoliday[index].uRmrks.toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepOrange),),

                            ),
                            Container(
                              height: height/40,
                              width: width,
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: width/3.5,
                                    child: Text("Start Date",style: TextStyle(fontSize: height/60,fontWeight: FontWeight.w500),),
                                  ),
                                  SizedBox(
                                      width: width/3.5,
                                      child: Text(myController.secScreenHoliday[index].sTADATE.toString())),
                                ],
                              ),
                            ),
                            Container(
                              height: height/40,
                              width: width,
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: width/3.5,
                                    child: Text("End Date",style: TextStyle(fontSize: height/60,fontWeight: FontWeight.w500),),
                                  ),
                                  SizedBox(
                                      width: width/3.5,
                                      child: Text(myController.secScreenHoliday[index].eNDDATE.toString())),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },),
              )
            ],
          ),
        ),
      ),
    );
  });
}
