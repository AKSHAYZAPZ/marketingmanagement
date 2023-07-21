import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      var username = await CommonFuntion.getSavedKey('name');
      print('already login :$id');
      if (id == null) {
        Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
      } else {

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => BottomNavigationScreen(id: id)),
        );
      }
    });
  }
}
