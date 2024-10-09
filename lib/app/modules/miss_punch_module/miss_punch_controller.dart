import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import  'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thulasi/app/data/repository/_allAPIList.dart';
import 'package:thulasi/app/utils/Utilites.dart';


class MissPunchController extends GetxController{


  var getintime='';
  var getcurrendate='';
  var sessionUseId  =   '';
  var sessionName = '';
  var sessionDeptCode = '';
  var sessionDeptName = '';
  var sessionEmpId = '';


  var type = TextEditingController();
  var attendanceDate = TextEditingController();
  var inTime = TextEditingController();
  var outTime = TextEditingController();
  var totalHrs = TextEditingController();
  var shiftName = TextEditingController();
  var shiftRemarks = TextEditingController();


  var shiftInName = TextEditingController(text: '930');
  var shiftOutName = TextEditingController(text: '1730');


  TimeOfDay picked = TimeOfDay.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  int getDocNo=0;

  int fromtime=0;
  int fromminist=0;
  int Toime=0;
  int Tominist=0;
  double TotalPermision=0;

  List<String> punchList =['Punch In','Punch Out'];


  @override
  void onInit() {
    // TODO: implement onInit
    getintime = DateFormat("hh:mm:ss a").format(DateTime.now());
    getcurrendate = DateFormat("dd-MM-yyyy").format(DateTime.now());
    attendanceDate.text = DateFormat("dd-MM-yyyy").format(DateTime.now());
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

  }


  selectToDate(fromid,BuildContext context)async {
    var picked = await  showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2100));
    if (picked != null) {
      if (fromid == 1) {
        attendanceDate.text = DateFormat('yyyy-MM-dd').format(picked);
      } else if (fromid == 2) {

      }
    }
  }

  selectFromTime(BuildContext context) async {

    int hour=0;
    var minits='';
    var session='';

    picked = (await showTimePicker(
        initialTime: selectedTime,
        context: context))!;
    if(picked != null){
      selectedTime = picked;
      fromtime=0;
      fromminist=0;
      fromtime = selectedTime.hour;
      fromminist = selectedTime.minute;
      print(fromtime);
      print(fromtime);

      if(selectedTime.hour>=12){

        //hour = int.parse(selectedTime.hour .toString()) - 12;
        hour = selectedTime.hour==12?12:int.parse(selectedTime.hour .toString()) - 12;
        //minits = selectedTime.minute .toString();
        minits = selectedTime.minute .toString().length==1?"0"+selectedTime.minute .toString():selectedTime.minute .toString();
        session = 'PM';
        print(hour.toString()+":"+minits.toString()+"-"+session.toString());
        inTime.text  = hour.toString()+":"+minits.toString()+"-"+session.toString();
        update();
        totalTimeCal();

      }else if (selectedTime.hour<12){
        // hour = selectedTime.hour;
        // minits = selectedTime.minute .toString();
        hour = selectedTime.hour==0?12:selectedTime.hour;
        minits = selectedTime.minute .toString().length==1?"0"+selectedTime.minute .toString():selectedTime.minute .toString();
        session = 'AM';
        print(hour.toString()+":"+minits.toString()+"-"+session.toString());
        inTime.text  = hour.toString()+":"+minits.toString()+"-"+session.toString();
        update();
        totalTimeCal();

      }else{
        inTime.text ='';
        update();
      }
    }

  }

  selectToTime(BuildContext context) async {

    int hour=0;
    var minits='';
    var session='';

    picked = (await showTimePicker(initialTime: selectedTime, context: context))!;
    if(picked != null){
      selectedTime = picked;
      Toime=0;
      Tominist=0;
      selectedTime = picked;
      Toime=selectedTime.hour;
      Tominist=selectedTime.minute;
      print(Toime);
      print(Tominist);

      if(selectedTime.hour>=12){

        // hour = int.parse(selectedTime.hour .toString()) - 12;
        // minits = selectedTime.minute .toString();
        hour = selectedTime.hour==12?12:int.parse(selectedTime.hour .toString()) - 12;
        //minits = selectedTime.minute .toString();
        minits = selectedTime.minute .toString().length==1?"0"+selectedTime.minute .toString():selectedTime.minute .toString();
        session = 'PM';
        print(hour.toString()+":"+minits.toString()+"-"+session.toString());
        outTime.text  = hour.toString()+":"+minits.toString()+"-"+session.toString();
        update();
        totalTimeCal();

      }else if (selectedTime.hour<12){
        Toime=0;
        Tominist=0;
        selectedTime = picked;
        Toime=selectedTime.hour;
        Tominist=selectedTime.minute;
        print(Toime);
        print(Tominist);
        // hour = selectedTime.hour;
        // minits = selectedTime.minute .toString();
        hour = selectedTime.hour==0?12:selectedTime.hour;
        minits = selectedTime.minute .toString().length==1?"0"+selectedTime.minute .toString():selectedTime.minute .toString();
        session = 'AM';
        print(hour.toString()+":"+minits.toString()+"-"+session.toString());
        outTime.text  = hour.toString()+":"+minits.toString()+"-"+session.toString();
        update();
        totalTimeCal();

      }else{
        outTime.text ='';
        update();
      }
    }

  }

  totalTimeCal(){
    int subTotal=0;
    int subtotalMini=0;
    if(fromtime>Toime){
      log("IF");
      outTime.text =''; //toTime.text='';
      totalHrs.text=''; //totalTime.text='';
      update();
      Utilities.showDialaogboxWarningMessage(Get.context, "To Time", 'Notification');

    }else{
      log("ELSE");
      if(fromtime<Toime){
        subTotal = (Toime - fromtime);
        if (fromminist - Tominist < 0) {
          subtotalMini = ((fromminist - Tominist) * -1);
        } else {
          subtotalMini = (fromminist - Tominist);
        }
        print(subTotal);
        print(subtotalMini);
        //totalTime.text = subTotal.toString()+"."+subtotalMini.toString();
        totalHrs.text = subTotal.toString()+"."+(subtotalMini.toString().length==1?"0"+subtotalMini.toString():subtotalMini.toString());

      }else{
        if(fromminist>Tominist){
          outTime.text =''; //toTime.text='';
          totalHrs.text=''; //totalTime.text='';
          update();
          Utilities.showDialaogboxWarningMessage(Get.context, "Check Minits", 'Notification');
        }else {
          subTotal = (Toime - fromtime);
          if (fromminist - Tominist < 0) {
            subtotalMini = ((fromminist - Tominist) * -1);
          } else {
            subtotalMini = (fromminist - Tominist);
          }
          print(subTotal);
          print(subtotalMini);
          totalHrs.text = subTotal.toString()+"."+(subtotalMini.toString().length==1?"0"+subtotalMini.toString():subtotalMini.toString());
        }
      }

    }

  }

   postSave() {
    Allapi.insertMispunch(1, type.text, attendanceDate.text, inTime.text, outTime.text, totalHrs.text,
        shiftName.text, shiftInName.text, shiftOutName.text, shiftRemarks.text, sessionUseId, "docdate", true).then((value) => {
      if(value.statusCode==200){
        update(),
        Utilities.closeLoader(),
        Utilities.showDialaogboxSavedMessage(Get.context,
            jsonDecode(value.body)['result'][0]['StatusMesg'].toString(), 'Saved..')

      }
    });


   }
}
