import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:custom_switch_widget/custom_switch_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:jibin_s_application1/core/app_export.dart';
import 'package:jibin_s_application1/model/addshopmodel.dart';
import 'package:jibin_s_application1/services/service.dart';
import 'package:jibin_s_application1/widgets/custom_button.dart';
import 'package:jibin_s_application1/widgets/custom_text_form_field.dart';
import '../../model/routemodel.dart';
import '../bottom_navigation_page/bottom_navigation.dart';

// ignore_for_file: must_be_immutable
class AddShopScreen extends StatefulWidget {
  AddShopScreen({Key? key, required this.token}) : super(key: key);

  final String token;

  @override
  State<AddShopScreen> createState() => _AddShopScreenState();
}

class _AddShopScreenState extends State<AddShopScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _validatedropdown = false;

  var latitude = '';
  var longitude = '';

  void _disable() async {
    _switchcontroller.disable();
  }

  void _enable() async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text('Set shop location?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),
            ElevatedButton(
                onPressed: () async {
                  LocationPermission permission =
                      await Geolocator.checkPermission();
                  if (permission == LocationPermission.denied) {
                    permission = await Geolocator.requestPermission();
                  } else {}
                  Position position = await Geolocator.getCurrentPosition(
                    desiredAccuracy: LocationAccuracy.high,
                  );
                  double latitudes = position.latitude;
                  double longitudes = position.longitude;
                  _switchcontroller.enable();
                   latitude = latitudes.toString();
                   longitude = longitudes.toString();
                  print(latitude);
                  print(longitude);
                  Navigator.pop(context);
                },
                child: Text("Yes"))
          ],
        );
      },
    );
  }

  var dropdownvalue;

  TextEditingController shopnameController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController mobilenoController = TextEditingController();

  TextEditingController whatsappController = TextEditingController();

  TextEditingController gstnumberController = TextEditingController();

  TextEditingController balanceController = TextEditingController();

  Routelist? routelist;
  bool dataConnection = false;

  final CustomSwitchController _switchcontroller =
      CustomSwitchController(initialValue: false);

  @override
  void initState() {
    super.initState();
    checkConnectiVity();
  }

  findRoute() async {
    routelist = await HttpService.getRoute(widget.token);
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
            return BottomNavigationScreen(id: widget.token);
          },
        ));
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: ColorConstant.lightBlue700,
            centerTitle: true,
            title: Text('Add new shop'),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                // Handle the back button press here
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        BottomNavigationScreen(id: widget.token),
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
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('Set Shop Location'),
                              SizedBox(
                                width: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 22),
                                child: CustomSwitchWidget(
                                  activeColor: ColorConstant.blue600,
                                  controller: _switchcontroller,
                                  onChange: (value) {
                                    if (value)
                                      _disable();
                                    else
                                      _enable();
                                  },
                                ),
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
                                      variant:
                                          TextFormFieldVariant.OutlineBlackA700,
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
                                      variant:
                                          TextFormFieldVariant.OutlineBlackA700,
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
                                    variant:
                                        TextFormFieldVariant.OutlineBlackA700,
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
                                      width: getHorizontalSize(170),
                                      margin: getMargin(left: 39, top: 17),
                                      child: Text("Whatsapp Number",
                                          maxLines: null,
                                          textAlign: TextAlign.left,
                                          style:
                                              AppStyle.txtMontserratRegular14),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  CustomTextFormField(
                                      variant:
                                          TextFormFieldVariant.OutlineBlackA700,
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
                                      width: getHorizontalSize(100),
                                      margin: getMargin(left: 39, top: 17),
                                      child: Text("GST Number",
                                          maxLines: null,
                                          textAlign: TextAlign.left,
                                          style:
                                              AppStyle.txtMontserratRegular14),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  CustomTextFormField(
                                      variant:
                                          TextFormFieldVariant.OutlineBlackA700,
                                      validator: (value) {
                                        if (value!.length > 15) {
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
                                    variant:
                                        TextFormFieldVariant.OutlineBlackA700,
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
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: ColorConstant.gray300,
                                            width: 3.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, right: 8),
                                        child: DropdownButton(
                                          underline: Container(),
                                          value: dropdownvalue,
                                          hint: Text('Select Route',
                                              style: AppStyle
                                                  .txtMontserratRegular14),
                                          onChanged: (selecteditem) {
                                            setState(() {
                                              dropdownvalue = selecteditem;
                                              _validatedropdown = true;
                                            });
                                          },
                                          items: routelist!.data.length > 0
                                              ? routelist!.data.map<
                                                      DropdownMenuItem<String>>(
                                                  (e) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: e.id.toString(),
                                                    child: Text(e.route),
                                                  );
                                                }).toList()
                                              : null,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  CustomButton(
                                    text: "Submit",
                                    margin:
                                        getMargin(left: 35, top: 10, right: 35),
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
                                                  widget.token,
                                                  balanceController.text,
                                                  latitude,
                                                  longitude);
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
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BottomNavigationScreen(id: widget.token),
        ));
  }

  checkConnectiVity() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      dataConnection = true;
      if (dataConnection == true) {
        setState(() {
          findRoute();
        });
      }
    } else {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.red,
            ),
            height: 70,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'No Network connection',
                    style: TextStyle(color: Colors.white),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    child: const Text(
                      'Retry',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      checkConnectiVity();
                    },
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }
}
