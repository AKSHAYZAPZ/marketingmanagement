import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:jibin_s_application1/presentation/shop_details_page/shop_details_page.dart';
import 'package:jibin_s_application1/services/service.dart';

import '../../core/utils/color_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../model/payment_editing_model.dart';
import '../../model/payment_type_model.dart';
import '../../model/update_payment_model.dart';
import '../../widgets/custom_button.dart';

class PaymentEditingScreen extends StatefulWidget {
  PaymentEditingScreen({Key? key, required this.id, required this.paymentId})
      : super(key: key);

  String id;
  String paymentId;

  @override
  State<PaymentEditingScreen> createState() => _PaymentEditingScreenState();
}

class _PaymentEditingScreenState extends State<PaymentEditingScreen> {
  @override
  void initState() {
    super.initState();
    getData();
    dropdownvalues();
  }

  EditPayment? editPayment;
  String ShopId = '';
  final TextEditingController _amountController = TextEditingController();

  final TextEditingController _shopController = TextEditingController();

  PaymentType? paymentType;
  String date = '';

  dropdownvalues() async {
    paymentType = await HttpService.paymentTypes();
    if (paymentType != null) {
      setState(() {});
    }
  }

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var dropdownvalue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.lightBlue700,
        title: Text('Edit Payment'),
        centerTitle: true,
      ),
      body: editPayment == null && paymentType == null
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _shopController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              enabled: false,
                              hintText: 'Shop name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter shop name';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () async {
                              final toDateselectTemp = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                              );
                              if (toDateselectTemp == null) {
                                return;
                              } else {
                                setState(() {
                                  date = DateFormat('dd-MM-yyyy')
                                      .format(toDateselectTemp);
                                });
                              }
                            },
                            child: Container(
                              height: 55,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey.shade400, // Border color
                                  width: 2.0, // Border width
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      date,
                                      style: TextStyle(color: Colors.grey[800]),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        final toDateselectTemp =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2000),
                                          lastDate: DateTime(2100),
                                        );
                                        if (toDateselectTemp == null) {
                                          return;
                                        } else {
                                          setState(() {
                                            date = DateFormat('dd-MM-yyyy')
                                                .format(toDateselectTemp);
                                          });
                                        }
                                      },
                                      child: Icon(
                                        Icons.calendar_month,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _amountController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter Amount';
                              }
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'Amount',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.shade400, // Border color
                                width: 2.0, // Border width
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: DropdownButton(
                                value:
                                    dropdownvalue == '' ? null : dropdownvalue,
                                underline: Container(),
                                hint: Text('Select Payment'),
                                items: paymentType!.data
                                    .map<DropdownMenuItem<String>>((e) {
                                  return DropdownMenuItem<String>(
                                    value: e.id.toString(),
                                    child: Text(e.type),
                                  );
                                }).toList(),
                                onChanged: (selectedItem) {
                                  setState(() {
                                    dropdownvalue = selectedItem;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomButton(
                          text: "Update",
                          variant: ButtonVariant.FillLightblue700,
                          margin: getMargin(left: 10, top: 5, right: 10),
                          shape: ButtonShape.RoundedBorder24,
                          fontStyle: ButtonFontStyle.DMSansMedium20WhiteA700,
                          onTap: () async {
                            if (_formKey.currentState != null &&
                                _formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              UpdatePayment updatePayment =
                                  await HttpService.updatePayment(
                                      widget.id,
                                      widget.paymentId,
                                      _amountController.text,
                                      dropdownvalue,
                                      ShopId,
                                      date);
                              if (updatePayment != null) {
                                setState(() {
                                  if (updatePayment!.status == true) {
                                    Fluttertoast.showToast(
                                      msg: updatePayment.message,
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      backgroundColor: Colors.black,
                                      textColor: Colors.white,
                                    );
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ShopDetailsPage(
                                              id: widget.id, shopId: ShopId),
                                        ));
                                  } else {
                                    Fluttertoast.showToast(
                                      msg: updatePayment.message,
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      backgroundColor: Colors.black,
                                      textColor: Colors.white,
                                    );
                                  }
                                });
                              }
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  getData() async {
    editPayment =
        await HttpService.editPaymentDetails(widget.id, widget.paymentId);
    if (editPayment != null) {
      setState(() {
        _shopController.text = editPayment!.data.shopName;
        _amountController.text = editPayment!.data.payAmount.toString();
        ShopId = editPayment!.data.shopId.toString();
        dropdownvalue = editPayment!.data.paymentMethodId.toString();
        date = editPayment!.data.createdAt.toString();
      });
    }
  }
}
