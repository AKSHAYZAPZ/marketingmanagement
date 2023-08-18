import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jibin_s_application1/core/utils/color_constant.dart';
import 'package:jibin_s_application1/presentation/bottom_navigation_page/bottom_navigation.dart';
import 'package:jibin_s_application1/presentation/login_screen/login_screen.dart';

import '../../shared_prefrence/shared_preference.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key? key, required this.id}) : super(key: key);

  String id;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      appBar: AppBar(
        backgroundColor: ColorConstant.lightBlue700,
        centerTitle: true,
        title: Text('Settings'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BottomNavigationScreen(id: widget.id),
                ));
          },
        ),
      ),
      body: Column(
        children: [
          ListTile(
            leading: Icon(Icons.info),
            title: Text("About"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.privacy_tip_outlined),
            title: Text("Privacy Policy"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.note_alt_outlined),
            title: Text("Terms and Conditions"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: () async {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text('Are you sure want to logout?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('No'),
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            await CommonFuntion.addDataToSharedPreferences(
                                'logout', 'succees');
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                                (route) => false);
                          },
                          child: Text('Yes'))
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
