import 'package:flutter/material.dart';
import 'package:jibin_s_application1/core/app_export.dart';
import 'package:jibin_s_application1/presentation/login_screen/login_screen.dart';
import 'package:jibin_s_application1/presentation/newlaunch_screen.dart';
import 'package:jibin_s_application1/shared_prefrence/shared_preference.dart';

class SelectBranchScreen extends StatelessWidget {
  const SelectBranchScreen({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: ColorConstant.blue600,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width*0.9,
            height: MediaQuery.of(context).size.height*0.4,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Select your branch here',
                style: TextStyle(
                  color: Colors.white
                ),),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white
                    ),
                  ),
                  child: ListTile(
                    onTap: () {

                      CommonFuntion.addDataToSharedPreferences('url', '');
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                    },
                    title: Text('Kozhikode',style: TextStyle(color: Colors.white),),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // Container(
                //   decoration: BoxDecoration(
                //     border: Border.all(
                //         color: Colors.white
                //     ),
                //   ),
                //   child: ListTile(
                //     onTap: () {
                //       CommonFuntion.addDataToSharedPreferences('url', '');
                //       Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                //     },
                //     title: Text('Thrissur',style: TextStyle(color: Colors.white),),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
