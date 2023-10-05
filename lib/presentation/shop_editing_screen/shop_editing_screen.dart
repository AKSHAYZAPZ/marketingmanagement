import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:custom_switch_widget/custom_switch_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:jibin_s_application1/presentation/shop_details_page/shop_details_page.dart';

import '../../core/utils/color_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../model/routemodel.dart';
import '../../model/shop_editing_model.dart';
import '../../model/update_shop_model.dart';
import '../../services/service.dart';
import '../../theme/app_style.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_form_field.dart';

class ShopEditingScreen extends StatefulWidget {
  ShopEditingScreen({Key? key, required this.token, required this.shopId})
      : super(key: key);

  String token;
  String shopId;

  @override
  State<ShopEditingScreen> createState() => _ShopEditingScreenState();
}

class _ShopEditingScreenState extends State<ShopEditingScreen> {
  bool isLoading = true;

  final CustomSwitchController _switchcontroller =
  CustomSwitchController(initialValue: false);

  var latitude = '';
  var longitude = '';

  void _enable() async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text('Update shop location?'),
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

                  latitude = latitudes.toString();
                  longitude = longitudes.toString();
                  print(latitude);
                  print(longitude);
                  Navigator.pop(context);
                  setState(() {
                    _switchcontroller.enable();
                  });
                },
                child: Text("Yes"))
          ],
        );
      },
    );
  }

  void _disable() async {
    _switchcontroller.disable();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController shopnameController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController mobilenoController = TextEditingController();

  TextEditingController whatsappController = TextEditingController();

  TextEditingController gstnumberController = TextEditingController();

  TextEditingController balanceController = TextEditingController();
  bool dataConnection = false;

  Routelist? routelist;
  ShopEdit? shopEdit;

  var dropdownvalue;

  bool _validatedropdown = false;

  @override
  void initState() {
    super.initState();
    findRoute();
    checkConnectiVity();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.lightBlue700,
        centerTitle: true,
        title: Text('Edit Shop'),
      ),
      body: isLoading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : routelist != null && shopEdit != null
              ? SingleChildScrollView(
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: getPadding(top: 6, bottom: 6),
                            child: Form(
                              key: _formKey,
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
                                              style: AppStyle
                                                  .txtMontserratRegular14))),
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
                                      width: getHorizontalSize(170),
                                      margin: getMargin(left: 39, top: 17),
                                      child: Text("GST Number",
                                          maxLines: null,
                                          textAlign: TextAlign.left,
                                          style:
                                              AppStyle.txtMontserratRegular14),
                                    ),
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
                                      height: 45,
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
                                          hint: Text('Select Route'),
                                          style:
                                              AppStyle.txtMontserratRegular14,
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
                                      UpdateShop updateShop =
                                          await HttpService.updateShop(
                                        shopnameController.text,
                                        addressController.text,
                                        mobilenoController.text,
                                        whatsappController.text,
                                        gstnumberController.text,
                                        dropdownvalue,
                                        widget.token,
                                        balanceController.text,
                                        widget.shopId,
                                            latitude,
                                            longitude
                                      );
                                      if (updateShop.status == true) {
                                        Fluttertoast.showToast(
                                          msg: updateShop.message,
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          backgroundColor: Colors.black,
                                          textColor: Colors.white,
                                        );
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ShopDetailsPage(
                                                id: widget.token,
                                                shopId: widget.shopId,
                                              ),
                                            ));
                                      } else {
                                        print('notupdated');
                                      }
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
                  child: AlertDialog(
                  content: Text("You Can't edit this Shop "),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Back'),
                    ),
                  ],
                )),
    );
  }

  findRoute() async {
    routelist = await HttpService.getRoute(widget.token);
    if (routelist != null) {
      setState(() {
        isLoading = false;
      });
    }
  }

  getshopsdetials() async {
    shopEdit = await HttpService.getShopDetailseditingData(
        widget.token, widget.shopId);
    if (shopEdit != null) {
      setState(() {
        shopnameController.text = shopEdit!.data.name;
        addressController.text = shopEdit!.data.address;
        mobilenoController.text = shopEdit!.data.phoneNumber;
        whatsappController.text = shopEdit!.data.whatsappNumber;
        gstnumberController.text = shopEdit!.data.gstNo;
        balanceController.text = shopEdit!.data.openingBalance;
        dropdownvalue = shopEdit!.data.route;
      });
    }
  }

  checkConnectiVity() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      dataConnection = true;
      if (dataConnection == true) {
        setState(() {
          getshopsdetials();
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
