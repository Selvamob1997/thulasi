import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thulasi/app/IncludesFiles/_appbar.dart';
import 'package:thulasi/app/modules/miss_punch_module/miss_punch_controller.dart';


class MissPunchPage extends GetView<MissPunchController> {
  @override
  Widget build(BuildContext context)=>GetBuilder<MissPunchController>(builder: (myController) {
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
                SizedBox(height: height/60,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: height/30),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(Radius.circular(height/10)),
                    color: Colors.white,
                    shadowColor: Colors.black,
                    child: TextField(
                      controller: myController.type,
                      readOnly:true ,
                      onTap: (){
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Choose Type'),
                              content: SizedBox(
                                width: double.minPositive,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: myController.punchList.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return ListTile(
                                      title: Text(myController.punchList[index].toString()),
                                      onTap: () {
                                        myController.type.text = myController.punchList[index].toString();
                                        myController.inTime.text = "";
                                        myController.outTime.text = "";

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
                      cursorColor: Colors.black12,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: 'Type',
                          prefixIcon: Material(
                            elevation: 0,
                            borderRadius: BorderRadius.all(Radius.circular(height/15)),
                            child: const Icon(
                              Icons.type_specimen,
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
                      controller: myController.attendanceDate,
                      readOnly:true ,
                      onTap: (){
                        myController.selectToDate(1, context);
                      },
                      cursorColor: Colors.black12,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: 'Attendance Date',
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
                      controller: myController.inTime,
                      readOnly:true ,
                      onTap: (){
                        if(myController.type.text.toString()=="Punch In"){
                          myController.selectFromTime(context);
                        }


                      },
                      cursorColor: Colors.black12,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: 'In Time',
                          prefixIcon: Material(
                            elevation: 0,
                            borderRadius: BorderRadius.all(Radius.circular(height/15)),
                            child: const Icon(
                              Icons.watch_later,
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
                      controller: myController.outTime,
                      readOnly:true ,
                      onTap: (){
                        if(myController.type.text.toString()=="Punch Out"){
                          myController.selectToTime(context);
                        }

                      },
                      cursorColor: Colors.black12,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: 'Out Time',
                          prefixIcon: Material(
                            elevation: 0,
                            borderRadius: BorderRadius.all(Radius.circular(height/15)),
                            child: const Icon(
                              Icons.watch_later,
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
                      controller: myController.totalHrs,
                      readOnly:true ,
                      onTap: (){
                        //myController.selectToDate(1,context);
                      },
                      cursorColor: Colors.black12,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: 'Total Hours',
                          prefixIcon: Material(
                            elevation: 0,
                            borderRadius: BorderRadius.all(Radius.circular(height/15)),
                            child: const Icon(
                              Icons.watch_later,
                              color: Colors.orange,
                            ),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                    ),
                  ),
                ),
                // SizedBox(height: height/60,),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: height/30),
                //   child: Material(
                //     elevation: 2.0,
                //     borderRadius: BorderRadius.all(Radius.circular(height/10)),
                //     color: Colors.white,
                //     shadowColor: Colors.black,
                //     child: TextField(
                //       controller: myController.shiftName,
                //       readOnly:true ,
                //       onTap: (){
                //         //myController.selectToDate(1,context);
                //       },
                //       cursorColor: Colors.black12,
                //       keyboardType: TextInputType.text,
                //       decoration: InputDecoration(
                //           labelText: 'Shift Name',
                //           prefixIcon: Material(
                //             elevation: 0,
                //             borderRadius: BorderRadius.all(Radius.circular(height/15)),
                //             child: const Icon(
                //               Icons.date_range,
                //               color: Colors.orange,
                //             ),
                //           ),
                //           border: InputBorder.none,
                //           contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                //     ),
                //   ),
                // ),
                // SizedBox(height: height/60,),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: height/30),
                //   child: Material(
                //     elevation: 2.0,
                //     borderRadius: BorderRadius.all(Radius.circular(height/10)),
                //     color: Colors.white,
                //     shadowColor: Colors.black,
                //     child: TextField(
                //       controller: myController.shiftInName,
                //       readOnly:true ,
                //       onTap: (){
                //         //myController.selectToDate(1,context);
                //       },
                //       cursorColor: Colors.black12,
                //       keyboardType: TextInputType.text,
                //       decoration: InputDecoration(
                //           labelText: 'Shift In Time',
                //           prefixIcon: Material(
                //             elevation: 0,
                //             borderRadius: BorderRadius.all(Radius.circular(height/15)),
                //             child: const Icon(
                //               Icons.date_range,
                //               color: Colors.orange,
                //             ),
                //           ),
                //           border: InputBorder.none,
                //           contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                //     ),
                //   ),
                // ),
                // SizedBox(height: height/60,),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: height/30),
                //   child: Material(
                //     elevation: 2.0,
                //     borderRadius: BorderRadius.all(Radius.circular(height/10)),
                //     color: Colors.white,
                //     shadowColor: Colors.black,
                //     child: TextField(
                //       controller: myController.shiftOutName,
                //       readOnly:true ,
                //       onTap: (){
                //         //myController.selectToDate(1,context);
                //       },
                //       cursorColor: Colors.black12,
                //       keyboardType: TextInputType.text,
                //       decoration: InputDecoration(
                //           labelText: 'Shift Out Time',
                //           prefixIcon: Material(
                //             elevation: 0,
                //             borderRadius: BorderRadius.all(Radius.circular(height/15)),
                //             child: const Icon(
                //               Icons.date_range,
                //               color: Colors.orange,
                //             ),
                //           ),
                //           border: InputBorder.none,
                //           contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                //     ),
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
                      controller: myController.shiftRemarks,
                      cursorColor: Colors.black12,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: 'Remarks',
                          prefixIcon: Material(
                            elevation: 0,
                            borderRadius: BorderRadius.all(Radius.circular(height/15)),
                            child: const Icon(
                              Icons.edit,
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
                myController.postSave();
              },
              child: Container(
                height: height/15,
                width: width,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(width/7),
                      bottomRight: Radius.circular(width/7),
                    )
                ),
                alignment: Alignment.center,
                child: Text('Send Miss Punch',style: TextStyle(color: Colors.white,fontSize: height/35,fontWeight: FontWeight.bold),),

              ),
            )
          ],
        )
    );
  });
}
