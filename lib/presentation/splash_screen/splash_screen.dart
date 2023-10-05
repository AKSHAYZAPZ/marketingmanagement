import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:jibin_s_application1/core/app_export.dart';
import 'package:jibin_s_application1/presentation/bottom_navigation_page/bottom_navigation.dart';
import 'package:jibin_s_application1/presentation/connectivity_screen/connectivity_screen.dart';
import 'package:jibin_s_application1/presentation/select_branch_screen/select_branch_screen.dart';
import 'package:jibin_s_application1/shared_prefrence/shared_preference.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkConnectiVity();
    super.initState();
  }

  bool dataConnection = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.blue600,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(ImageConstant.imgHl1),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  splashOn() {
    Timer(Duration(seconds: 3), () async {
      var id = await CommonFuntion.getSavedKey('token');
      var username = await CommonFuntion. getSavedKey('name');
      print('already login :$id');
      if (id == null) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SelectBranchScreen(),));
      } else {

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => BottomNavigationScreen(id: id)),
        );
      }
    });
  }

  checkConnectiVity()async{
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      dataConnection =true;
      if(dataConnection==true){
        splashOn();
      }
    } else{
      dataConnection =false;
     Navigator.push(context, MaterialPageRoute(builder: (context) => ConnectivityScreen(),));
    }
  }

}
