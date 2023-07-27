import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:jibin_s_application1/presentation/Change_password_screen/change_password_screen.dart';

import '../../core/utils/color_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../theme/app_style.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_form_field.dart';

class OtpScreen extends StatefulWidget {
   OtpScreen({ Key? key, required this.phone, required this.otp}) : super(key: key);

   var phone;
    var otp;
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpController = TextEditingController();

  final int _otpLength = 4;
  late List<FocusNode> _focusNodes;
  late List<TextEditingController> _controllers;
  late List<String> _otpValues;

  @override
  void initState() {
    super.initState();
    _focusNodes = List<FocusNode>.generate(_otpLength, (index) => FocusNode());
    _controllers =
    List<TextEditingController>.generate(_otpLength, (index) => TextEditingController());
    _otpValues = List<String>.generate(_otpLength, (index) => '');
  }

  @override
  void dispose() {
    for (int i = 0; i < _otpLength; i++) {
      _focusNodes[i].dispose();
      _controllers[i].dispose();
    }
    super.dispose();
  }

  void _otpValueChanged(String value, int index) {
    setState(() {
      _otpValues[index] = value;
    });
    if (value.isNotEmpty && index < _otpLength - 1) {
      _focusNodes[index + 1].requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    // print('otp: ${widget.otp}');
    // print('phone: ${widget.phone}');
    return  Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: ColorConstant.blue600,
      ),
      body: Container(
          color: ColorConstant.blue600,
        height: double.maxFinite,
        width: double.maxFinite,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('OTP Verification',
                  style: AppStyle.txtRobotoMedium24),
              SizedBox(
                height: 180,
              ),
              Text(
                  'Enter your OTP code here',
                  textAlign: TextAlign.center,
                  style: AppStyle.txtDMSansRegular18WhiteA700),
              SizedBox(
                height: 30,
              ),
            Padding(
              padding: const EdgeInsets.only(left: 40,right: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  _otpLength,
                      (index) => SizedBox(
                    width: 50, // Set the desired width for each TextField
                    child: TextField(

                      controller: _controllers[index],
                      focusNode: _focusNodes[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      onChanged: (value) => _otpValueChanged(value, index),
                      decoration: InputDecoration(

                        fillColor: Colors.white,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        counterText: '',
                      ),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: CustomButton(
                  height: getVerticalSize(59),
                  text: "Verify",
                  margin: getMargin(top: 47),
                  variant: ButtonVariant.FillWhiteA700,
                  shape: ButtonShape.RoundedBorder24,
                  fontStyle: ButtonFontStyle.DMSansMedium22,
                  onTap: () async {
                    String enteredOtp = '';
                    for (int i = 0; i < _otpLength; i++) {
                      enteredOtp += _controllers[i].text;
                    }
                    if(enteredOtp ==widget.otp){
                      Fluttertoast.showToast(
                        msg: 'OTP verified',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                      );
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>PasswordChangeScreen(phone: widget.phone),));
                    }else{
                      Fluttertoast.showToast(
                        msg:'Wrong Otp',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
