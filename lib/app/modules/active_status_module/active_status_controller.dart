import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thulasi/app/data/repository/_allAPIList.dart';
import 'package:thulasi/app/utils/Utilites.dart';

import '../../data/Model/ActiveModel.dart';


class ActiveStatusController extends GetxController{


  var sessionUseId  =   '';
  var sessionName = '';
  var sessionDeptCode = '';
  var sessionDeptName = '';
  var sessionEmpId = '';


  late ActiveModel rawActiveModel;
  List<ScreenData> secScreenData=[];


  @override
  void onInit() {
    // TODO: implement onInit
    getStringValuesSF();
    update();
    super.onInit();
  }


  getStringValuesSF() async {
    //log("message");
    SharedPreferences prefs =await SharedPreferences.getInstance();
    sessionUseId  =   prefs.getString('UserID').toString();
    sessionName = prefs.getString('FirstName').toString();
    sessionDeptCode = prefs.getString('DeptCode').toString();
    sessionDeptName = prefs.getString('DeptName').toString();
    sessionEmpId = prefs.getString('ExtEmpNo').toString();
    getData();
    update();
  }


  getData(){
    Allapi.getLeaveType(14, sessionEmpId, "O", sessionEmpId, sessionEmpId, true).then((value) => {
      if(value.statusCode == 200){
        print(value.body),
        Utilities.closeLoader(),
        update(),
        rawActiveModel = ActiveModel.fromJson(jsonDecode(value.body)),
        for(int k=0;k<rawActiveModel.result!.length;k++){
          secScreenData.add(ScreenData(
            rawActiveModel.result![k].empID,
            rawActiveModel.result![k].name,
            rawActiveModel.result![k].sattus,
          ),
          ),
        },
        Utilities.closeLoader(),
        update(),

      }else{

      }


    });
  }


}


class ScreenData {
  var empID;
  var name;
  String? sattus;

  ScreenData(this.empID, this.name, this.sattus);


}
