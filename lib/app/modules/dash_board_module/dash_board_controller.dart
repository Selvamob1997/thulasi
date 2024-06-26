// ignore_for_file: prefer_typing_uninitialized_variables
import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:thulasi/app/data/Model/GetDashboardAttendance.dart';
import 'package:thulasi/app/data/repository/_allAPIList.dart';
import 'package:thulasi/app/routes/route_management.dart';
import 'package:thulasi/app/utils/Utilites.dart';
class DashBoardController extends GetxController{

  var sessionUseId  =   '';
  var sessionName = '';
  var sessionDeptCode = '';
  var sessionDeptName = '';
  var sessionEmpId = '';
  var login;
  late GetDashboardAttendance rawGetDashboardAttendance;
  RxList secScreenDashBoard=[].obs;
  double CasulaLeave=0;
  double SLLeave=0;
  double ELLeave=0;
  double Comff=0;

  @override
  void onInit() {
    // TODO: implement onInit
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
    log(sessionName);
    update();
    getDashBoardData();
  }

  getDashBoardData(){
      Allapi.getdashattendance(1,true,sessionEmpId).then((value) => {
        log(value.body),
        if(value.statusCode==200){
          secScreenDashBoard.clear(),
          login = jsonDecode(value.body)['status'] = 0,
          if(login==false){
            log('false'),
          }else{
            log('true'),
            rawGetDashboardAttendance = GetDashboardAttendance.fromJson(jsonDecode(value.body)),
            for(int i = 0 ; i <rawGetDashboardAttendance.result!.length;i++){
              secScreenDashBoard.add(
                  ScreenDashBoard(
                      rawGetDashboardAttendance.result![i].day,
                      rawGetDashboardAttendance.result![i].date,
                      rawGetDashboardAttendance.result![i].myDay,
                      rawGetDashboardAttendance.result![i].empId,
                      rawGetDashboardAttendance.result![i].empName,
                      rawGetDashboardAttendance.result![i].attStatus,
                  ),
              ),
            },
            update(),
            Utilities.closeLoader(),
            getLeave(),
            //getDashBoardLeaveData(),
          }
        }
      });
      update();
    }

  getLeave(){
    Allapi.insertLeaveMaster(1, sessionUseId, "leaveType.text", "leaveCode", "fromdate.text",
        DateFormat('yyyy-MM-dd').format(DateTime.now()), "nodays.text", "comments.text",'P', "getDocNo.toString()",true).then((value) => {
      if(value.statusCode==200){
        log(value.body),
        CasulaLeave = double.parse(jsonDecode(value.body)['result'][0]['TakenLeave'].toString()),
        ELLeave = double.parse(jsonDecode(value.body)['result'][1]['TakenLeave'].toString()) ,
        SLLeave = double.parse(jsonDecode(value.body)['result'][2]['TakenLeave'].toString()),
        Comff = double.parse(jsonDecode(value.body)['result'][3]['TakenLeave'].toString()),
        update(),
        Utilities.closeLoader(),

      }
    });
  }

  getDashBoardLeaveData(){
    Allapi.getdashattendance(1,true,sessionEmpId).then((value) => {
      log(value.body),
      if(value.statusCode==200){
        secScreenDashBoard.clear(),
        login = jsonDecode(value.body)['status'] = 0,
        if(login==false){
          log('false'),
        }else{
          log('true'),
          rawGetDashboardAttendance = GetDashboardAttendance.fromJson(jsonDecode(value.body)),
          for(int i = 0 ; i <rawGetDashboardAttendance.result!.length;i++){
            secScreenDashBoard.add(
              ScreenDashBoard(
                rawGetDashboardAttendance.result![i].day,
                rawGetDashboardAttendance.result![i].date,
                rawGetDashboardAttendance.result![i].myDay,
                rawGetDashboardAttendance.result![i].empId,
                rawGetDashboardAttendance.result![i].empName,
                rawGetDashboardAttendance.result![i].attStatus,
              ),
            ),
          },
          update(),
          Utilities.closeLoader(),
        }
      }
    });
    update();
  }

  getSideMenu(context){
    Utilities.alertsidemenu(context);
    }

  postlogout(){
    Utilities.logot();
    }

  getdashboardNavigation(formid){
    if(formid==1){
      RouteManageMent.goToApplyLeave();
    }
    else if(formid==2){
      RouteManageMent.goToSiteVisit();
    }
    else if(formid==3){
      RouteManageMent.goToProfile();
    }
    else if(formid==4){
      RouteManageMent.goToOnDuty();
    }
    else if(formid==5){
      RouteManageMent.goToPermision();
    }
    else if(formid==6){
      RouteManageMent.goToMaspActivity();
    }
    else if(formid==7){
      RouteManageMent.goToLeaveList();
    }else if(formid==8){
      RouteManageMent.goToPermisionList();
    }else if(formid==9){
      RouteManageMent.goToOndutyList();
    }else if(formid==10){
      RouteManageMent.goToSiteVistList();
    }else if(formid==11){
      RouteManageMent.goToHoliyDayList();
    }



  }
}

class ScreenDashBoard {
  String? day;
  String? date;
  String? myDay;
  String? empId;
  String? empName;
  String? attStatus;

  ScreenDashBoard(this.day, this.date, this.myDay,this.empId,this.empName,this.attStatus);


}
