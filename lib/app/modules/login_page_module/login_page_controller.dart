// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thulasi/app/routes/route_management.dart';
import 'package:thulasi/app/utils/Utilites.dart';
import 'package:unique_identifier/unique_identifier.dart';
import '../../data/repository/_allAPIList.dart';


class LoginPageController extends GetxController{


  final username = TextEditingController();
  final password = TextEditingController();
  var  login;
  var deviceID='';
  String? identifier = 'Unknown';

  @override
  void onInit() {
    // TODO: implement onInit
    initUniqueIdentifierState();
    update();
    super.onInit();
  }


  Future<void> initUniqueIdentifierState() async {
    //String? identifier;
    try {
      identifier = await UniqueIdentifier.serial;
      update();
    } on PlatformException {
      identifier = 'Failed to get Unique Identifier';
    }
    print(identifier);
    //identifier = identifier!;
  }



 logincheck(){
   if(username.text.isEmpty){
     Utilities.alertsnackBar("Error", "Enter The UserName", 2);
   }else if(password.text.isEmpty){
     Utilities.alertsnackBar("Error", "Enter The Password", 2);
   }
   else{
     Allapi.postRequest1(username, password,identifier,true).then((value) => {
       log(value.body),
       if(value.statusCode==200){
         login = jsonDecode(value.body)['status'] = 0,
         if(login==false){
           log('false'),
         }else{
           log('true'),
           setSession(
                jsonDecode(value.body)['result'][0]['empId'].toString(),
                jsonDecode(value.body)['result'][0]['firstName'].toString(),
                jsonDecode(value.body)['result'][0]['dept'].toString(),
                jsonDecode(value.body)['result'][0]['Name'].toString(),
                jsonDecode(value.body)['result'][0]['Sex'].toString(),
                jsonDecode(value.body)['result'][0]['OffTel'].toString(),
                jsonDecode(value.body)['result'][0]['Mobile'].toString(),
                jsonDecode(value.body)['result'][0]['Email'].toString(),
                jsonDecode(value.body)['result'][0]['BankAc'].toString(),
                jsonDecode(value.body)['result'][0]['HomeSt'].toString(),
                jsonDecode(value.body)['result'][0]['HomeCity'].toString(),
                jsonDecode(value.body)['result'][0]['DOB'].toString(),
                jsonDecode(value.body)['result'][0]['MaStatus'].toString(),
                jsonDecode(value.body)['result'][0]['EmpType'].toString(),
                jsonDecode(value.body)['result'][0]['ExtEmpNo'].toString(),
                jsonDecode(value.body)['result'][0]['DOJ'].toString(),
                jsonDecode(value.body)['result'][0]['FromLat'].toString(),
                jsonDecode(value.body)['result'][0]['FromLong'].toString(),
                jsonDecode(value.body)['result'][0]['Approvel'].toString(),
                jsonDecode(value.body)['result'][0]['BloodGrop'].toString(),
           )

         }
       }
     });
   }
 }

  setSession(
      userID,firstName,
      deptCode,deptName,sex,
      offtell,mobile,
      email,bankac,homest,homecity,bob,marstatus,
      emptype,exempno, DOJ,fromLat,fromLong,approvel,bloodGrop) async {

    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    prefs.setString("UserID", userID.toString());
    prefs.setString("FirstName", firstName.toString());
    prefs.setString("DeptCode", deptCode.toString());
    prefs.setString("DeptName", deptName.toString());
    prefs.setString("Sex",sex.toString());
    prefs.setString("OffTel",offtell.toString());
    prefs.setString("Mobile",mobile.toString());
    prefs.setString("Email",email.toString());
    prefs.setString("BankAc",bankac.toString());
    prefs.setString("HomeSt",homest.toString());
    prefs.setString("HomeCity",homecity.toString());
    prefs.setString("DOB",bob.toString());
    prefs.setString("MaStatus",marstatus.toString());
    prefs.setString("EmpType",emptype.toString());
    prefs.setString("ExtEmpNo",exempno.toString());
    prefs.setString("DOJ",DOJ.toString());
    prefs.setString("FromLat",fromLat.toString());
    prefs.setString("FromLong",fromLong.toString());
    prefs.setString("Approvel",approvel.toString());
    prefs.setString("bloodGrop",bloodGrop.toString());

    prefs.setString("Status", "Login");
    RouteManageMent.goToDashboard();
  }


}
