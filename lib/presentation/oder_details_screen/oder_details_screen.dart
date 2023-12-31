import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jibin_s_application1/core/app_export.dart';
import 'package:jibin_s_application1/presentation/shop_details_page/shop_details_page.dart';
import 'package:jibin_s_application1/presentation/take_order_screen/take_order_screen.dart';
import 'package:jibin_s_application1/services/service.dart';
import '../../model/DeleteOderDetailId_model.dart';
import '../../model/getupdateoderdetail_data_model.dart';
import '../../model/oder_details_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class OderDetailsScreen extends StatefulWidget {
  OderDetailsScreen({
    Key? key,
    required this.oderid,
    required this.token,
  }) : super(key: key);

  String oderid;
  String token;

  @override
  State<OderDetailsScreen> createState() => _OderDetailsScreenState();
}

class _OderDetailsScreenState extends State<OderDetailsScreen> {
  TextEditingController _productController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();

  OderDetailsModel? oderDetailsModel;
  bool dataConnection = false;

  @override
  void initState() {
    super.initState();
    checkConnectiVity();
  }

  oders() async {
    oderDetailsModel =
        await HttpService.orderDetailsByID(widget.oderid, widget.token);
    if (oderDetailsModel != null) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ShopDetailsPage(
              id: widget.token,
              shopId: oderDetailsModel!.data.shopId,
            ),
          ),
        );
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConstant.lightBlue700,
          title: Text('Oder Details'),
          centerTitle: true,
        ),
        body: oderDetailsModel == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      height: 130,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: ColorConstant.lightBlue700,
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: double.maxFinite,
                            width: MediaQuery.of(context).size.width * 0.38,

                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    'Shop Name :',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    'Order Date :',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Text(
                                      'Order Id :',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    'Total Amount :',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    'Created by :',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: double.maxFinite,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 7,
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Text(
                                        oderDetailsModel!.data.shopName,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      oderDetailsModel!.data.orderDate,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Text(
                                        oderDetailsModel!.data.orderId,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Text(
                                        oderDetailsModel!.data.total.toString(),
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Text(
                                        oderDetailsModel!.data.createdBy,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(1),
                            child: Table(
                              columnWidths: {
                                0: FixedColumnWidth(
                                    MediaQuery.of(context).size.width *
                                        0.18), // Using 10%
                                1: FixedColumnWidth(
                                    MediaQuery.of(context).size.width *
                                        0.28), // Using 30%
                                2: FixedColumnWidth(
                                    MediaQuery.of(context).size.width * 0.15),
                                3: FixedColumnWidth(
                                    MediaQuery.of(context).size.width *
                                        0.15), // Using 20%
                                4: FixedColumnWidth(
                                    MediaQuery.of(context).size.width * 0.20),
                              },
                              children: [
                                TableRow(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: ColorConstant.gray300,
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
                                      child: Text('P/P'),
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
                        itemCount: oderDetailsModel!.data.orderDetails.length,
                        itemBuilder: (context, index) {
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Slidable(
                                startActionPane: ActionPane(
                                    motion: DrawerMotion(),
                                    children: [
                                      SlidableAction(
                                        onPressed: (context) {
                                          DeleteoderdetailbyIndex(index);
                                        },
                                        backgroundColor: Color(0xFFFE4A49),
                                        foregroundColor: Colors.white,
                                        icon: Icons.delete,
                                      ),
                                      SlidableAction(
                                        onPressed: (context) async {
                                          GetupdateOderDetail
                                              getupdateOderDetail =
                                              await HttpService
                                                  .getingorderDetailsById(
                                            widget.token,
                                            oderDetailsModel!
                                                .data
                                                .orderDetails[index]
                                                .orderDetailsId,
                                            oderDetailsModel!
                                                .data.orderMasterId,
                                          );
                                          setState(() {
                                            _productController.text =
                                                getupdateOderDetail
                                                    .data.productName;
                                            _quantityController.text =
                                                getupdateOderDetail
                                                    .data.requestedQty;
                                          });
                                          if (oderDetailsModel!
                                                  .data.isEditable ==
                                              true) {
                                            Get.dialog(
                                              AlertDialog(
                                                content: Container(
                                                  width: 300,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      TextFormField(
                                                        enabled: false,
                                                        controller:
                                                            _productController,
                                                        decoration:
                                                            InputDecoration(
                                                                labelText:
                                                                    'Product'),
                                                      ),
                                                      TextFormField(
                                                        controller:
                                                            _quantityController,
                                                        decoration:
                                                            InputDecoration(
                                                                labelText:
                                                                    'Quantity'),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Get.back();
                                                    },
                                                    child: Text('Close'),
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () async {
                                                      int? sellingPrice =
                                                          int.tryParse(
                                                              getupdateOderDetail
                                                                  .data
                                                                  .sellingPrice);
                                                      int quantity = int.tryParse(
                                                              _quantityController
                                                                  .text) ??
                                                          0;
                                                      // print(
                                                      //     'sellingPrice ---- $sellingPrice');
                                                      // print(
                                                      //     'quantity ---- $quantity');

                                                      int total =
                                                          sellingPrice! *
                                                              quantity;
                                                      print(
                                                          'total ----- $total');
                                                      await HttpService
                                                          .editOrderDetailsById(
                                                              widget.token,
                                                              widget.oderid,
                                                              getupdateOderDetail
                                                                  .data
                                                                  .orderDetailId,
                                                              getupdateOderDetail
                                                                  .data
                                                                  .categoryId,
                                                              getupdateOderDetail
                                                                  .data
                                                                  .productId,
                                                              quantity
                                                                  .toString(),
                                                              total.toString());
                                                      Get.back();
                                                      oders();
                                                    },
                                                    child: Text('Update'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          } else {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  content: Text(
                                                      'You Cannot Delete this'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Get.back();
                                                      },
                                                      child: Text('Close'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          }
                                        },
                                        backgroundColor: Color(0xFF21B7CA),
                                        foregroundColor: Colors.white,
                                        icon: Icons.edit,
                                      ),
                                    ]),
                                child: Container(
                                  child: Table(
                                    columnWidths: {
                                      0: FixedColumnWidth(
                                          MediaQuery.of(context).size.width *
                                              0.18), // Using 10%
                                      1: FixedColumnWidth(
                                          MediaQuery.of(context).size.width *
                                              0.28), // Using 30%
                                      2: FixedColumnWidth(
                                          MediaQuery.of(context).size.width *
                                              0.15),
                                      3: FixedColumnWidth(
                                          MediaQuery.of(context).size.width *
                                              0.15), // Using 20%
                                      4: FixedColumnWidth(
                                          MediaQuery.of(context).size.width *
                                              0.20),
                                    },
                                    children: [
                                      // Each TableRow represents a row in the Table
                                      TableRow(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: ColorConstant.gray100,
                                        ),
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              oderDetailsModel!
                                                  .data
                                                  .orderDetails[index]
                                                  .productCode,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                                oderDetailsModel!
                                                    .data
                                                    .orderDetails[index]
                                                    .productName,
                                                maxLines: 2,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                                oderDetailsModel!
                                                    .data
                                                    .orderDetails[index]
                                                    .quantity,
                                                maxLines: 2,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                                oderDetailsModel!
                                                    .data
                                                    .orderDetails[index]
                                                    .sellingPrice,
                                                maxLines: 2,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                                oderDetailsModel!.data
                                                    .orderDetails[index].price
                                                    .toString(),
                                                maxLines: 2,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        //]
                      )),
                    ),
                  ],
                ),
              ),
        floatingActionButton: FloatingActionButton.extended(
          label: Text('Add More items'),
          onPressed: () {
            if (oderDetailsModel!.data.isEditable == true) {
              String masterId = oderDetailsModel!.data.orderMasterId;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TakeOderScreen(
                      shopid: oderDetailsModel!.data.shopId,
                      token: widget.token,
                      masterId: masterId,
                      id: widget.oderid,
                    ),
                  ));
            } else {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text('You Cannot update this order'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text('Close'),
                      ),
                    ],
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  DeleteoderdetailbyIndex(index) async {
    if (oderDetailsModel!.data.isEditable == true) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('Are you sure to delete?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('NO'),
              ),
              ElevatedButton(
                  onPressed: () async {
                    DeleteOderDetailId deleteOderDetailId =
                        await HttpService.deleteorderDetailsById(
                      widget.token,
                      oderDetailsModel!.data.orderDetails[index].orderDetailsId,
                      oderDetailsModel!.data.orderMasterId,
                    );
                    if (deleteOderDetailId.status == true) {
                      Fluttertoast.showToast(
                        msg: deleteOderDetailId.message,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                      );
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OderDetailsScreen(
                              oderid: widget.oderid, token: widget.token),
                        ),
                        (route) => false,
                      );
                    }
                  },
                  child: Text('Yes'))
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('You Cannot Delete this'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Close'),
              ),
            ],
          );
        },
      );
    }
  }

  checkConnectiVity() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      dataConnection = true;
      if (dataConnection == true) {
        setState(() {
          oders();
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
