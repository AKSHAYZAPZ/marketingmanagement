import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:jibin_s_application1/presentation/login_screen/login_screen.dart';
import 'package:jibin_s_application1/services/service.dart';

import '../../model/Reset_model.dart';

class PasswordChangeScreen extends StatelessWidget {
  PasswordChangeScreen({Key? key, required this.phone}) : super(key: key);

  var phone;

  TextEditingController newPassController = TextEditingController();
  TextEditingController reenterPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('---------: $phone');
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: newPassController,
            ),
            TextFormField(
              controller: reenterPassController,
            ),
            ElevatedButton(
              onPressed: ()async {
               var newpass = newPassController.text;
               var repass = reenterPassController.text;
                if(newpass == repass){
                  print('resetting  : $newpass');
                  ResetPassword reset = await HttpService.resetPassword(phone, newpass);
                  if(reset.status == true){
                    Fluttertoast.showToast(
                      msg:reset.message,
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                    );
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                  }else{
                    Fluttertoast.showToast(
                        msg:'No changed',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                    );

                  }
                }else{
                  Fluttertoast.showToast(
                    msg:'Password not Matched',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.black,
                    textColor: Colors.white,
                  );
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

}
