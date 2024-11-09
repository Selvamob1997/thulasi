import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thulasi/app/data/Model/OnDutyDataModel.dart';

import '../../../data/repository/_allAPIList.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/Utilites.dart';


class OndutyMasterApproveController extends GetxController{

  var sessionUseId  =   '';
  var sessionName = '';
  var sessionDeptCode = '';
  var sessionDeptName = '';
  var sessionEmpId = '';
  OnDutyDataModel? rawOnDutyDataModel;
  List<ScreenData> secScreenData=[];

  @override
  void onInit() {
    // TODO: implement onInit
    getStringValuesSF();
    update();
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
    getSceendate();
  }

  getSceendate(){
    secScreenData.clear();
    update();
    Allapi.getApprovelList(10, sessionUseId, "", "P","0", true).then((value) => {
      if(value.statusCode==200){

        log(value.body),
        log(jsonDecode(value.body)['status'].toString()),
        if(jsonDecode(value.body)['status'].toString() == "0"){
          Utilities.closeLoader(),
          update(),
          Utilities.showDialaogboxWarningMessage(Get.context, "No data", "Warning")
        }else{
          rawOnDutyDataModel = OnDutyDataModel.fromJson(jsonDecode(value.body)),
          for(int i=0;i<rawOnDutyDataModel!.result!.length;i++){
            secScreenData.add(
              ScreenData(
                  rawOnDutyDataModel!.result![i].docNo,
                  rawOnDutyDataModel!.result![i].empName,
                  rawOnDutyDataModel!.result![i].onDutyType,
                  rawOnDutyDataModel!.result![i].fromDate,
                  rawOnDutyDataModel!.result![i].toDate,
                  rawOnDutyDataModel!.result![i].fromLoc,
                  rawOnDutyDataModel!.result![i].toLoc,
                  rawOnDutyDataModel!.result![i].fromTime,
                  rawOnDutyDataModel!.result![i].toTime,
                  rawOnDutyDataModel!.result![i].status),
            ),
          },
          Utilities.closeLoader(),
          update(),
          // for(var rawdata in rawLeaveDataModel!.result! ){
          //   secScreenData.add(ScreenData(rawdata.docNo, empName, fromDate, toDate, noDays, status))
          // }
        },


      }else{
        Utilities.closeLoader(),
        update(),
      }

    });
  }


  postDataPassing(docNo){
    Get.toNamed(Routes.APPLY_ON_DUTY,arguments:<String,dynamic>{
      'ScreenName':'Leave Form',
      'DocNo':docNo
    });

  }
}


class ScreenData {
  int? docNo;
  String? empName;
  String? onDutyType;
  String? fromDate;
  String? toDate;
  String? fromLoc;
  String? toLoc;
  String? fromTime;
  String? toTime;
  String? status;

  ScreenData(
      this.docNo,
      this.empName,
      this.onDutyType,
      this.fromDate,
      this.toDate,
      this.fromLoc,
      this.toLoc,
      this.fromTime,
      this.toTime,
      this.status);


}
