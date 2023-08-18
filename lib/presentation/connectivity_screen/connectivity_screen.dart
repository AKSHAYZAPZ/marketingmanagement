import 'package:flutter/material.dart';
import 'package:jibin_s_application1/presentation/splash_screen/splash_screen.dart';

import '../../core/utils/image_constant.dart';

class ConnectivityScreen extends StatefulWidget {
  const ConnectivityScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<ConnectivityScreen> createState() => _ConnectivityScreenState();
}

class _ConnectivityScreenState extends State<ConnectivityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('No data Connection'),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImageConstant.network),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreen(),));
                    },
                    child: Text('Retry'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
