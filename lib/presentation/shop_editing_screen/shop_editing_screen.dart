import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController shopnameController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController mobilenoController = TextEditingController();

  TextEditingController whatsappController = TextEditingController();

  TextEditingController gstnumberController = TextEditingController();

  TextEditingController balanceController = TextEditingController();

  Routelist? routelist;
  ShopEdit? shopEdit;

  var dropdownvalue;

  bool _validatedropdown = false;

  @override
  void initState() {
    super.initState();
    findRoute();
    getshopsdetials();
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
}
