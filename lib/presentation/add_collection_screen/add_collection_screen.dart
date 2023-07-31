import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:jibin_s_application1/presentation/collection_screen/collection_screen.dart';
import 'package:jibin_s_application1/services/service.dart';

import '../../core/utils/color_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../model/allshops_model.dart';
import '../../model/cashpayment_model.dart';
import '../../model/payment_type_model.dart';
import '../../theme/app_decoration.dart';
import '../../theme/app_style.dart';
import '../../widgets/custom_button.dart';

class MyShopResult {
  final String shopname;
  final int shopId;

  MyShopResult({
    required this.shopname,
    required this.shopId,
  });
}

class AddCollectionScreen extends StatefulWidget {
  AddCollectionScreen({Key? key, required this.id}) : super(key: key);

  String id;

  @override
  State<AddCollectionScreen> createState() => _AddCollectionScreenState();
}

class _AddCollectionScreenState extends State<AddCollectionScreen> {
  bool _validatedropdown = false;

  var dropdownvalue;

  PaymentType? paymentType;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _amountController = TextEditingController();

  final TextEditingController _searchController = TextEditingController();

  Allshops? allshops;

  String searchkey = '';
  String shopid = '';
  String route = '';

  @override
  void initState() {
    super.initState();
    getallshops();
    dropdownvalues();
  }

  dropdownvalues() async {
    paymentType = await HttpService.paymentTypes();
    if (paymentType != null) {
      setState(() {});
    }
  }

  getallshops() async {
    allshops = await HttpService.allShops(widget.id, searchkey, route);
    if (allshops!.status == true) {
      setState(() {});
    }
  }

  Future<List<MyShopResult>> getSearchResults(String query) async {
    await Future.delayed(Duration(seconds: 1));
    return List.generate(
        allshops!.data.length,
        (index) => MyShopResult(
              shopname: allshops!.data[index].shopName,
              shopId: allshops!.data[index].id,
            ));
  }

  Future<List<MyShopResult>> getSuggestions(String query) async {
    List<MyShopResult> results = await getSearchResults(query);
    List<MyShopResult> filteredResults = results
        .where((result) =>
            result.shopname.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return filteredResults;
  }

  String date = DateFormat('dd-MM-yyyy').format(DateTime.now());
  String selectedOption = 'Cash Payment';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.lightBlue700,
        title: Text('Add Collcetion'),
        centerTitle: true,
      ),
      body: allshops == null && paymentType == null
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
                      child: TypeAheadFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter shop name';
                          } else if (allshops!.data
                              .where((element) => element.shopName == value)
                              .isEmpty) {
                            return 'Entered shop not exist';
                          } else {
                            return null;
                          }
                        },
                        textFieldConfiguration: TextFieldConfiguration(
                          controller: _searchController,
                          decoration: InputDecoration(
                            hintText: 'Shop Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        onSuggestionSelected: (MyShopResult suggestion) {
                          _searchController.text = suggestion.shopname;
                          shopid = suggestion.shopId.toString();
                        },
                        itemBuilder:
                            (BuildContext context, MyShopResult suggession) {
                          return ListTile(title: Text(suggession.shopname));
                        },
                        suggestionsCallback: getSuggestions,
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
                                await HttpService.paymentByCash(paidAmount,
                                    date, widget.id, shopid, dropdownvalue);

                            if (cashPayment.status == true) {
                              _amountController.text = '';
                              _searchController.text = '';
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        CollectionScreen(id: widget.id),
                                  ));
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
}
