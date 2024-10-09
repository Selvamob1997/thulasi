import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart';
import 'package:intl/intl.dart';
import 'package:thulasi/app/data/repository/_allAPIList.dart';
import 'package:thulasi/app/utils/Utilites.dart';
import 'package:location/location.dart' as loc;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
class ApplyOnDutyController extends GetxController{


  var sessionUseId  =   '';
  var sessionName = '';
  var sessionDeptCode = '';
  var sessionDeptName = '';
  var sessionEmpId = '';

  TextEditingController fromdate =TextEditingController();
  TextEditingController todate =TextEditingController();
  TextEditingController fromLocation =TextEditingController();
  TextEditingController tolocation =TextEditingController();
  TextEditingController Ondutysessiontype =TextEditingController();
  TextEditingController Purpose =TextEditingController();
  TextEditingController fromTime =TextEditingController();
  TextEditingController toTime =TextEditingController();
  TextEditingController purposecomment =TextEditingController();
  bool datepicker=false;

  List<String> secOnduty=[];



  TimeOfDay picked = TimeOfDay.now();
  TimeOfDay pickedTo = TimeOfDay.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  TimeOfDay selectedToTime = TimeOfDay.now();
  int getDocNo=0;
  var datecount='0';
  var sendfromdate = '';
  var sendtodate = '';

  loc.Location location = loc.Location();
  late loc.PermissionStatus _permissionGranted;
  LatLng? latlong ;
  RxString insetlat="0".obs;
  var insetlon='0'.obs;
  var insetAddress='0'.obs;
  var cardcode='choose Client'.obs;
  var cardname='choose Client'.obs;


  @override
  void onInit() {
    secOnduty.addAll(['Site Visit','Camp','Door Delivery','Marketing','Branch Work']);
    getDocNo = Get.arguments['DocNo'];
    sendfromdate = DateFormat('yyyyMMdd').format(DateTime.now());
    sendtodate = DateFormat('yyyyMMdd').format(DateTime.now());
    fromdate.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
    todate.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
    permision();
    update();
    // TODO: implement onInit
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
    log(sessionName);
    update();
    if(getDocNo==0){
    }else{
      Allapi.getApprovelList(6, sessionUseId, "", "P", getDocNo.toString(), true).then((value) => {
        if(value.statusCode==200){
          if(jsonDecode(value.body)['status'].toString() == "0"){
            update(),
            Utilities.closeLoader(),
          }else{
            log(value.body),
            fromdate.text = jsonDecode(value.body)['result'][0]['FromDatee'],
            Ondutysessiontype.text = jsonDecode(value.body)['result'][0]['OnDutyType'],
            todate.text = jsonDecode(value.body)['result'][0]['ToDatee'],
            fromLocation.text = jsonDecode(value.body)['result'][0]['FromLocation'],
            tolocation.text = jsonDecode(value.body)['result'][0]['ToLocation'].toString(),
            fromTime.text = jsonDecode(value.body)['result'][0]['FromTIme'].toString(),
            toTime.text = jsonDecode(value.body)['result'][0]['ToLocation'].toString(),
            purposecomment.text = jsonDecode(value.body)['result'][0]['Purpose'].toString(),

            update(),
            Utilities.closeLoader(),
          }

        }else{
          update(),
          Utilities.closeLoader(),
        }
      });

    }
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
    log(position.latitude.toString());
    log(position.longitude.toString());
    insetlat=position.latitude.toString().obs;
    insetlon=position.longitude.toString().obs;
    update();
    _getAddressFromLatLng(position.latitude, position.longitude, position);
  }

  Future<void> _getAddressFromLatLng(lat, lang, Position position) async {

    await placemarkFromCoordinates(position.latitude, position.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      insetAddress =
          '${place.street}, ${place.subLocality}, ${place.locality},${place.administrativeArea}, ${place.postalCode}'.obs;
      log(insetAddress.toLowerCase());
      Utilities.closeLoader();
      update();
      getStringValuesSF();
      //getCheckingVist();
    }).catchError((e) {
      debugPrint(e.toString());
    });
  }

  selectToDate1(fromid,BuildContext context)async {
    var picked = await  showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2100));
    if (picked != null) {
      if (fromid == 1) {
        fromdate.text = DateFormat('yyyy-MM-dd').format(picked);
      } else if (fromid == 2) {
        todate.text = DateFormat('yyyy-MM-dd').format(picked);
      }
    }
  }

  selectToDate(fromid,BuildContext context)async {
    var picked = await  showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2100));
    if (picked != null) {
      if (fromid == 1) {
        fromdate.text = DateFormat('yyyy-MM-dd').format(picked);
        sendfromdate = DateFormat('yyyyMMdd').format(picked);
        todate.text = '';
        sendtodate = '';

        //datecount = "${DateTime.parse(sendtodate.toString()).difference(DateTime.parse(sendfromdate.toString())).inDays}";
        //nodays.text = datecount.toString();
      } else if (fromid == 2) {

        sendtodate = DateFormat('yyyyMMdd').format(picked);
        datecount = "${DateTime.parse(sendtodate.toString()).difference(DateTime.parse(sendfromdate.toString())).inDays}";
        log(datecount);
        if(int.parse(datecount.toString())>=0){
          todate.text = DateFormat('yyyy-MM-dd').format(picked);
          //nodays.text = datecount.toString()=="0"?'1':(int.parse(datecount.toString())+1).toString();
        }else{
          Utilities.showDialaogboxWarningMessage(context, "Choose based on from date", "Warring");
          todate.text = '';
          sendtodate = '';
          //nodays.text='';
        }

      }
    }
  }


  selectFromTime(BuildContext context) async {

    int hour=0;
    var minits='';
    var session='';

    picked = (await showTimePicker(initialTime: selectedTime, context: context))!;
    if(picked != null){
      selectedTime = picked;

      //print(selectedTime.minute);
      //print(selectedTime.hour);
       print(selectedTime.hour);
      if(selectedTime.hour>=12){

          //hour = int.parse(selectedTime.hour .toString()) - 12;
          hour = selectedTime.hour==12?12:int.parse(selectedTime.hour .toString()) - 12;
          minits = selectedTime.minute .toString().length==1?"0"+selectedTime.minute .toString():selectedTime.minute .toString();
          session = 'PM';
          print(hour.toString()+":"+minits.toString()+"-"+session.toString());
          fromTime.text  = hour.toString()+":"+minits.toString()+"-"+session.toString();
        update();

      }else if (selectedTime.hour<12){
          hour = selectedTime.hour==0?12:selectedTime.hour;
          minits = selectedTime.minute .toString().length==1?"0"+selectedTime.minute .toString():selectedTime.minute .toString();
          session = 'AM';
          print(hour.toString()+":"+minits.toString()+"-"+session.toString());
          fromTime.text  = hour.toString()+":"+minits.toString()+"-"+session.toString();
          update();

      }else{
        fromTime.text ='';
          update();
      }
    }

  }

  selectToTime(BuildContext context) async {

    int hour=0;
    var minits='';
    var session='';

    selectedToTime = (await showTimePicker(initialTime: selectedToTime, context: context))!;
    if(selectedToTime != null){
        print(selectedToTime.hour);
      update();
      if(selectedToTime.hour>=12){

        hour = selectedToTime.hour==12?12:int.parse(selectedToTime.hour .toString()) - 12;
        minits = selectedToTime.minute .toString().length==1?"0"+selectedToTime.minute .toString():selectedToTime.minute .toString();
        session = 'PM';
        //print(hour.toString()+":"+minits.toString()+"-"+session.toString());
        toTime.text  = hour.toString()+":"+minits.toString()+"-"+session.toString();
        update();

      }else if (selectedToTime.hour<12){
        hour = selectedToTime.hour==0?12:selectedToTime.hour;
        minits = selectedToTime.minute .toString().length==1?"0"+selectedToTime.minute .toString():selectedToTime.minute .toString();
        session = 'AM';
        //print(hour.toString()+":"+minits.toString()+"-"+session.toString());
        toTime.text  = hour.toString()+":"+minits.toString()+"-"+session.toString();
        update();

      }else{
        toTime.text ='';
        update();
      }
    }

  }

  datechecking(message){
    if(message=="Half Day"){
      fromdate.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
      todate.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
      datepicker=true;
      update();
    }else{
      datepicker=false;
      fromdate.text = '';
      todate.text = '';
      update();
    }

  }

  postSave(formid){

    if(sessionUseId.isEmpty){
      Utilities.showDialaogboxWarningMessage(context, "EmpId is not load...", 'Notification');
    }else if(fromdate.text.isEmpty){
      Utilities.showDialaogboxWarningMessage(context, "From Date is not load...", 'Notification');
    } else if(fromTime.text.isEmpty){
      Utilities.showDialaogboxWarningMessage(context, "From Time is not load...", 'Notification');
    }
    else if(toTime.text.isEmpty){
      Utilities.showDialaogboxWarningMessage(context, "To Time is not load...", 'Notification');
    }
    else if(fromLocation.text.isEmpty){
      Utilities.showDialaogboxWarningMessage(context, "From Location should not be empty...", 'Notification');
    }
    else if(fromLocation.text.isEmpty){
      Utilities.showDialaogboxWarningMessage(context, "To Location should not be empty...", 'Notification');
    }
    else if(purposecomment.text.isEmpty){
      Utilities.showDialaogboxWarningMessage(context, "Purpose should not be empty...", 'Notification');
    }
    else{
    Allapi.insertOnDutyMaster(formid, Ondutysessiontype.text, fromdate.text, todate.text,
        fromLocation.text, tolocation.text, fromTime.text, toTime.text, sessionUseId, 'P', '',
        getDocNo.toString(), purposecomment.text,insetlat.obs.toString(),insetlon.obs.toString(),insetAddress.obs.toString(),true).then((value) => {
      if(value.statusCode==200){
        update(),
        Utilities.closeLoader(),
        Utilities.showDialaogboxSavedMessage(context, jsonDecode(value.body)['result'][0]['StatusMesg'].toString(), 'Saved..')
      }
    });
    }
  }

}

//Utilities.showDialaogboxSavedMessage(context, jsonDecode(value.body)['result'][0]['StatusMesg'].toString(), 'Saved..')



