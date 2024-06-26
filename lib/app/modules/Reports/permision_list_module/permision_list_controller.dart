import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart';
import 'package:thulasi/app/data/Model/PermisionDataModel.dart';
import 'package:thulasi/app/utils/Utilites.dart';

import '../../../data/repository/_allAPIList.dart';
import '../../../routes/app_pages.dart';

class PermisionListController extends GetxController{

  var sessionUseId  =   '';
  var sessionName = '';
  var sessionDeptCode = '';
  var sessionDeptName = '';
  var sessionEmpId = '';
  PermisionDataModel? rawPermisionDataModel;
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
    Allapi.getApprovelList(3, sessionUseId, "", "P", "0",true).then((value) => {
      if(value.statusCode==200){

        log(value.body),
        log(jsonDecode(value.body)['status'].toString()),
        if(jsonDecode(value.body)['status'].toString() == "0"){
          Utilities.closeLoader(),
          update(),
          Utilities.showDialaogboxWarningMessage(context, "No data", "Warning")
        }else{
          rawPermisionDataModel = PermisionDataModel.fromJson(jsonDecode(value.body)),
          for(int i=0;i<rawPermisionDataModel!.result!.length;i++){
            secScreenData.add(
              ScreenData(
                  rawPermisionDataModel!.result![i].empName,
                  rawPermisionDataModel!.result![i].docNo,
                  rawPermisionDataModel!.result![i].fromDate,
                  rawPermisionDataModel!.result![i].fromTime,
                  rawPermisionDataModel!.result![i].toTime,
                  rawPermisionDataModel!.result![i].totalTime,
                  rawPermisionDataModel!.result![i].status,
                  rawPermisionDataModel!.result![i].purposeofvist),
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
    Get.toNamed(Routes.APPLY_PERMISION,arguments:<String,dynamic>{
      'ScreenName':'Leave Form',
      'DocNo':docNo
    });

  }

}

class ScreenData {
  String? empName;
  int? docNo;
  String? fromDate;
  String? fromTime;
  String? toTime;
  String? totalTime;
  String? status;
  String? purposeofvist;

  ScreenData(
      this.empName,
      this.docNo,
      this.fromDate,
      this.fromTime,
      this.toTime,
      this.totalTime,
      this.status,
      this.purposeofvist);


}
