import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:jibin_s_application1/presentation/login_screen/login_screen.dart';
import 'package:jibin_s_application1/services/service.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../model/Reset_model.dart';
import '../../theme/app_style.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_form_field.dart';

class PasswordChangeScreen extends StatelessWidget {
  PasswordChangeScreen({Key? key, required this.phone}) : super(key: key);

  var phone;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController newPassController = TextEditingController();
  TextEditingController reenterPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: ColorConstant.blue600,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: size.width,
          height: size.height,
          child: Form(
            key: _formKey,
            child: Container(
              width: double.maxFinite,
              padding: getPadding(left: 23, right: 23),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: getHorizontalSize(224),
                      child: Text("Welcome to\nMEMA",
                          maxLines: null,
                          textAlign: TextAlign.center,
                          style: AppStyle.txtDMSansMedium40)),
                  Padding(
                    padding: getPadding(top: 61),
                    child: Text("Change Password",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtRobotoMedium24),
                  ),
                  CustomTextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Password';
                        } else {
                          return null;
                        }
                      },
                      focusNode: FocusNode(),
                      controller: newPassController,
                      hintText: "New password",
                      margin: getMargin(top: 64),
                      variant: TextFormFieldVariant.OutlineWhiteA700,
                      fontStyle: TextFormFieldFontStyle.DMSansRegular19,
                      textInputType: TextInputType.emailAddress),
                  CustomTextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Password';
                        } else {
                          return null;
                        }
                      },
                      focusNode: FocusNode(),
                      controller: reenterPassController,
                      hintText: "re enter Password",
                      margin: getMargin(top: 21),
                      variant: TextFormFieldVariant.OutlineWhiteA700,
                      fontStyle: TextFormFieldFontStyle.DMSansRegular19,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.visiblePassword,
                      isObscureText: true),
                  CustomButton(
                      height: getVerticalSize(59),
                      text: "Change Password",
                      margin: getMargin(top: 47),
                      variant: ButtonVariant.FillWhiteA700,
                      shape: ButtonShape.RoundedBorder24,
                      fontStyle: ButtonFontStyle.DMSansMedium20,
                      onTap: () async {
                        if (_formKey.currentState != null &&
                            _formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                        }
                        var newpass = newPassController.text;
                        var repass = reenterPassController.text;
                        if (newpass == repass) {
                          print('resetting  : $newpass');
                          ResetPassword reset =
                              await HttpService.resetPassword(phone, newpass);
                          if (reset.status == true) {
                            Fluttertoast.showToast(
                              msg: reset.message,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.black,
                              textColor: Colors.white,
                            );
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ));
                          } else {
                            Fluttertoast.showToast(
                              msg: 'No changed',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.black,
                              textColor: Colors.white,
                            );
                          }
                        } else {
                          Fluttertoast.showToast(
                            msg: 'Password not Matched',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                          );
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
