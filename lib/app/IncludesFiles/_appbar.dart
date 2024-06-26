// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thulasi/app/routes/route_management.dart';

class MyAppBar extends StatefulWidget {
   MyAppBar( {Key? key,required this.screenName}) : super(key: key);
   var screenName='';

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(2),
        child: Container(
          height: height/15,
          width: width,
          margin: EdgeInsets.only(top: height/50),
          decoration: BoxDecoration(
            color: Colors.black12,
              borderRadius: BorderRadius.all(Radius.circular(height/45)),
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: height/35),
                child: Text(widget.screenName,style: TextStyle(color: Colors.blue.shade900,fontSize: height/35,fontWeight: FontWeight.w700),),
              ),
              IconButton(
                onPressed: () async {
                  //Navigator.pop(context);
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.setString('UserID', "");
                  prefs.setString('FirstName', "");
                  prefs.setString('DeptCode', "");
                  prefs.setString('DeptName', "");
                  prefs.setString("Status", "LoginOut");
                  RouteManageMent.goToLogin();
                },
                icon: const Icon(Icons.exit_to_app,color: Colors.redAccent,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

