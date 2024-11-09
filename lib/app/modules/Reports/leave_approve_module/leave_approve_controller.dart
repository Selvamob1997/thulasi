import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thulasi/app/data/Model/LeaveDataModel.dart';
import 'package:thulasi/app/data/repository/_allAPIList.dart';
import '../../../utils/Utilites.dart';


class LeaveApproveController extends GetxController{

  var sessionUseId  =   '';
  var sessionName = '';
  var sessionDeptCode = '';
  var sessionDeptName = '';
  var sessionEmpId = '';
  var sessionApprovel = '';
  LeaveDataModel? rawLeaveDataModel;
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
    sessionApprovel = prefs.getString('Approvel').toString();
    log(sessionName);
    update();
    getSceendate();
  }

  getSceendate(){
    secScreenData.clear();
    update();
    Allapi.getApprovelList(8, sessionUseId, sessionApprovel, "P","0", true).then((value) => {
      if(value.statusCode==200){

        log(value.body),
        log(jsonDecode(value.body)['status'].toString()),
        if(jsonDecode(value.body)['status'].toString() == "0"){
          Utilities.closeLoader(),
          update(),
          Utilities.showDialaogboxWarningMessage(Get.context, "No data", "Warning")
        }else{
          rawLeaveDataModel = LeaveDataModel.fromJson(jsonDecode(value.body)),
          for(int i=0;i<rawLeaveDataModel!.result!.length;i++){
            secScreenData.add(
              ScreenData(
                  rawLeaveDataModel!.result![i].docNo,
                  rawLeaveDataModel!.result![i].empName,
                  rawLeaveDataModel!.result![i].fromDate,
                  rawLeaveDataModel!.result![i].toDate,
                  rawLeaveDataModel!.result![i].noDays,
                  rawLeaveDataModel!.result![i].status),
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


}



class ScreenData {
  int? docNo;
  String? empName;
  String? fromDate;
  String? toDate;
  String? noDays;
  String? status;

  ScreenData(
      this.docNo,
      this.empName,
      this.fromDate,
      this.toDate,
      this.noDays,
      this.status);


}
