// ignore_for_file: prefer_typing_uninitialized_variables
import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart' as loc;
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thulasi/app/data/Model/getBranchModel.dart';
import 'package:thulasi/app/utils/Utilites.dart';
import '../../data/repository/_allAPIList.dart';
import  'package:intl/intl.dart';
import  'dart:math' as Math;
import  'package:vector_math/vector_math.dart' as Vmath;

class MapsActivityController extends GetxController{
  static MapsActivityController instance = Get.find();
  late Position position;
  loc.Location location = loc.Location();
  late bool _serviceEnabled;
  late loc.PermissionStatus _permissionGranted;
  LatLng? latlong ;
  RxString insetlat="0".obs;
  var insetlon='0'.obs;
  var insetAddress='0'.obs;
  var insetlocation='0'.obs;
  var sessionUseId  =   '';
  var sessionName = '';
  var sessionDeptCode = '';
  var sessionDeptName = '';
  var sessionEmpId = '';
  late final CameraPosition kGoogle;
  Completer<GoogleMapController> controller = Completer();
  var checkStatus;
  var attendancestatus=''.obs;
  var getintime='';
  var getcurrendate='';
  late getBranchModel rawgetBranchModel;
  List<BranchScreen> secBranchScreen=[];
  var branchName ='';
  var branchCode='';
  double tolrenaces=300;
  double diff=0;
  var fromLat='0';
  var fromLong='0';

  @override
  void onInit() {
    // TODO: implement onInit
    getintime = DateFormat("hh:mm:ss a").format(DateTime.now());
    getcurrendate = DateFormat("dd-MM-yyyy").format(DateTime.now());
    log(getcurrendate+" "+getintime);
    getStringValuesSF();
    super.onInit();
  }

  getStringValuesSF() async {
    log("message");
    SharedPreferences prefs =await SharedPreferences.getInstance();
    sessionUseId  =   prefs.getString('UserID').toString();
    sessionName = prefs.getString('FirstName').toString();
    sessionDeptCode = prefs.getString('DeptCode').toString();
    sessionDeptName = prefs.getString('DeptName').toString();
    sessionEmpId = prefs.getString('ExtEmpNo').toString();
    fromLat = prefs.getString('FromLat').toString();
    fromLong = prefs.getString('FromLong').toString();
    log(sessionName);
    if(fromLat.toString()=="0"){
      Utilities.showDialaogboxWarning(Get.context, "Check The Employee Master Lat And Long",);
    }else{
      update();
      main();
    }

  }

  main() async {
    log('Main');
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    update();
    permision();
  }

  permision() async {
    log('permision');
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == loc.PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != loc.PermissionStatus.granted) {
        return;
      }
    }
    update();
    Utilities.showMapLoader();
    getLocation();
  }

  getLocation() async {
    log('getLocation');
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    latlong = LatLng(position.latitude, position.longitude);
    insetlat=position.latitude.toString().obs;
    insetlon=position.longitude.toString().obs;
    log(position.latitude.toString());
    log(position.longitude.toString());
    update();
    _getAddressFromLatLng(position.latitude, position.longitude, position);
  }

  Future<void> _getAddressFromLatLng(lat, lang, Position position) async {
    await placemarkFromCoordinates(position.latitude, position.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
        insetAddress =
        '${place.street}, ${place.subLocality}, ${place.locality},${place.administrativeArea}, ${place.postalCode}'.obs;
        insetlocation = place.subLocality.toString().obs;

        log(insetAddress.toString());


      checkattendance();
      update();
    }).catchError((e) {
      debugPrint(e.toString());
    });
  }

  checkattendance(){
    Allapi.postattendance(false,//isloading,
      3,// formid,
      sessionName,//name,
      sessionEmpId,//empId,
      getcurrendate,//date,
      getcurrendate+" "+getintime,//day,
      insetlat.toString()+","+insetlon.toString(),//frmlatlong,
      insetAddress.toString(),//fromplace,
      '',//tolatlng,
      '',//toplace,
      '',//totaldistance,
      '',//month,
      '',//remarks,
      sessionUseId,//createby,
      '',//modifiedBy,
      '0',//approvestatus,
      insetlocation.toString(),//locationtype,
      '',//locationnanme,
      '',//description,
      getintime,//fromtime,
      '',//totime,
      'HalfDay',//finalstatus
    ).then((value) => {

      if(value.statusCode==200){
        Utilities.closeLoader(),
        attendancestatus = jsonDecode(value.body)['status'].toString().obs,

        getBranch(),
        if(jsonDecode(value.body)['status'] == 0){
          log(value.body),
          update(),
        }else{
          attendancestatus = jsonDecode(value.body)['result'][0]['AttendanceStatus'].toString().obs,
          branchCode = jsonDecode(value.body)['result'][0]['BranchCode'].toString(),
          branchName = jsonDecode(value.body)['result'][0]['BranchName'].toString(),

          log(value.body),
          update(),
        }

      }
    });

  }

  startattendance(){
    int meatervalidation=0;
    double earthRadius = 6371000; //meters
    double dLat = Vmath.radians(double.parse(insetlat.toString())-double.parse(fromLat.toString()));
    double dLng = Vmath.radians(double.parse(insetlon.toString())-double.parse(fromLong.toString()));
    double a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.cos(Vmath.radians(double.parse(insetlat.toString()))) *Math. cos(Vmath.radians(double.parse(fromLat.toString()))) * Math.sin(dLng/2) * Math.sin(dLng/2);
    double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
    double dist =  (earthRadius * c);
    print(dist.toString());
    diff=(earthRadius * c);
    double dd= tolrenaces;
    print("Distances - $dist");
    print("Total - "+dd.toString());
    if (dist>dd){
      print(meatervalidation=1);
    }else{
      print(meatervalidation=0);
    }

    if(meatervalidation==1){
      Utilities.showDialaogboxWarningMessage(Get.context, "Check Out below the 100 meters - "+dist.toString(), 'Notification');
    }else{
      Allapi.postattendance(true,//isloading,
        1,// formid,
        sessionName,//name,
        sessionEmpId,//empId,
        getcurrendate+" "+getintime,//date,
        getcurrendate+" "+getintime,//day,
        "$insetlat,$insetlon",//frmlatlong,
        insetAddress.toString(),//fromplace,
        '',//tolatlng,
        '',//toplace,
        branchName,//totaldistance,
        '',//month,
        branchCode,//remarks,
        sessionUseId,//createby,
        '',//modifiedBy,
        '0',//approvestatus,
        insetlocation.toString(),//locationtype,
        '',//locationnanme,
        '',//description,
        getintime,//fromtime,
        '',//totime,
        'HalfDay',//finalstatus
      ).then((value) => {
        log(value.body),
        if(value.statusCode==200){
          Utilities.closeLoader(),
          checkStatus = jsonDecode(value.body)['status'] = 0,
          if(checkStatus==false){
            Utilities.alertsnackBar('Error','Somthing went wrong...',2),
            update(),
          }else{
            //Utilities.alertsnackBar('Success',jsonDecode(value.body)['result'][0]['STATUSNAME'].toString(),3),
            log(jsonDecode(value.body)['result'][0]['STATUSNAME'].toString()),
            checkattendance(),
            log("Close...."),
            update(),
            //Utilities.closeLoader(),
          }
        }
      });

    }

  }

  stopattendance(){
    int meatervalidation=0;
    double earthRadius = 6371000; //meters
    double dLat = Vmath.radians(double.parse(insetlat.toString())-double.parse(fromLat.toString()));
    double dLng = Vmath.radians(double.parse(insetlon.toString())-double.parse(fromLong.toString()));
    double a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.cos(Vmath.radians(double.parse(insetlat.toString()))) *Math. cos(Vmath.radians(double.parse(fromLat.toString()))) * Math.sin(dLng/2) * Math.sin(dLng/2);
    double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
    double dist =  (earthRadius * c);
    print(dist.toString());
    diff=(earthRadius * c);
    double dd= tolrenaces;
    print("Distances - $dist");
    print("Total - "+dd.toString());
    if (dist>dd){
      print(meatervalidation=1);
    }else{
      print(meatervalidation=0);
    }

    if(meatervalidation==1){
      Utilities.showDialaogboxWarningMessage(Get.context, "Check Out below the 100 meters - "+dist.toString(), 'Notification');
    }else{
    Allapi.postattendance(true,//isloading,
      2,// formid,
      sessionName,//name,
      sessionEmpId,//empId,
      getcurrendate,//date,
      getcurrendate+" "+getintime,//day,
      insetlat.toString()+","+insetlon.toString(),//frmlatlong,
      insetAddress.toString(),//fromplace,
      insetlat.toString()+","+insetlon.toString(),//tolatlng,
      insetAddress.toString(),//toplace,
      '',//totaldistance,
      '',//month,
      '',//remarks,
      sessionUseId,//createby,
      '',//modifiedBy,
      '0',//approvestatus,
      insetlocation.toString(),//locationtype,
      insetlocation.toString(),//locationnanme,
      '',//description,
      getintime,//fromtime,
      getintime,//totime,
      'Present',//finalstatus
    ).then((value) => {
      log(value.body),
      if(value.statusCode==200){
        Utilities.closeLoader(),
        checkStatus = jsonDecode(value.body)['status'] = 0,
        update(),
        if(checkStatus==false){
          Utilities.alertsnackBar('Error','Somthing went wrong...',2),
          //Utilities.closeLoader(),
          update(),
        }else{
          Utilities.closeLoader(),
          // Utilities.alertsnackBar('Success',jsonDecode(value.body)['result'][0]['STATUSNAME'].toString(),3),
          log(jsonDecode(value.body)['result'][0]['STATUSNAME'].toString()),
          Get.back(),
          log("Close...."),
          //Utilities.closeLoader(),
          update(),
        }
      }
    });
    }
  }

  lunchIn(){
    int meatervalidation=0;
    double earthRadius = 6371000; //meters
    double dLat = Vmath.radians(double.parse(insetlat.toString())-double.parse(fromLat.toString()));
    double dLng = Vmath.radians(double.parse(insetlon.toString())-double.parse(fromLong.toString()));
    double a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.cos(Vmath.radians(double.parse(insetlat.toString()))) *Math. cos(Vmath.radians(double.parse(fromLat.toString()))) * Math.sin(dLng/2) * Math.sin(dLng/2);
    double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
    double dist =  (earthRadius * c);
    print(dist.toString());
    diff=(earthRadius * c);
    double dd= tolrenaces;
    print("Distances - $dist");
    print("Total - "+dd.toString());
    if (dist>dd){
      print(meatervalidation=1);
    }else{
      print(meatervalidation=0);
    }

    if(meatervalidation==1){
      Utilities.showDialaogboxWarningMessage(Get.context, "Check Out below the 100 meters - "+dist.toString(), 'Notification');
    }else{
    Allapi.postattendance(true,//isloading,
      4,// formid,
      sessionName,//name,
      sessionEmpId,//empId,
      getcurrendate,//date,
      getcurrendate+" "+getintime,//day,
      insetlat.toString()+","+insetlon.toString(),//frmlatlong,
      insetAddress.toString(),//fromplace,
      insetlat.toString()+","+insetlon.toString(),//tolatlng,
      insetAddress.toString(),//toplace,
      '',//totaldistance,
      '',//month,
      '',//remarks,
      sessionUseId,//createby,
      '',//modifiedBy,
      '0',//approvestatus,
      insetlocation.toString(),//locationtype,
      insetlocation.toString(),//locationnanme,
      '',//description,
      getintime,//fromtime,
      getintime,//totime,
      'Present',//finalstatus
    ).then((value) => {
      log(value.body),
      if(value.statusCode==200){
        Utilities.closeLoader(),
        checkStatus = jsonDecode(value.body)['status'] = 0,
        if(checkStatus==false){
          Utilities.alertsnackBar('Error','Somthing went wrong...',2),
          //Utilities.closeLoader(),
          update(),
        }else{
         // Utilities.alertsnackBar('Success',jsonDecode(value.body)['result'][0]['STATUSNAME'].toString(),3),
          log(jsonDecode(value.body)['result'][0]['STATUSNAME'].toString()),
          Get.back(),
          log("Close...."),
          //Utilities.closeLoader(),
          update(),
        }
      }
    });
    }
  }

  lunchout(){
    int meatervalidation=0;
    double earthRadius = 6371000; //meters
    double dLat = Vmath.radians(double.parse(insetlat.toString())-double.parse(fromLat.toString()));
    double dLng = Vmath.radians(double.parse(insetlon.toString())-double.parse(fromLong.toString()));
    double a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.cos(Vmath.radians(double.parse(insetlat.toString()))) *Math. cos(Vmath.radians(double.parse(fromLat.toString()))) * Math.sin(dLng/2) * Math.sin(dLng/2);
    double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
    double dist =  (earthRadius * c);
    print(dist.toString());
    diff=(earthRadius * c);
    double dd= tolrenaces;
    print("Distances - $dist");
    print("Total - "+dd.toString());
    if (dist>dd){
      print(meatervalidation=1);
    }else{
      print(meatervalidation=0);
    }

    if(meatervalidation==1){
      Utilities.showDialaogboxWarningMessage(Get.context, "Check Out below the 100 meters - "+dist.toString(), 'Notification');
    }else{
    Allapi.postattendance(true,//isloading,
      5,// formid,
      sessionName,//name,
      sessionEmpId,//empId,
      getcurrendate,//date,
      getcurrendate+" "+getintime,//day,
      insetlat.toString()+","+insetlon.toString(),//frmlatlong,
      insetAddress.toString(),//fromplace,
      insetlat.toString()+","+insetlon.toString(),//tolatlng,
      insetAddress.toString(),//toplace,
      '',//totaldistance,
      '',//month,
      '',//remarks,
      sessionUseId,//createby,
      '',//modifiedBy,
      '0',//approvestatus,
      insetlocation.toString(),//locationtype,
      insetlocation.toString(),//locationnanme,
      '',//description,
      getintime,//fromtime,
      getintime,//totime,
      'Present',//finalstatus
    ).then((value) => {
      log(value.body),
      if(value.statusCode==200){
        Utilities.closeLoader(),
        checkStatus = jsonDecode(value.body)['status'] = 0,
        if(checkStatus==false){
          Utilities.alertsnackBar('Error','Somthing went wrong...',2),
          //Utilities.closeLoader(),
          update(),
        }else{
          // Utilities.alertsnackBar('Success',jsonDecode(value.body)['result'][0]['STATUSNAME'].toString(),3),
          log(jsonDecode(value.body)['result'][0]['STATUSNAME'].toString()),
          Get.back(),
          log("Close...."),
          //Utilities.closeLoader(),
          update(),
        }
      }
    });
    }
  }

  getBranch() {

    Allapi.getLeaveType(13, "0", "C", "T", "leadno", true).then((value) => {
      if(value.statusCode==200){
        print(value.body),
        rawgetBranchModel = getBranchModel.fromJson(jsonDecode(value.body)),
        for(int j=0;j<rawgetBranchModel.result!.length;j++){
          secBranchScreen.add(
              BranchScreen(
                rawgetBranchModel.result![j].code,
                rawgetBranchModel.result![j].branchCode,
              ),
          )
        },
        Utilities.closeLoader(),
        update(),
      }else{
        Utilities.closeLoader(),
        update(),
      }
    });

  }

  showBranch() {
     Get.dialog(
       AlertDialog(
         content: SizedBox(
             width: double.minPositive,
             height: 300,
             child: ListView.builder(
               itemCount: secBranchScreen.length,
               itemBuilder: (BuildContext context, int index) {
               return InkWell(
                 onTap: (){
                   branchName = secBranchScreen[index].branchCode.toString();
                   branchCode=secBranchScreen[index].code.toString();
                   update();
                   Get.back();
                 },
                 child: SizedBox(
                   height: 50,
                     width: 100,
                     child: Text(secBranchScreen[index].branchCode.toString()),
                 ),
               );
             },)
         ),
       ),
     );
   }
}


class BranchScreen {
  var code;
  var branchCode;
  BranchScreen(this.code, this.branchCode);
}
