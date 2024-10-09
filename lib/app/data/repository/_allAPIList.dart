import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:thulasi/app/utils/Utilites.dart';

abstract class Allapi {
  // ignore: non_constant_identifier_names
  static String LIVE_URL = "http://thulasi.indusnovateur.in:6200/"; // Dickshttp://thulasi.indusnovateur.in:6200/getWhs
  //static String LIVE_URL = "http://192.168.11.200:4200/"; // Offline
  static Future<http.Response> postRequest1(_edtUsername,_edtPassword,deviceID,isloading) async {

    if(isloading)Utilities.showLoader();
    log('${LIVE_URL}login');
    var headers = {"Content-Type": "application/json"};
    var body = {
      "UserName": _edtUsername.text,
      "Password": _edtPassword.text,
      "DeviceID": deviceID,
    };
    log(jsonEncode(body));
    try {
      final response = await http.post(
          Uri.parse('${LIVE_URL}login'),
          body: jsonEncode(body),
          headers: headers);

      Utilities.closeLoader();

      return response;
    } on SocketException {
      throw Exception('Internet is down');
    }
  }

  static Future<http.Response> getdashattendance(formid,isloading,empId) async {

    if(isloading)Utilities.showLoader();
    log(LIVE_URL + 'getdashatten');
    var headers = {"Content-Type": "application/json"};
    var body = {
      "FromId": formid,
      "EmpId": empId
    };
    log(jsonEncode(body));
    try {
      final response = await http.post(
          Uri.parse(LIVE_URL + 'getdashatten'),
          body: jsonEncode(body),
          headers: headers);
      return response;
    } on SocketException {
      throw Exception('Internet is down');
    }
  }

  static Future<http.Response> getdashLeave(formid,isloading,empId) async {

    if(isloading)Utilities.showLoader();
    log(LIVE_URL + 'getdashLeave');
    var headers = {"Content-Type": "application/json"};
    var body = {
      "FromId": formid,
      "Date": empId,
      "EmpId": empId,
      //"DocNo": DocNo,
    };
    log(jsonEncode(body));
    try {
      final response = await http.post(
          Uri.parse(LIVE_URL + 'getdashLeave'),
          body: jsonEncode(body),
          headers: headers);
      return response;
    } on SocketException {
      throw Exception('Internet is down');
    }
  }

  static Future<http.Response> getcardcode(formid,isloading) async {

    log(LIVE_URL + 'login');
    var headers = {"Content-Type": "application/json"};
    var body = {
      "FromId":formid,
      "CardCode":""
    };
    log(jsonEncode(body));
    try {
      final response = await http.post(
          Uri.parse(LIVE_URL + 'getcardcode'),
          body: jsonEncode(body),
          headers: headers);
      return response;
    } on SocketException {
      throw Exception('Internet is down');
    }
  }


  static Future<http.Response> postattendance(
      isloading,formid,name,empId,date,day,frmlatlong, fromplace,tolatlng,toplace,totaldistance,month,remarks,
      createby,modifiedBy,approvestatus,locationtype,locationnanme,description,fromtime,totime,finalstatus
      ) async {

    log(LIVE_URL + 'InSalesInsertAttendance');
    if(isloading)Utilities.showLoader();
    var headers = {"Content-Type": "application/json"};
    var body = {
      "FormID": formid,
      "Name": name,
      "EmpId": empId,
      "Date": date,
      "Day": "",
      "FromLatLng":frmlatlong,
      "FromPlace": fromplace,
      "ToLatLng": tolatlng,
      "ToPlace": toplace,
      "TotalDistance": totaldistance,
      "Month": month,
      "Remarks": remarks,
      "CreatedBy": createby,
      "ModifiedBy": modifiedBy,
      "ApprovalStatus": approvestatus,
      "ApprovedBy": "",
      "LocationType": locationtype,
      "LocationName": locationnanme,
      "Discription": description,
      "FromTime": fromtime ,
      "ToTime": totime,
      "FinalStatus":finalstatus
    };
    //log(jsonEncode(body));
    try {
      final response = await http.post(
          Uri.parse(LIVE_URL + 'InSalesInsertAttendance'),
          body: jsonEncode(body),
          headers: headers);
      return response;
    } on SocketException {
      throw Exception('Internet is down');
    }
  }


  static Future<http.Response> getLeaveType(formid,docNo,status,type,leadno,isloading) async {

    if(isloading)Utilities.showLoader();
    log(LIVE_URL + 'getallmaster');
    var headers = {"Content-Type": "application/json"};
    var body = {

      "FormID": formid,
      "DocNo": docNo,
      "Status": status,
      "Type": type,
      "Leadno": leadno
    };
    log(jsonEncode(body));
    try {
      final response = await http.post(
          Uri.parse(LIVE_URL + 'getallmaster'),
          body: jsonEncode(body),
          headers: headers);
      return response;
    } on SocketException {
      throw Exception('Internet is down');
    }
  }


  static Future<http.Response> insertLeaveMaster(formid,empId,leaveType,leaveCode,fromDate,todate,noOfDays,comments,status,docNo,isloading) async {

    if(isloading)Utilities.showLoader();
    log(LIVE_URL + 'insetLeaveqmaster');
    var headers = {"Content-Type": "application/json"};
    var body = {
      "FromId": formid,
      "EmpId": empId,
      "LeaveType": leaveType,
      "LeaveCode": leaveCode,
      "FromDate": fromDate,
      "Todate": todate,
      "NoOfDays": noOfDays,
      "Comments": comments,
      "Status": status,
      "DocNo": docNo,
    };
    log(jsonEncode(body));
    try {
      final response = await http.post(
          Uri.parse(LIVE_URL + 'insetLeaveqmaster'),
          body: jsonEncode(body),
          headers: headers);
      return response;
    } on SocketException {
      throw Exception('Internet is down');
    }
  }


  static Future<http.Response> visitChecking(formid,empId,cardcode,intTime,outTime,fromLat,fromLog,fromAddress,
      toLat,toLang,toAddress,status,docDate,isloading
      ) async {

    if(isloading)Utilities.showLoader();
    log(LIVE_URL + 'insetVisitqmaster');
    var headers = {"Content-Type": "application/json"};
    var body = {
      "FromId": formid,
      "EmpId": empId,
      "CardCode": cardcode,
      "InTime": intTime,
      "OutTime": outTime,
      "FromLat": fromLat,
      "FromLog": fromLog,
      "FromAddress": fromAddress,
      "ToLat": toLat,
      "ToLang": toLang,
      "ToAddress": toAddress,
      "Status": status,
      "DocDate": docDate
    };
    log(jsonEncode(body));
    try {
      final response = await http.post(
          Uri.parse(LIVE_URL + 'insetVisitqmaster'),
          body: jsonEncode(body),
          headers: headers);
      return response;
    } on SocketException {
      throw Exception('Internet is down');
    }
  }



  static Future<http.Response> insertPermisionMaster(formid,fromdate,fromTime,totime,totalTime,empId,docdate,
      status,purposeofvist,docNo, isloading) async {

    if(isloading)Utilities.showLoader();
    log(LIVE_URL + 'insetPermisionmaster');
    var headers = {"Content-Type": "application/json"};
    var body = {
      "FromId": formid,
      "Fromdate": fromdate,
      "FromTime": fromTime,
      "ToTime": totime,
      "TotalTime": totalTime,
      "EmpId": empId,
      "DocDate": docdate,
      "Status": status,
      "Purposeofvist": purposeofvist,
      "DocNo": docNo,
    };
    log(jsonEncode(body));
    try {
      final response = await http.post(
          Uri.parse(LIVE_URL + 'insetPermisionmaster'),
          body: jsonEncode(body),
          headers: headers);
      return response;
    } on SocketException {
      throw Exception('Internet is down');
    }
  }


  static Future<http.Response> insertOnDutyMaster(formid,onDutyType,fromDate,toDate,fromLocation,toLocation,fromTime,toTime,
      empId,status,docDate,docNo,purpose,lat,long,adreess,isloading) async {

    if(isloading)Utilities.showLoader();
    log(LIVE_URL + 'insetOnDutymaster');
    var headers = {"Content-Type": "application/json"};
    var body = {
      "FromId": formid,
      "OnDutyType": onDutyType,
      "FromDate": fromDate,
      "ToDate": toDate,
      "FromLocation": fromLocation,
      "ToLocation": toLocation,
      "FromTIme": fromTime,
      "ToTime": toTime,
      "EmpId": empId,
      "Status": status,
      "DocDate": docDate,
      "DocNo": docNo,
      "Purpose":purpose,
      "Lat":lat,
      "Long":long,
      "Adreess":adreess
    };
    log(jsonEncode(body));
    try {
      final response = await http.post(
          Uri.parse(LIVE_URL + 'insetOnDutymaster'),
          body: jsonEncode(body),
          headers: headers);
      return response;
    } on SocketException {
      throw Exception('Internet is down');
    }
  }

  static Future<http.Response> getApprovelList(formid,userid,docdate,status,DocNo,isloading) async {

    if(isloading)Utilities.showLoader();
    log(LIVE_URL + 'getPermisionMaster');
    var headers = {"Content-Type": "application/json"};
    var body = {
      "FromId": formid,
      "UserId": userid,
      "DocDate": docdate,
      "Status": status,
      "DocNo":DocNo
    };
    log(jsonEncode(body));
    try {
      final response = await http.post(
          Uri.parse(LIVE_URL + 'getPermisionMaster'),
          body: jsonEncode(body),
          headers: headers);
      return response;
    } on SocketException {
      throw Exception('Internet is down');
    }
  }



  static Future<http.Response> insertMispunch(formid,purchaseType,attendocdate,inTime, outTime, totalHrs, shiftName, shifIntime, shifOutTime, remarks, creatyBy, docdate, isloading) async {

    if(isloading)Utilities.showLoader();
    log(LIVE_URL + 'insertMisspunch');
    var headers = {"Content-Type": "application/json"};
    var body = {
      "FromId": formid,
      "PuchType": purchaseType,
      "AttendanceDate": attendocdate,
      "InTime": inTime,
      "OutTime":outTime,
      "TotalHrs":totalHrs,
      "ShiftName":shiftName,
      "ShiftInTime":shifIntime,
      "ShiftOutTime":shifOutTime,
      "Remarks":remarks,
      "CreateBy":creatyBy,
      "DocDate":docdate,
    };
    log(jsonEncode(body));
    try {
      final response = await http.post(
          Uri.parse(LIVE_URL + 'insertMisspunch'),
          body: jsonEncode(body),
          headers: headers);
      return response;
    } on SocketException {
      throw Exception('Internet is down');
    }
  }












}