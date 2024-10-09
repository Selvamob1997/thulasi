import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart';
import 'package:thulasi/app/data/Model/SiteVistModel.dart';
import '../../../data/repository/_allAPIList.dart';
import '../../../utils/Utilites.dart';

class SiteVisitReportsController extends GetxController{

  var sessionUseId  =   '';
  var sessionName = '';
  var sessionDeptCode = '';
  var sessionDeptName = '';
  var sessionEmpId = '';
  SiteVistModel? rawSiteVistModel;
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
    Allapi.getApprovelList(7, sessionUseId, "", "P", "0",true).then((value) => {
      if(value.statusCode==200){

        log(value.body),
        log(jsonDecode(value.body)['status'].toString()),
        if(jsonDecode(value.body)['status'].toString() == "0"){
          Utilities.closeLoader(),
          update(),
          Utilities.showDialaogboxWarningMessage(context, "No data", "Warning")
        }else{
          rawSiteVistModel = SiteVistModel.fromJson(jsonDecode(value.body)),
          for(int i=0;i<rawSiteVistModel!.result!.length;i++){
            secScreenData.add(
              ScreenData(
                  rawSiteVistModel!.result![i].docNo,
                  rawSiteVistModel!.result![i].empName,
                  rawSiteVistModel!.result![i].attendate,
                  rawSiteVistModel!.result![i].inTime,
                  rawSiteVistModel!.result![i].outTime,
                  rawSiteVistModel!.result![i].totalhrs,
                  rawSiteVistModel!.result![i].shifintime,
                  rawSiteVistModel!.result![i].shifoutTime,
                  rawSiteVistModel!.result![i].purchase),
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
  String? attendate;
  String? inTime;
  String? outTime;
  String? totalhrs;
  String? shifintime;
  String? shifoutTime;
  String? purchase;

  ScreenData(
      this.docNo,
      this.empName,
      this.attendate,
      this.inTime,
      this.outTime,
      this.totalhrs,
      this.shifintime,
      this.shifoutTime,
      this.purchase);


}
