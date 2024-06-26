// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:thulasi/app/IncludesFiles/_appbar.dart';
import 'package:thulasi/app/modules/site_vist_module/site_vist_controller.dart';


class SiteVistPage extends GetView<SiteVistController> {
    SiteVistPage({Key? key}) : super(key: key);
   var dd = Get.arguments['ScreenName'];

  @override
  Widget build(BuildContext context)=>GetBuilder<SiteVistController>(builder: (controlermain) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                height: height/10,
                width: width,
                alignment: Alignment.center,
                child: MyAppBar(screenName: dd,),
              ),
              Container(
                height: height/3,
                width: width,
                margin: EdgeInsets.only(left: width/20),
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(target: controller.latlong!,zoom: 15.0),
                  markers: <Marker>{
                    Marker(
                      markerId: const MarkerId('1'),
                      position: controller.latlong!,
                      infoWindow: const InfoWindow(title: 'My Position')
                    )
                  },
                ),

              ),
              SizedBox(height: height/50,),
              Card(
                elevation: 5,
                color: Colors.white.withOpacity(0.8),
                child: Column(
                  children: [
                    Container(
                      height: height/25,
                      width: width/1.1,
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: width/50),
                      child: Row(
                        children: [
                          SizedBox(width: width/3,child:  const Text("Name",style: TextStyle(color: Colors.black38),)),
                          Text(controlermain.sessionName.toString()),
                        ],
                      ),
                    ),
                    Container(
                      height: height/30,
                      width: width/1.1,
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: width/50),
                      child: Row(
                        children: [
                          SizedBox(width: width/3,child:  const Text("Department Name",style: TextStyle(color: Colors.black38),)),
                          Text(controlermain.sessionDeptName.toString()),
                        ],
                      ),
                    ),
                    Container(
                      height: height/30,
                      width: width/1.1,
                      margin: EdgeInsets.only(left: width/50),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          SizedBox(width: width/3,child: const Text("Your Latitude",style: TextStyle(color: Colors.black38),)),
                          Text(controlermain.insetlat.toString()),
                        ],
                      ),
                    ),
                    Container(
                      height: height/30,
                      width: width/1.1,
                      margin: EdgeInsets.only(left: width/50),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          SizedBox(width: width/3,child:  const Text("Your Longitude",style: TextStyle(color: Colors.black38),)),
                          Text(controlermain.insetlon.toString()),
                        ],
                      ),
                    ),
                    Container(
                      height: height/30,
                      width: width/1.1,
                      margin: EdgeInsets.only(left: width/50),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          SizedBox(width: width/3,child:  const Text("Site In Time",style: TextStyle(color: Colors.black38),)),
                          Text(controlermain.getintime.toString()),
                        ],
                      ),
                    ),
                    Container(
                      height: height/30,
                      width: width/1.1,
                      margin: EdgeInsets.only(left: width/50),
                      alignment: Alignment.centerLeft,
                      child: Text(controlermain.insetAddress.toString()),
                    )
                  ],
                ),
              ),
              SizedBox(height: height/50,),
              Card(
                elevation: 5,
                color: Colors.lightBlueAccent.withOpacity(0.8),
                child: InkWell(
                  onTap: (){
                    controlermain.secRXCardCode.clear();
                    for(int i=0;i<controlermain.rawCardCodeMaster.result!.length;i++){
                      controlermain.secRXCardCode.add(RXCardCode(controlermain.rawCardCodeMaster.result![i].cardCode, controlermain.rawCardCodeMaster.result![i].cardName));
                    }
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return StatefulBuilder(builder: (context, StateSetter setState) {
                          return AlertDialog(
                            title: TextField(
                              cursorColor: Colors.blue,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  labelText: "Search here...",
                                  hintText: "Search here...",
                                  prefixIcon: Material(
                                    elevation: 0,
                                    borderRadius: BorderRadius.all(Radius.circular(height/15)),
                                    child: const Icon(
                                      Icons.search,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/70)),
                              onChanged: (vv){
                                controlermain.searchvarible=vv.toString();
                                controlermain.secRXCardCode.clear();
                                for(int i=0;i<controlermain.rawCardCodeMaster.result!.length;i++){
                                  if(controlermain.rawCardCodeMaster.result![i].cardName.toString().contains(controlermain.searchvarible.toString())){
                                    controlermain.secRXCardCode.add(
                                        RXCardCode(
                                            controlermain.rawCardCodeMaster.result![i].cardCode,
                                            controlermain.rawCardCodeMaster.result![i].cardName)
                                    );
                                  }
                                }
                              },
                            ),
                            content: SizedBox(
                              width: double.minPositive,
                              child: Obx(()=> ListView.builder(
                                shrinkWrap: true,
                                itemCount: controlermain.secRXCardCode.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                    title: Text(controlermain.secRXCardCode[index].cardName.toString()),
                                    onTap: () {
                                      controlermain.cardname.value = controlermain.secRXCardCode[index].cardName.toString();
                                      controlermain.cardcode.value = controlermain.secRXCardCode[index].cardCode.toString();
                                      Navigator.pop(context,);
                                      controlermain.searchvarible='';

                                    },
                                  );
                                },
                              ),)
                            ),
                          );
                        },
                        );

                      },
                    );
                  },
                  child: Container(
                    width: width/1.1,
                    height: 50,
                    margin: EdgeInsets.only(left: width/50),
                    child: Column(
                      children: [
                        SizedBox(height: height/100,),
                        Obx(()=> Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(left: width/50),
                            child: Text(controlermain.cardname.toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: height/75),),
                        ),),
                        SizedBox(height: height/100,),
                        Obx(()=> Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(left: width/50),
                            child: Text(controlermain.cardcode.toString(),style: const TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                        ),),
                      ],
                    )

                  ),
                ),
              )
            ],
          ),
        ),
        persistentFooterButtons: [
          InkWell(
            onTap: (){
              controlermain.checkInsert?controlermain.postCheckingIn(3,'C'):controlermain.postCheckingIn(2,'O');
            },
            child: Container(
              height: height/15,
              width: width,
              decoration: BoxDecoration(
                  color: controlermain.checkInsert?Colors.pinkAccent:Colors.orangeAccent,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(width/7),
                      bottomRight: Radius.circular(width/7),
                  )
              ),
              alignment: Alignment.center,
              child: Text( controlermain.checkInsert?'Check Out':  'Check IN',style: TextStyle(color: Colors.white,fontSize: height/35,fontWeight: FontWeight.bold),),

            ),
          )
        ],
      ),
    );
  });
}
