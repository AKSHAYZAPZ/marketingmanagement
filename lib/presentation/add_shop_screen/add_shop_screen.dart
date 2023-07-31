import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jibin_s_application1/core/app_export.dart';
import 'package:jibin_s_application1/model/addshopmodel.dart';
import 'package:jibin_s_application1/presentation/home_dashboard_screen/home_dashboard_screen.dart';
import 'package:jibin_s_application1/services/service.dart';
import 'package:jibin_s_application1/widgets/app_bar/appbar_image.dart';
import 'package:jibin_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:jibin_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:jibin_s_application1/widgets/custom_button.dart';
import 'package:jibin_s_application1/widgets/custom_text_form_field.dart';
import '../../model/routemodel.dart';
import '../bottom_navigation_page/bottom_navigation.dart';

// ignore_for_file: must_be_immutable
class AddShopScreen extends StatefulWidget {
  AddShopScreen({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  State<AddShopScreen> createState() => _AddShopScreenState();
}

class _AddShopScreenState extends State<AddShopScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _validatedropdown = false;

  var dropdownvalue;

  TextEditingController shopnameController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController mobilenoController = TextEditingController();

  TextEditingController whatsappController = TextEditingController();

  TextEditingController gstnumberController = TextEditingController();

  TextEditingController balanceController = TextEditingController();

  Routelist? routelist;

  @override
  void initState() {
    super.initState();
    findRoute();
  }

  findRoute() async {
    routelist = await HttpService.getRoute(widget.id);
    print('this is route: ${routelist}');
    if (routelist != null) {
      setState(() {});
    }
  }

  // String validateDropdownValue(String value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Please select an item';
  //   }else{
  //     return '';
  //   }
  //   // Return null to indicate no validation errors
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return BottomNavigationScreen(id: widget.id);
          },
        ));
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: ColorConstant.lightBlue700,
            centerTitle: true,
            title: Text('Shops'),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                // Handle the back button press here
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomNavigationScreen(id: widget.id),
                  ),
                );
              },
            ),
          ),
          body: routelist != null
              ? SingleChildScrollView(
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [],
                              ),
                            ],
                          ),
                          Container(
                            padding: getPadding(top: 6, bottom: 6),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                          padding:
                                              getPadding(left: 39, top: 30),
                                          child: Text("Shop Name",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtMontserratRegular14))),
                                  CustomTextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter Shopname';
                                        }
                                      },
                                      controller: shopnameController,
                                      margin: getMargin(
                                          left: 39, top: 14, right: 42)),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                          padding:
                                              getPadding(left: 39, top: 17),
                                          child: Text("Address",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtMontserratRegular14))),
                                  CustomTextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter Adress';
                                        }
                                      },
                                      controller: addressController,
                                      margin: getMargin(
                                          left: 39, top: 15, right: 42)),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: getPadding(left: 39, top: 17),
                                      child: Text("Phone",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style:
                                              AppStyle.txtMontserratRegular14),
                                    ),
                                  ),
                                  CustomTextFormField(
                                    textInputType: TextInputType.phone,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter mobile number';
                                      } else if (value.length != 10) {
                                        return 'Please enter valid Mobilenumber';
                                      } else {
                                        return null;
                                      }
                                    },
                                    controller: mobilenoController,
                                    margin:
                                        getMargin(left: 39, top: 14, right: 42),
                                  ),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                          width: getHorizontalSize(73),
                                          margin: getMargin(left: 39, top: 17),
                                          child: Text("Whatsapp Number",
                                              maxLines: null,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtMontserratRegular14))),
                                  CustomTextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter whatsapp number';
                                        } else if (value.length != 10) {
                                          return 'Please enter valid Mobilenumber';
                                        } else {
                                          return null;
                                        }
                                      },
                                      textInputType: TextInputType.phone,
                                      controller: whatsappController,
                                      margin: getMargin(left: 39, right: 42)),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      width: getHorizontalSize(59),
                                      margin: getMargin(left: 39, top: 17),
                                      child: Text("GST Number",
                                          maxLines: null,
                                          textAlign: TextAlign.left,
                                          style:
                                              AppStyle.txtMontserratRegular14),
                                    ),
                                  ),
                                  CustomTextFormField(
                                    validator: (value) {
                                      if(value!.length >15){
                                        return 'Please enter valid GST number';
                                      }
                                    },
                                      controller: gstnumberController,
                                      margin: getMargin(left: 39, right: 42),
                                      textInputAction: TextInputAction.done),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: getPadding(left: 39, top: 17),
                                      child: Text("Opening Balance",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style:
                                          AppStyle.txtMontserratRegular14),
                                    ),
                                  ),
                                  CustomTextFormField(
                                    textInputType: TextInputType.phone,
                                    // validator: (value) {
                                    //   if (value!.isEmpty) {
                                    //     return 'Please enter mobile number';
                                    //   } else if (value.length != 10) {
                                    //     return 'Please enter valid Mobilenumber';
                                    //   } else {
                                    //     return null;
                                    //   }
                                    // },
                                    controller: balanceController,
                                    margin:
                                    getMargin(left: 39, top: 14, right: 42),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 35, right: 35),
                                    child: Container(
                                      width: double.infinity,
                                      child: DropdownButton(
                                        value: dropdownvalue,
                                        hint: Text('Select Route'),
                                        onChanged: (selecteditem) {
                                          setState(() {
                                            dropdownvalue = selecteditem;
                                            _validatedropdown = true;
                                          });
                                        },
                                        items: routelist!.data.length > 0
                                            ? routelist!.data
                                                .map<DropdownMenuItem<String>>(
                                                    (e) {
                                                return DropdownMenuItem<String>(
                                                  value: e.id.toString(),
                                                  child: Text(e.route),
                                                );
                                              }).toList()
                                            : null,
                                      ),
                                    ),
                                  ),
                                  CustomButton(
                                    text: "Submit",
                                    margin:
                                        getMargin(left: 15, top: 10, right: 15),
                                    shape: ButtonShape.RoundedBorder24,
                                    fontStyle:
                                        ButtonFontStyle.DMSansMedium20WhiteA700,
                                    onTap: () async {
                                      if (_formKey.currentState != null &&
                                          _formKey.currentState!.validate()) {
                                        _formKey.currentState!.save();
                                        if (_validatedropdown == false) {
                                          Fluttertoast.showToast(
                                            msg: 'Please select a route',
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            backgroundColor: Colors.black,
                                            textColor: Colors.white,
                                          );
                                        } else {
                                          Addshop addshop =
                                          await HttpService.addShop(
                                            shopnameController.text,
                                            addressController.text,
                                            mobilenoController.text,
                                            whatsappController.text,
                                            gstnumberController.text,
                                            dropdownvalue,
                                            widget.id,
                                            balanceController.text,
                                          );
                                          if (addshop.status == true) {
                                            Fluttertoast.showToast(
                                              msg: addshop.message,
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              backgroundColor: Colors.black,
                                              textColor: Colors.white,
                                            );
                                            onTapSubmit(context);
                                          } else {
                                            Fluttertoast.showToast(
                                              msg: addshop.message,
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              backgroundColor: Colors.black,
                                              textColor: Colors.white,
                                            );
                                          }
                                        }
                                      }

                                      // print(shopnameController.text);
                                      // print(addressController.text);
                                      // print( mobilenoController.text);
                                      // print( 'id : ${widget.id} ');
                                      // print('dropvalue : $dropdownvalue')
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }

  /// Navigates back to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is used
  /// to navigate back to the previous screen.
  onTapArrowleft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the shopsScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the `Navigator` widget
  /// to push the named route for the shopsScreen.
  onTapSubmit(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.shopsScreen);
  }
}
