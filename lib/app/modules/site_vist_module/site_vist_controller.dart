// ignore_for_file: prefer_typing_uninitialized_variables
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:location/location.dart' as loc;
import '../../data/Model/CardCodeMaster.dart';
import '../../data/repository/_allAPIList.dart';
import '../../utils/Utilites.dart';
import  'package:intl/intl.dart';
import 'package:path/path.dart';
class SiteVistController extends GetxController{
  var sessionUseId  =   '';
  var sessionName = '';
  var sessionDeptCode = '';
  var sessionDeptName = '';
  loc.Location location = loc.Location();
  late loc.PermissionStatus _permissionGranted;
  LatLng? latlong ;
  RxString insetlat="0".obs;
  var insetlon='0'.obs;
  var insetAddress='0'.obs;
  var cardcode='choose Client'.obs;
  var cardname='choose Client'.obs;
  var getintime='';
  var  searchvarible='';
  var checkStatus;
  late CardCodeMaster rawCardCodeMaster;
  RxList secRXCardCode=[].obs;
  bool checkInsert=false;
  var updateDocNo='0';

  @override
  void onInit() {
    // TODO: implement onInit
    getintime = DateFormat("hh:mm:ss a").format(DateTime.now());
    getStringValuesSF();
    super.onInit();
  }

  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    sessionUseId  =   prefs.getString('UserID').toString();
    sessionName = prefs.getString('FirstName').toString();
    sessionDeptCode = prefs.getString('DeptCode').toString();
    sessionDeptName = prefs.getString('DeptName').toString();
    log(sessionName);
    permision();
  }

  permision() async {
    log('permision');
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == loc.PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != loc.PermissionStatus.granted) {
        return;
      }
    }
    update();
    Utilities.showMapLoader();
    getLocation();
  }

  getLocation() async {
    log('getLocation');
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    latlong = LatLng(position.latitude, position.longitude);
    log(position.latitude.toString());
    log(position.longitude.toString());
    insetlat=position.latitude.toString().obs;
    insetlon=position.longitude.toString().obs;
    update();
    _getAddressFromLatLng(position.latitude, position.longitude, position);
  }

  Future<void> _getAddressFromLatLng(lat, lang, Position position) async {

    await placemarkFromCoordinates(position.latitude, position.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      insetAddress =
          '${place.street}, ${place.subLocality}, ${place.locality},${place.administrativeArea}, ${place.postalCode}'.obs;
      log(insetAddress.toLowerCase());
      Utilities.closeLoader();
      update();
      getCheckingVist();
    }).catchError((e) {
      debugPrint(e.toString());
    });
  }

  getCardCodeMaster(){
    Allapi.getcardcode(1,true).then((value) => {

      if(value.statusCode==200){
        checkStatus = jsonDecode(value.body)['status'] = 0,
        if(checkStatus==false){
          Utilities.alertsnackBar('Error','No Data Loding...',2),
          Utilities.closeLoader(),
          update(),
        }else{
          rawCardCodeMaster = CardCodeMaster.fromJson(jsonDecode(value.body)),
          for(int i = 0 ; i < rawCardCodeMaster.result!.length;i++){
            secRXCardCode.add(
            RXCardCode(
                rawCardCodeMaster.result![i].cardCode,
                rawCardCodeMaster.result![i].cardName
            ),
           ),
          },
          Utilities.closeLoader(),
          log("Close...."),
          update(),

        }

      }
    });

  }

  getCheckingVist(){
    Allapi.visitChecking(1, sessionUseId, cardcode.toString(),
        'intTime', 'outTime', insetlat.toString(), insetlon.toString(), insetAddress.toString(), insetlat.toString(),
        insetlon.toString(), insetAddress.toString(), 'O', updateDocNo, true).then((value) => {
          if(value.statusCode==200){

            update(),
            if(jsonDecode(value.body)['status'] ==0){
              checkInsert=false,
              Utilities.closeLoader(),
              update(),
              getCardCodeMaster(),
            }else{
              Utilities.closeLoader(),
              checkInsert=true,
               cardcode=jsonDecode(value.body)['result'][0]['CardCode'].toString().obs,
               cardname=jsonDecode(value.body)['result'][0]['CardName'].toString().obs,
              updateDocNo=jsonDecode(value.body)['result'][0]['DocNo'].toString(),
              log(value.body),
              update(),
            },



          }
    });
  }

  postCheckingIn(formId,status){
    if(cardcode=='Tab on choose'){
      Utilities.showDialaogboxWarningMessage(context, "Choose The Customer", 'Notification');
    }else{
    Allapi.visitChecking(formId, sessionUseId, cardcode.toString(),
        'intTime', 'outTime', insetlat.toString(), insetlon.toString(), insetAddress.toString(), insetlat.toString(), insetlon.toString(), insetAddress.toString(), status, updateDocNo, true).then((value) => {
      if(value.statusCode==200){

        if(jsonDecode(value.body)['status'] ==0){
          Utilities.closeLoader(),
          update(),
         // getCardCodeMaster(),
        }else{

          Utilities.closeLoader(),
          update(),
          log(value.body),
          Utilities.showDialaogboxSavedMessage(context, cardname+"-"+jsonDecode(value.body)['result'][0]['StatusMesg'].toString(), 'Saved..')

        },

      }
    });
  }
  }

}

class RXCardCode {
  String? cardCode;
  String? cardName;

  RXCardCode(this.cardCode, this.cardName);


}
