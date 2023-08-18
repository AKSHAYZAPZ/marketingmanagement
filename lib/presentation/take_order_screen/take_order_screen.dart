import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:jibin_s_application1/presentation/oder_details_screen/oder_details_screen.dart';
import 'package:jibin_s_application1/presentation/shop_details_page/shop_details_page.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../model/add_neww_data_order_model.dart';
import '../../model/all_products_list_model.dart';
import '../../model/post_oder_model.dart';
import '../../services/service.dart';

class MyResult {
  final String title;
  final String subtitle;
  final int sellingPrice;
  final int quantity;
  final int productId;
  final int categoryId;
  final int subCategoryId;

  MyResult({
    required this.title,
    required this.subtitle,
    required this.sellingPrice,
    required this.quantity,
    required this.productId,
    required this.categoryId,
    required this.subCategoryId,
  });
}

class TakeOderScreen extends StatefulWidget {
  TakeOderScreen({
    Key? key,
    required this.shopid,
    required this.token,
    this.id,
    this.masterId,
  }) : super(key: key);

  String shopid;
  String token;
  String? id;
  String? masterId;

  @override
  State<TakeOderScreen> createState() => _TakeOderScreenState();
}

class _TakeOderScreenState extends State<TakeOderScreen> {

  String search = '';
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  PostOder? postOder;

  String orderdate = DateFormat('dd-MM-yyyy').format(DateTime.now());
  String createdate = DateFormat('dd-MM-yyyy').format(DateTime.now());

  final TextEditingController _searchController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  List<AllProductLists>? allProductList;
  var productCode;
  int? sellingPrice;
  int? quantity;
  int? prdtId;
  int? catgryId;

  List<String> selectedProduct = [];
  List<String> selectedCode = [];
  List<int> selectedPrice = [];
  List<int> selectedQuantity = [];
  List<int> selectedPdtId = [];
  List<int> selectedCatgryId = [];

  Map<String, dynamic> addProductInfoToMap(
    int categoryId,
    int productId,
    String productName,
    int quantity,
    int price,
    String productCode,
  ) {
    return {
      'category_id': categoryId,
      'product_id': productId,
      'product_name': productName,
      'quantity': quantity,
      'amount': price,
      'product_code': productCode,
    };
  }

  List<Map<String, dynamic>> productDataList = [];

  @override
  void initState() {
    super.initState();
    allProducts();
  }

  allProducts() async {
    allProductList = await HttpService.allProductList(widget.token,search);
    if (allProductList != null) {
      setState(() {});
    }
  }

  Future<List<MyResult>> getSearchResults(String query) async {
      return List.generate(
        allProductList!.length,
        (index) => MyResult(
          title: allProductList![index].productName,
          subtitle: allProductList![index].productCode,
          sellingPrice: allProductList![index].sellingPrice,
          quantity: quantityController.text != ''
              ? int.parse(quantityController.text)
              : 0,
          productId: allProductList![index].productId,
          categoryId: allProductList![index].categoryid,
          subCategoryId: allProductList![index].subcategoryId,
        ),
      );
  }


  Future<List<MyResult>> getSuggestions(String query) async {
    List<MyResult> results = await getSearchResults(query);
    List<MyResult> filteredResults = results
        .where((result) =>
            result.title.toLowerCase().contains(query.toLowerCase()) ||
            result.subtitle.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return filteredResults;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Take Oder'),
      ),
      body:
      allProductList == null
          ? Center(child: CircularProgressIndicator())
          :
      Form(
              key: _formKey,
              child: Container(
                child: Column(children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: MediaQuery.of(context).size.height * 0.5,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: ColorConstant.black9003f,
                                    spreadRadius: getHorizontalSize(
                                      2,
                                    ),
                                    blurRadius: getHorizontalSize(
                                      2,
                                    ),
                                    offset: Offset(
                                      0,
                                      4,
                                    ),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(22),
                                color: ColorConstant.gray50,
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 8),
                                child: TypeAheadFormField<MyResult>(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter Product name';
                                    } else if (allProductList!
                                        .where((element) =>
                                            element.productName == value)
                                        .isEmpty) {
                                      return 'Entered product not exist';
                                    } else {
                                      return null;
                                    }
                                  },
                                  noItemsFoundBuilder: (context) {
                                    return SizedBox(
                                      child:allProductList == null ?
                                          Center(
                                            child: CircularProgressIndicator(),
                                          )
                                    : Center(
                                    child: Text("No Items Found"),
                                    ),
                                    );
                                  },
                                  textFieldConfiguration:
                                      TextFieldConfiguration(
                                        onChanged: (value) {
                                        search = _searchController.text;
                                            allProducts();
                                        },
                                    controller: _searchController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        //labelText: 'Search',
                                        hintStyle: TextStyle(fontSize: 12),
                                        hintText: 'Product Name or code'),
                                  ),
                                  suggestionsCallback: getSuggestions ,
                                  itemBuilder: (context, MyResult suggestion) {
                                    return ListTile(
                                      title: Text(suggestion.title),
                                      //subtitle: Text(suggestion.subtitle),
                                    );
                                  },
                                  onSuggestionSelected: (MyResult suggestion) {
                                    // print("selected ${suggestion.title}");
                                    _searchController.text = suggestion.title;
                                    productCode = suggestion.subtitle;
                                    sellingPrice = suggestion.sellingPrice;
                                    prdtId = suggestion.productId;
                                    catgryId = suggestion.categoryId;
                                  },
                                ),
                              )),
                          SizedBox(
                            width: 9,
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: MediaQuery.of(context).size.height * 0.5,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: ColorConstant.black9003f,
                                    spreadRadius: getHorizontalSize(
                                      2,
                                    ),
                                    blurRadius: getHorizontalSize(
                                      2,
                                    ),
                                    offset: Offset(
                                      0,
                                      4,
                                    ),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(22),
                                color: ColorConstant.gray50,
                              ),
                              child: Center(
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter quantity';
                                    } else {}
                                  },
                                  keyboardType: TextInputType.number,
                                  controller: quantityController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.fromLTRB(15, 10, 0, 10),
                                    hintText: 'Quantity',
                                    hintStyle: TextStyle(fontSize: 13),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: 9,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: GestureDetector(
                                onTap: () {
                                  if (_formKey.currentState != null &&
                                      _formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    setState(() {
                                      // productAdded = productAdded + 1;
                                      quantity =
                                          int.parse(quantityController.text);

                                      productDataList.add(addProductInfoToMap(
                                        catgryId!,
                                        prdtId!,
                                        _searchController.text,
                                        quantity!,
                                        quantity! * sellingPrice!,
                                        productCode,
                                      ));
                                      _searchController.text = '';
                                      quantityController.text = '';
                                    });
                                  }

                                  // selectedProduct.add(_searchController.text);
                                  // selectedCode.add(productCode);
                                  // selectedPrice.add(sellingPrice!);
                                  // selectedQuantity.add(quantity!);
                                  // selectedPdtId.add(prdtId!);
                                  // selectedCatgryId.add(catgryId!);
                                  // print(quantity);

                                  // for (Map<String, dynamic> productData in productDataList) {
                                  //   print(
                                  //       "Product ID: ${productData['product_id']}, Category ID: ${productData['category_id']}, Product Name: ${productData['product_name']}");
                                  // }
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.4,
                                  decoration: BoxDecoration(
                                      color: ColorConstant.lightBlue700,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                      child: Text(
                                    '+',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Table(
                            columnWidths: {
                              0: FixedColumnWidth(
                                  MediaQuery.of(context).size.width *
                                      0.26), // Using 10%
                              1: FixedColumnWidth(
                                  MediaQuery.of(context).size.width *
                                      0.32), // Using 30%
                              2: FixedColumnWidth(
                                  MediaQuery.of(context).size.width *
                                      0.23), // Using 20%
                              3: FixedColumnWidth(
                                  MediaQuery.of(context).size.width * 0.16),
                            },
                            children: [
                              TableRow(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: ColorConstant.bluelite100,
                                ),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Code'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Name'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Qty'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Price'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Expanded(
                        child: ListView.builder(
                      itemCount: productDataList.length,
                      itemBuilder: (context, childIndex) {
                        int count = childIndex + 1;
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Container(
                              child: Table(
                                columnWidths: {
                                  0: FixedColumnWidth(
                                      MediaQuery.of(context).size.width *
                                          0.26), // Using 10%
                                  1: FixedColumnWidth(
                                      MediaQuery.of(context).size.width *
                                          0.32), // Using 30%
                                  2: FixedColumnWidth(
                                      MediaQuery.of(context).size.width *
                                          0.23), // Using 20%
                                  3: FixedColumnWidth(
                                      MediaQuery.of(context).size.width * 0.16),
                                },
                                children: [
                                  // Each TableRow represents a row in the Table
                                  TableRow(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: ColorConstant.bluelite,
                                    ),
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          productDataList[childIndex]
                                              ['product_code'],
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                            productDataList[childIndex]
                                                ['product_name'],
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                            productDataList[childIndex]
                                                    ['quantity']
                                                .toString(),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                            productDataList[childIndex]
                                                    ['amount']
                                                .toString(),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      //]
                    )),
                  ),
                ]),
              ),
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          List orderDetails = productDataList.map(
            (e) {
              return {
                "category_id": "${e['category_id']}",
                "product_id": "${e['product_id']}",
                "quantity": "${e['quantity']}",
                "amount": "${e["amount"]}"
              };
            },
          ).toList();
          // String jsonData =  jsonEncode(orderDetails);
          if (orderDetails.isEmpty) {
            return null;
          } else {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Are you sure?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('No'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (widget.masterId != null) {
                          AddNewDataInOrder addNewDataInOrder =
                              await HttpService.addNewOrderByOrderId(
                                  widget.token,
                                  orderDetails,
                                  widget.masterId,
                                  orderdate,
                                  widget.shopid);
                          setState(() {
                            if (addNewDataInOrder.status == true) {
                              Fluttertoast.showToast(
                                msg: addNewDataInOrder.message,
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.black,
                                textColor: Colors.white,
                              );
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OderDetailsScreen(
                                      oderid: widget.id!, token: widget.token),
                                ),
                              );
                            } else {
                              Fluttertoast.showToast(
                                msg: addNewDataInOrder.message,
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.black,
                                textColor: Colors.white,
                              );
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ShopDetailsPage(
                                        id: widget.token,
                                        shopId: widget.shopid),
                                  ));
                            }
                          });
                        } else {
                          postOder = await HttpService.postOrders(
                              widget.shopid,
                              orderdate,
                              createdate,
                              orderDetails,
                              widget.token);
                          if (postOder != null) {
                            setState(() {
                              if (postOder!.status == true) {
                                Fluttertoast.showToast(
                                  msg: postOder!.message,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  backgroundColor: Colors.black,
                                  textColor: Colors.white,
                                );
                              }
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ShopDetailsPage(
                                        id: widget.token,
                                        shopId: widget.shopid),
                                  ));
                            });
                          }
                        }
                      },
                      child: Text('Yes'),
                    ),
                  ],
                );
              },
            );
          }
        },
        label: Text('Take oder'),
      ),
    );
  }
}
