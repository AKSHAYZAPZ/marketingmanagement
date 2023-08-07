import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:jibin_s_application1/presentation/shop_details_page/shop_details_page.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../model/cashpayment_model.dart';
import '../../model/payment_type_model.dart';
import '../../services/service.dart';
import '../../widgets/custom_button.dart';

class AddcollectionFromShop extends StatefulWidget {
  AddcollectionFromShop(
      {Key? key,
      required this.id,
      required this.shopId,
      required this.shopName})
      : super(key: key);

  String id;
  String shopId;
  String shopName;

  @override
  State<AddcollectionFromShop> createState() => _AddcollectionFromShopState();
}

class _AddcollectionFromShopState extends State<AddcollectionFromShop> {
  bool _validatedropdown = false;

  PaymentType? paymentType;

  var dropdownvalue;

  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();

  String date = DateFormat('dd-MM-yyyy').format(DateTime.now());

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    dropdownvalues();
  }

  @override
  Widget build(BuildContext context) {
    _searchController.text = widget.shopName;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.lightBlue700,
        title: Text('Add Collcetion'),
        centerTitle: true,
      ),
      body: paymentType == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Shop Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            value: dropdownvalue == '' ? null : dropdownvalue,
                            underline: Container(),
                            hint: Text('Select Payment'),
                            items: paymentType!.data.length > 0
                                ? paymentType!.data
                                    .map<DropdownMenuItem<String>>((e) {
                                    return DropdownMenuItem<String>(
                                      value: e.id.toString(),
                                      child: Text(e.type),
                                    );
                                  }).toList()
                                : null,
                            onChanged: (selectedItem) {
                              setState(() {
                                dropdownvalue = selectedItem;
                                _validatedropdown = true;
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
                      text: "Pay",
                      variant: ButtonVariant.FillLightblue700,
                      margin: getMargin(left: 10, top: 5, right: 10),
                      shape: ButtonShape.RoundedBorder24,
                      fontStyle: ButtonFontStyle.DMSansMedium20WhiteA700,
                      onTap: () async {
                        if (_formKey.currentState != null &&
                            _formKey.currentState!.validate()) {
                          _formKey.currentState!.save();

                          String paidAmount = _amountController.text;
                          if (_validatedropdown == false) {
                            Fluttertoast.showToast(
                              msg: 'Please select Payment methord',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.black,
                              textColor: Colors.white,
                            );
                          } else {
                            CashPayment cashPayment =
                                await HttpService.paymentByCash(
                                    paidAmount,
                                    date,
                                    widget.id,
                                    widget.shopId,
                                    dropdownvalue);

                            if (cashPayment.status == true) {
                              _amountController.text = '';
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ShopDetailsPage(
                                      id: widget.id, shopId: widget.shopId),
                                ),
                              );
                              Fluttertoast.showToast(
                                msg: cashPayment.message,
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.black,
                                textColor: Colors.white,
                              );
                            } else {
                              Fluttertoast.showToast(
                                msg: cashPayment.message,
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.black,
                                textColor: Colors.white,
                              );
                            }
                          }
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
    );
  }

  dropdownvalues() async {
    paymentType = await HttpService.paymentTypes();
    if (paymentType != null) {
      setState(() {});
    }
  }
}
