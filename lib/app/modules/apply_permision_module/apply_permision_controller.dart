import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart';
import 'package:intl/intl.dart';
import 'package:thulasi/app/data/repository/_allAPIList.dart';
import 'package:thulasi/app/utils/Utilites.dart';

class ApplyPermisionController extends GetxController{

  var sessionUseId  =   '';
  var sessionName = '';
  var sessionDeptCode = '';
  var sessionDeptName = '';
  var sessionEmpId = '';

  TextEditingController fromdate =TextEditingController();
  TextEditingController toTime =TextEditingController();
  TextEditingController fromTime =TextEditingController();
  TextEditingController totalTime =TextEditingController();
  TextEditingController comments =TextEditingController();
  TimeOfDay picked = TimeOfDay.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  int getDocNo=0;

  int fromtime=0;
  int fromminist=0;
  int Toime=0;
  int Tominist=0;
  double TotalPermision=0;

  @override
  void onInit() {
    fromdate.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
    getDocNo = Get.arguments['DocNo'];
    getStringValuesSF();
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
    getTotalPermision();

  }

  getTotalPermision(){
    Allapi.insertPermisionMaster(1, "fromdate", "fromTime", "totime", "totalTime",
        sessionUseId, "docdate", "status", "purposeofvist", "docNo", true).then((value) => {
          if(value.statusCode==200){
            update(),
            Utilities.closeLoader(),
            TotalPermision = double.parse(jsonDecode(value.body)['result'][0]['TakenTime'].toString()),
            if(getDocNo==0){

            }else{
              Allapi.getApprovelList(5, sessionUseId, "", "P", getDocNo.toString(), true).then((value) => {
                if(value.statusCode==200){
                  if(jsonDecode(value.body)['status'].toString() == "0"){
                    update(),
                    Utilities.closeLoader(),
                  }else{
                    log(value.body),
                    fromdate.text = jsonDecode(value.body)['result'][0]['FromDatee'],
                    fromTime.text = jsonDecode(value.body)['result'][0]['FromTime'],
                    toTime.text = jsonDecode(value.body)['result'][0]['ToTime'],
                    totalTime.text = jsonDecode(value.body)['result'][0]['TotalTime'],
                    comments.text = jsonDecode(value.body)['result'][0]['Purposeofvist'].toString(),
                    update(),
                    Utilities.closeLoader(),
                  }
                }else{
                  update(),
                  Utilities.closeLoader(),
                }
              }),
            }
          }else{
            update(),
            Utilities.closeLoader(),
          }
    });

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
        fromTime.text  = hour.toString()+":"+minits.toString()+"-"+session.toString();
        update();
        totalTimeCal();

      }else if (selectedTime.hour<12){
        // hour = selectedTime.hour;
        // minits = selectedTime.minute .toString();
        hour = selectedTime.hour==0?12:selectedTime.hour;
        minits = selectedTime.minute .toString().length==1?"0"+selectedTime.minute .toString():selectedTime.minute .toString();
        session = 'AM';
        print(hour.toString()+":"+minits.toString()+"-"+session.toString());
        fromTime.text  = hour.toString()+":"+minits.toString()+"-"+session.toString();
        update();
        totalTimeCal();

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
        toTime.text  = hour.toString()+":"+minits.toString()+"-"+session.toString();
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
        toTime.text  = hour.toString()+":"+minits.toString()+"-"+session.toString();
        update();
        totalTimeCal();

      }else{
        totalTime.text ='';
        update();
      }
    }

  }

  totalTimeCal(){
    int subTotal=0;
    int subtotalMini=0;
    if(fromtime>Toime){
      log("IF");
      toTime.text='';
      totalTime.text='';
      update();
      Utilities.showDialaogboxWarningMessage(context, "To Time", 'Notification');

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
        totalTime.text = subTotal.toString()+"."+(subtotalMini.toString().length==1?"0"+subtotalMini.toString():subtotalMini.toString());

      }else{
      if(fromminist>Tominist){
        toTime.text='';
        totalTime.text='';
        update();
        Utilities.showDialaogboxWarningMessage(context, "Check Minits", 'Notification');
      }else {
        subTotal = (Toime - fromtime);
        if (fromminist - Tominist < 0) {
          subtotalMini = ((fromminist - Tominist) * -1);
        } else {
          subtotalMini = (fromminist - Tominist);
        }
        print(subTotal);
        print(subtotalMini);
        totalTime.text = subTotal.toString()+"."+(subtotalMini.toString().length==1?"0"+subtotalMini.toString():subtotalMini.toString());
      }
      }

    }

  }


  postSave(formid){
    print((TotalPermision+(double.parse(totalTime.text.toString()))));

    if(sessionUseId.isEmpty){
      Utilities.showDialaogboxWarningMessage(context, "EmpId is not load...", 'Notification');
    }else if(fromdate.text.isEmpty){
      Utilities.showDialaogboxWarningMessage(context, "From Date is not load...", 'Notification');
    } else if(fromTime.text.isEmpty){
      Utilities.showDialaogboxWarningMessage(context, "From Time is not load...", 'Notification');
    }
    else if(toTime.text.isEmpty){
      Utilities.showDialaogboxWarningMessage(context, "To Time is not load...", 'Notification');
    }else if( (TotalPermision+(double.parse(totalTime.text.toString())))>2 ){
      Utilities.showDialaogboxWarningMessage(context, "Permision Time Cross the 2 hrs ", 'Notification');
    }
    else{

      Allapi.insertPermisionMaster(formid, fromdate.text, fromTime.text, toTime.text, totalTime.text, sessionUseId, '', 'P',comments.text, getDocNo.toString(),true).then((value) => {
        if(value.statusCode==200){
          update(),
          Utilities.closeLoader(),
          Utilities.showDialaogboxSavedMessage(context, jsonDecode(value.body)['result'][0]['StatusMesg'].toString(), 'Saved..')
        }

      });
    }
  }
}
