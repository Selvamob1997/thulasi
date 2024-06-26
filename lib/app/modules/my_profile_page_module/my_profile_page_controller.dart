import 'dart:developer';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProfilePageController extends GetxController{

  var sessionUseId  =   '';
  var sessionName = '';
  var sessionDeptCode = '';
  var sessionDeptName = '';
  var sessionSex = '';
  var sessionOffTel = '';
  var sessionMobile = '';
  var sessionEmail = '';
  var sessionBankAc = '';
  var sessionHomeSt = '';
  var sessionHomeCity = '';
  var sessionDOB = '';
  var sessionMaStatus = '';
  var sessionEmpType = '';
  var sessionDOJ = '';

 @override
  void onInit() {
    // TODO: implement onInit
   getStringValuesSF();
    super.onInit();
  }
 getStringValuesSF() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   sessionUseId  =   prefs.getString('UserID').toString();
   sessionName = prefs.getString('FirstName').toString();
   sessionDeptCode = prefs.getString('DeptCode').toString();
   sessionDeptName = prefs.getString('DeptName').toString();
   sessionSex = prefs.getString("Sex").toString();
   sessionOffTel = prefs.getString('OffTel').toString();
   sessionMobile = prefs.getString('Mobile').toString();
   sessionEmail = prefs.getString('Email').toString();
   sessionBankAc = prefs.getString('BankAc').toString();
   sessionHomeSt = prefs.getString('HomeSt').toString();
   sessionHomeCity = prefs.getString('HomeCity').toString();
   sessionDOB = prefs.getString('DOB').toString();
   sessionMaStatus = prefs.getString('MaStatus').toString();
   sessionEmpType = prefs.getString('EmpType').toString();
   sessionDOJ = prefs.getString('DOJ').toString();
   log(sessionName);
   update();

 }

}
