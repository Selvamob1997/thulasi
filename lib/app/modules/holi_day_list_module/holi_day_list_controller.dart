import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thulasi/app/data/Model/HolidayListModel.dart';
import 'package:thulasi/app/data/repository/_allAPIList.dart';
import 'package:thulasi/app/utils/Utilites.dart';


class HoliDayListController extends GetxController{

  var sessionUseId  =   '';
  var sessionName = '';
  var sessionDeptCode = '';
  var sessionDeptName = '';
  late HolidayListModel rawHolidayListModel;

  List<ScreenHoliday>  secScreenHoliday=[];

  @override
  void onInit() {
    // TODO: implement onInit
    getStringValuesSF();
    update();
    super.onInit();
  }
  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    sessionUseId  =   prefs.getString('UserID').toString();
    sessionName = prefs.getString('FirstName').toString();
    sessionDeptCode = prefs.getString('DeptCode').toString();
    sessionDeptName = prefs.getString('DeptName').toString();
    getHolidayList();
    update();


  }

  getHolidayList() {

    Allapi.getLeaveType(10, "docNo", "status", "type", "leadno", true).then((value) => {

      if(value.statusCode==200){
        //log(value.body),
        rawHolidayListModel = HolidayListModel.fromJson(jsonDecode(value.body)),
        for(int j=0;j<rawHolidayListModel.result!.length;j++){
          secScreenHoliday.add(
            ScreenHoliday(
              rawHolidayListModel.result![j].uLocation,
              rawHolidayListModel.result![j].uHldCode,
              rawHolidayListModel.result![j].sTADATE,
              rawHolidayListModel.result![j].eNDDATE,
              rawHolidayListModel.result![j].uRmrks,
            ),
          ),

        },
        Utilities.closeLoader(),
        update(),
      }
    });
  }
}

class ScreenHoliday {
  String? uLocation;
  String? uHldCode;
  String? sTADATE;
  String? eNDDATE;
  String? uRmrks;

  ScreenHoliday(
      this.uLocation, this.uHldCode, this.sTADATE, this.eNDDATE, this.uRmrks);
}