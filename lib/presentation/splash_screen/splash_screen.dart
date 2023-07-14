import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jibin_s_application1/core/app_export.dart';
import 'package:jibin_s_application1/presentation/bottom_navigation_page/bottom_navigation.dart';
import 'package:jibin_s_application1/presentation/home_dashboard_screen/home_dashboard_screen.dart';
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
    splashOn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
        backgroundColor: ColorConstant.blue600,
        body: Container(
          width: double.maxFinite,
          padding: getPadding(left: 50, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgHl1,
                height: getSize(329),
                width: getSize(329),
                margin: getMargin(bottom: 1),
              ),
            ],
          ),
        ),
      ),
    );
  }
  splashOn(){
    Timer(Duration(seconds: 3), ()async {
     var id = await CommonFuntion.getSavedKey('token');
     var username = await CommonFuntion.getSavedKey('name');
     print('already login :$id');
      if(id == null){
        Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
      }else{
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>  BottomNavigationScreen (id: id)),
        );
      }
    });
  }
}
