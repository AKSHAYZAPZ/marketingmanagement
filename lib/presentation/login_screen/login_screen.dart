import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jibin_s_application1/core/app_export.dart';
import 'package:jibin_s_application1/presentation/phone_check_screen/Phone_check_screen.dart';
import 'package:jibin_s_application1/services/service.dart';
import 'package:jibin_s_application1/shared_prefrence/shared_preference.dart';
import 'package:jibin_s_application1/widgets/custom_button.dart';
import 'package:jibin_s_application1/widgets/custom_text_form_field.dart';
import 'package:jibin_s_application1/presentation/home_dashboard_screen/home_dashboard_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bottom_navigation_page/bottom_navigation.dart';

// ignore_for_file: must_be_immutable
class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var key;
  TextEditingController mobilenumberController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isVisible =true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: ColorConstant.blue600,
        resizeToAvoidBottomInset: true,
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
                          style: AppStyle.txtDMSansMedium40),),
                  Padding(
                    padding: getPadding(top: 61),
                    child: Text("Login to your account",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtRobotoMedium24),
                  ),
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
                      controller: mobilenumberController,
                      hintText: "Mobile Number",
                      margin: getMargin(top: 64),
                      variant: TextFormFieldVariant.OutlineWhiteA700,
                      fontStyle: TextFormFieldFontStyle.DMSansRegular19,
                      textInputType: TextInputType.phone,),
                  SizedBox(height: 10,),
                  CustomTextFormField(
                    focusBordercolor: Colors.white,
                      errorBorderColor: Colors.white,
                    errorColor: Colors.white,
                      suffix: isVisible
                          ? IconButton(
                          onPressed: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          icon: Icon(
                            Icons.visibility_off,
                            color: Colors.white,
                          ))
                          : IconButton(
                          onPressed: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          icon: Icon(
                            Icons.visibility,
                            color: Colors.white,
                          )),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Password';
                        }
                        else {
                          return null;
                        }
                      },
                      controller: passwordController,
                      hintText: "Password",
                      margin: getMargin(top: 21),
                      variant: TextFormFieldVariant.OutlineWhiteA700,
                      fontStyle: TextFormFieldFontStyle.DMSansRegular19,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.visiblePassword,
                      isObscureText: isVisible ? true : false),
                  CustomButton(
                      height: getVerticalSize(59),
                      text: "Login",
                      margin: getMargin(top: 47),
                      variant: ButtonVariant.FillWhiteA700,
                      shape: ButtonShape.RoundedBorder24,
                      fontStyle: ButtonFontStyle.DMSansMedium20,
                      onTap: () async {
                        if (_formKey.currentState != null &&
                            _formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          if (mobilenumberController.text.isNotEmpty &&
                              passwordController.text.isNotEmpty) {
                            var mobilenum = mobilenumberController.text;
                            var password = passwordController.text;
                            var userInfo =
                            await HttpService.checkLogin(mobilenum, password);
                            if (userInfo.status != false) {
                              print('token:${userInfo.data.token}');
                              // print(userInfo.data.username);
                              // print(userInfo.message);
                              key = userInfo.data.token;
                              var username = userInfo.data.username;
                              var name = username.toString()
                                  .split(' ')
                                  .map((word) => word[0].toUpperCase() + word.substring(1))
                                  .join(' ');

                              CommonFuntion.addDataToSharedPreferences(
                                  'token', key);
                              CommonFuntion.addDataToSharedPreferences(
                                  'name', name);
                              Fluttertoast.showToast(
                                msg: userInfo.message,
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.black,
                                textColor: Colors.white,
                              );
                              onTapLogin(context);
                            } else {
                              // print(userInfo.message);
                              Fluttertoast.showToast(
                                msg: userInfo.message,
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.black,
                                textColor: Colors.white,
                              );
                            }
                          }
                        }

                      },
                  ),
                  Padding(
                    padding: getPadding(top: 41),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PhoneCheckScreen(),
                            ));
                      },
                      child: Text("Forgot your password?",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtDMSansRegular18WhiteA700),
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

  /// Navigates to the homeDashboardScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the `Navigator` widget
  /// to push the named route for the homeDashboardScreen.
  onTapLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BottomNavigationScreen(id: key)),
    );
  }
}
