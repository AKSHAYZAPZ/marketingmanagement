import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jibin_s_application1/model/checknumber.dart';
import 'package:jibin_s_application1/presentation/otp_screen/otp_screen.dart';
import 'package:jibin_s_application1/services/service.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../model/sendotp_model.dart';
import '../../theme/app_style.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_form_field.dart';

class PhoneCheckScreen extends StatelessWidget {
  PhoneCheckScreen({Key? key}) : super(key: key);

  TextEditingController numberController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var phone ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: ColorConstant.blue600,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: ColorConstant.blue600,
        child: Center(
          child: Container(
            padding: getPadding(left: 23, right: 23),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Verify your phone number',
                      style: AppStyle.txtRobotoMedium24),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                      'We have send you an SMS with a code to your Whatsapp number',
                      textAlign: TextAlign.center,
                      style: AppStyle.txtDMSansRegular18WhiteA700),
                  CustomTextFormField(
                      focusBordercolor: Colors.white,
                      errorBorderColor: Colors.white,
                      errorColor: Colors.white,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Mobile number';
                        } else if (value.length != 10) {
                          return 'Please enter valid Mobilenumber';
                        } else {
                          return null;
                        }
                      },
                      focusNode: FocusNode(),
                      controller: numberController,
                      hintText: "Mobile Number",
                      margin: getMargin(top: 64),
                      variant: TextFormFieldVariant.OutlineWhiteA700,
                      fontStyle: TextFormFieldFontStyle.DMSansRegular19,
                      textInputType: TextInputType.phone),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: CustomButton(
                      height: getVerticalSize(59),
                      text: "Next",
                      margin: getMargin(top: 47),
                      variant: ButtonVariant.FillWhiteA700,
                      shape: ButtonShape.RoundedBorder24,
                      fontStyle: ButtonFontStyle.DMSansMedium22,
                      onTap: () async {
                        if (_formKey.currentState != null &&
                            _formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                        }
                        CheckNumber? checkStatus =
                            await HttpService.checkPhoneNumber(
                                numberController.text);
                          phone =numberController.text;
                        if (checkStatus != null) {
                          if (checkStatus.status == true) {
                            sendingOtp(context);
                          } else {
                            // print('is that : ${checkStatus.message}');
                            Fluttertoast.showToast(
                              msg: checkStatus.message,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.black,
                              textColor: Colors.white,
                            );
                          }
                        } else {}
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  sendingOtp(context) async {
 var otp =
 generateRandomNumbers(1);
  print('otp: $otp ');
 Sendotp otpupdate = await HttpService.verifyOtp(phone, otp);
  // print(otpupdate.message);
 if(otpupdate.status == true){
   Fluttertoast.showToast(
     msg: otpupdate.message,
     toastLength: Toast.LENGTH_SHORT,
     gravity: ToastGravity.BOTTOM,
     backgroundColor: Colors.black,
     textColor: Colors.white,
   );
   Navigator.push(
       context, MaterialPageRoute(builder: (context) => OtpScreen(phone: phone, otp: otp)));
 }else{

 }

  }

  generateRandomNumbers(int count){
    Random random = Random();
    int randomNumber;
    var otp ='';

    for(int i=0; i< count; i++){
       randomNumber = random.nextInt(9000) + 1000;
      // print('otp : $randomNumber');
        otp = randomNumber.toString();
    }
    return otp;
  }
}
