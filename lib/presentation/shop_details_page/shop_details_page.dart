import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:custom_switch_widget/custom_switch_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:jibin_s_application1/model/shop_details_model.dart';
import 'package:jibin_s_application1/presentation/add_collection_screen/add_collection_from_shop.dart';
import 'package:jibin_s_application1/presentation/invoice_details_screen/invoice_details_screen.dart';
import 'package:jibin_s_application1/presentation/payment_editing_screen/payment_editing_screen.dart';
import 'package:jibin_s_application1/presentation/shop_editing_screen/shop_editing_screen.dart';
import 'package:jibin_s_application1/services/service.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../model/add_comment_model.dart';
import '../../model/delete_order_model.dart';
import '../../model/delete_payment_model.dart';
import '../../model/delete_shop_model.dart';
import '../../model/mark_visit_model.dart';
import '../../theme/app_decoration.dart';
import '../../theme/app_style.dart';
import '../../widgets/custom_image_view.dart';
import '../bottom_navigation_page/bottom_navigation.dart';
import '../oder_details_screen/oder_details_screen.dart';
import '../take_order_screen/take_order_screen.dart';

class ShopDetailsPage extends StatefulWidget {
  ShopDetailsPage({Key? key, required this.id, required this.shopId})
      : super(key: key);
  String id;
  String shopId;

  @override
  State<ShopDetailsPage> createState() => _ShopDetailsPageState();
}

class _ShopDetailsPageState extends State<ShopDetailsPage>
    with SingleTickerProviderStateMixin {
  bool isLoading = false;
  MarkVisit? markVisit;
  String whatsappurl = "https://wa.me/91";

  var tabbarController;

  ShopDetails? shopDetails;
  bool dataConnection = false;
  bool canMark = false;

  String fdate = DateFormat('dd-MM-yyyy').format(DateTime.now());
  String tdate = DateFormat('dd-MM-yyyy').format(DateTime.now());

  TextEditingController _commentController = TextEditingController();

  final CustomSwitchController _switchcontroller =
      CustomSwitchController(initialValue: false);

  void _enable() async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text('Are you sure?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),
            ElevatedButton(
                onPressed: () async {
                  Navigator.pop(context);
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

                  String latitude = latitudes.toString();
                  String longitude = longitudes.toString();
                  print(latitude);
                  print(longitude);
                  print(shopDetails!.data.latitude);
                  print(shopDetails!.data.longitude);
                  double targetLatitude =
                      double.parse(shopDetails!.data.latitude);
                  double targetLongitude =
                      double.parse(shopDetails!.data.longitude);
                  checkLocationRadius(targetLatitude, targetLongitude,
                      double.parse(latitude), double.parse(longitude));
                  if (canMark == true) {
                    markVisit = await HttpService.markVisit(
                        widget.shopId, latitude, longitude, widget.id);
                    if (markVisit!.status == true) {
                      print('truwwww');
                     setState(() {
                       isLoading =  false ;
                       _switchcontroller.enable();
                       Fluttertoast.showToast(
                         msg: markVisit!.message,
                         toastLength: Toast.LENGTH_SHORT,
                         gravity: ToastGravity.BOTTOM,
                         backgroundColor: Colors.black,
                         textColor: Colors.white,
                                                );
                     });
                    } else {
                      setState(() {

                      });
                    }
                  } else {
                    setState(() {
                      Fluttertoast.showToast(
                        msg:
                            "You are out side 20 meters from shop , please verify",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,

                      );
                      Navigator.pop(context);
                    });
                  }
                },
                child: Text("Yes I'am here"))
          ],
        );
      },
    );
  }

  void _disable() async {
    _switchcontroller.disable();
  }

  @override
  void initState() {
    tabbarController = TabController(length: 3, vsync: this);
    checkConnectiVity();
    super.initState();
  }

  shopDetailingScreen() async {
    print('shop id ---- ${widget.shopId}');
    print('shop id ---- ${widget.id}');
    print('fdate ---- ${fdate}');
    print('fdate ---- ${tdate}');
    shopDetails =
        await HttpService.shopDetails(widget.shopId, widget.id, fdate, tdate);
    print(shopDetails!.data);
    if (shopDetails != null) {
      setState(() {});
    }
  }

  Future<void> _onRefresh() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      shopDetailingScreen();
    });
  }

  checkLocationRadius(double targetLatitude, double targetLongitude,
      double latitude, double longitude) {
    double distance = Geolocator.distanceBetween(
      targetLatitude,
      targetLongitude,
      latitude,
      longitude,
    );
    if (distance <= 20) {
      canMark = true;
    } else {} // Check if the distance is within the 20-meter radius
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShopEditingScreen(
                    token: widget.id,
                    shopId: widget.shopId,
                  ),
                ),
              );
            },
          ),
          // IconButton(
          //     onPressed: () {
          //       deletePopup();
          //     },
          //     icon: Icon(Icons.delete))
        ],
        backgroundColor: ColorConstant.lightBlue700,
        centerTitle: true,
        title: Text('Shop Deatils'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => BottomNavigationScreen(id: widget.id),
              ),
            );
          },
        ),
      ),
      body: shopDetails == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: _onRefresh,
              child: Stack(
                children: <Widget>[
                  ListView(),
                  WillPopScope(
                    onWillPop: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                BottomNavigationScreen(id: widget.id)),
                      );
                      return true; // Allow the pop action
                    },
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Mark Visit'),
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: ColorConstant.lightBlue700,
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        // color: Colors.green,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: ColorConstant.whiteA700,
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          child: Icon(
                                            Icons.person,
                                            size: 35,
                                            color: ColorConstant.gray300,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.40,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(1.0),
                                                child: Text(
                                                  shopDetails!.data.shopName,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: AppStyle
                                                      .txtDMSansRegular18WhiteA700,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(1.0),
                                                child: Text(
                                                  shopDetails!.data.address,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: AppStyle
                                                      .txtDMSansRegular18WhiteA702,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.33,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          // color: Colors.yellow
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            GestureDetector(
                                              onTap: () async {
                                                var whatsapp = shopDetails!
                                                    .data.whatsappNumber;
                                                await launch(
                                                    whatsappurl + whatsapp);
                                              },
                                              child: Container(
                                                height: getVerticalSize(42),
                                                width: getHorizontalSize(61),
                                                padding: getPadding(
                                                    left: 18,
                                                    top: 8,
                                                    right: 18,
                                                    bottom: 8),
                                                decoration: AppDecoration
                                                    .outlineBlack9003f
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder12),
                                                child: Stack(
                                                  children: [
                                                    CustomImageView(
                                                        imagePath: ImageConstant
                                                            .imgWhatsapp31,
                                                        height: getSize(25),
                                                        width: getSize(25),
                                                        alignment: Alignment
                                                            .topCenter),
                                                  ],
                                                ),
                                              ),
                                            ),

                                            GestureDetector(
                                              onTap: () async {
                                                await launch(
                                                    "tel:/${shopDetails!.data.phoneNumber}");
                                              },
                                              child: Container(
                                                height: getVerticalSize(42),
                                                width: getHorizontalSize(61),
                                                padding: getPadding(
                                                    left: 19,
                                                    top: 9,
                                                    right: 19,
                                                    bottom: 9),
                                                decoration: AppDecoration
                                                    .outlineBlack9003f
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder12),
                                                child: Stack(
                                                  children: [
                                                    CustomImageView(
                                                        imagePath: ImageConstant
                                                            .imgRectangle23x23,
                                                        height: getSize(23),
                                                        width: getSize(23),
                                                        alignment:
                                                            Alignment.topCenter)
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 40,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      'GST NO : ',
                                                      style: AppStyle
                                                          .txtDMSansRegular18WhiteA702,
                                                    ),
                                                    Text(
                                                      shopDetails!.data.gstNo,
                                                      style: AppStyle
                                                          .txtDMSansRegular18WhiteA702,
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Balance : ',
                                                      style: AppStyle
                                                          .txtDMSansRegular18WhiteA700,
                                                    ),
                                                    Text(
                                                      shopDetails!.data.balance
                                                          .toString(),
                                                      style: AppStyle
                                                          .txtDMSansRegular18WhiteA700,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        AddcollectionFromShop(
                                                            id: widget.id,
                                                            shopId:
                                                                widget.shopId,
                                                            shopName:
                                                                shopDetails!
                                                                    .data
                                                                    .shopName),
                                                  ));
                                            },
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.9,
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: ColorConstant
                                                          .black9003f,
                                                      spreadRadius:
                                                          getHorizontalSize(
                                                        1,
                                                      ),
                                                      blurRadius:
                                                          getHorizontalSize(
                                                        1,
                                                      ),
                                                      offset: Offset(
                                                        0,
                                                        2,
                                                      ),
                                                    ),
                                                  ],
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text('Collection +')
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width *
                                            0.32,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.calendar_month,
                                                color: ColorConstant.whiteA700,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                shopDetails!.data.createdAt,
                                                style: AppStyle
                                                    .txtDMSansRegular18WhiteA702,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width *
                                            0.19,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        child: GestureDetector(
                                          onTap: _showPopupTextField,
                                          child: Icon(
                                            Icons.comment_outlined,
                                            size: 32,
                                            color: ColorConstant.whiteA700,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width *
                                            0.32,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.08,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          TakeOderScreen(
                                                        shopid: widget.shopId,
                                                        token: widget.id,
                                                      ),
                                                    ));
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.green,
                                                // Set the background color of the button
                                                padding: EdgeInsets.only(
                                                    left: 22,
                                                    right: 22,
                                                    top: 5,
                                                    bottom: 5),
                                                // Set the padding of the button
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(
                                                      8.0), // Set the border radius of the button
                                                ),
                                              ),
                                              child: Text('Take order'),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 3),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    final selctedDatetimetemp =
                                        await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2100),
                                    );
                                    if (selctedDatetimetemp == null) {
                                      return;
                                    } else {
                                      setState(() {
                                        fdate = DateFormat('dd-MM-yyyy')
                                            .format(selctedDatetimetemp);
                                        print(fdate);
                                        shopDetailingScreen();
                                      });
                                    }
                                  },
                                  child: Container(
                                    width: 150,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: ColorConstant.black9003f,
                                          spreadRadius: getHorizontalSize(
                                            1,
                                          ),
                                          blurRadius: getHorizontalSize(
                                            1,
                                          ),
                                          offset: Offset(
                                            0,
                                            2,
                                          ),
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(10),
                                      color: ColorConstant.gray50,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Text(
                                            fdate.toString(),
                                          ),
                                        ),
                                        Container(
                                          child: Icon(
                                            Icons.calendar_month,
                                            color: Colors.white,
                                          ),
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: ColorConstant.lightBlue700,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
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
                                        tdate = DateFormat('dd-MM-yyyy')
                                            .format(toDateselectTemp);
                                        shopDetailingScreen();
                                      });
                                    }
                                  },
                                  child: Container(
                                    width: 150,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: ColorConstant.black9003f,
                                          spreadRadius: getHorizontalSize(
                                            1,
                                          ),
                                          blurRadius: getHorizontalSize(
                                            1,
                                          ),
                                          offset: Offset(
                                            0,
                                            2,
                                          ),
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(10),
                                      color: ColorConstant.gray50,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Text(
                                            tdate.toString(),
                                          ),
                                        ),
                                        Container(
                                          child: Icon(
                                            Icons.calendar_month,
                                            color: Colors.white,
                                          ),
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: ColorConstant.lightBlue700,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        TabBar(
                          labelColor: Colors.blue,
                          unselectedLabelColor: Colors.grey,
                          controller: tabbarController,
                          tabs: [
                            Tab(
                              text: 'Order Details',
                            ),
                            Tab(
                              text: 'Invoice Details',
                            ),
                            Tab(
                              text: 'Payments',
                            ),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: tabbarController,
                            children: [
                              //// -----------------------------------tab bars here 1 order details-----------------
                              SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8, left: 8),
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Text('Total Oder Amount : '),
                                            Text(shopDetails!.data.orderTotal
                                                .toString()),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: ListView.builder(
                                          physics: ScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: shopDetails!
                                              .data.orderDetails.length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 5, bottom: 5),
                                              child: Slidable(
                                                key: const ValueKey(0),
                                                startActionPane: ActionPane(
                                                    motion: DrawerMotion(),
                                                    children: [
                                                      SlidableAction(
                                                        onPressed: (context) {
                                                          if (shopDetails!
                                                                  .data
                                                                  .orderDetails[
                                                                      index]
                                                                  .isEdit ==
                                                              true) {
                                                            deleteorderData(
                                                                index);
                                                          } else {
                                                            showDialog(
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return AlertDialog(
                                                                  content: Text(
                                                                      'Cannot delete this Order'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child: Text(
                                                                          'Close'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                          }
                                                        },
                                                        backgroundColor:
                                                            Color(0xFFFE4A49),
                                                        foregroundColor:
                                                            Colors.white,
                                                        icon: Icons.delete,
                                                        label: 'Delete',
                                                      ),
                                                    ]),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    shopDetails!
                                                                .data
                                                                .orderDetails[
                                                                    index]
                                                                .status ==
                                                            "Order Pending"
                                                        ? Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  OderDetailsScreen(
                                                                oderid: shopDetails!
                                                                    .data
                                                                    .orderDetails[
                                                                        index]
                                                                    .id
                                                                    .toString(),
                                                                token:
                                                                    widget.id,
                                                              ),
                                                            ),
                                                          )
                                                        : Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) => InvoiceDetailsScreen(
                                                                  oderid: shopDetails!
                                                                      .data
                                                                      .orderDetails[
                                                                          index]
                                                                      .id
                                                                      .toString(),
                                                                  token: widget
                                                                      .id),
                                                            ),
                                                          );
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Color(0xFFDEF3FF),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.black26,
                                                        )
                                                      ],
                                                    ),
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    right: 7),
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.07,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.14,
                                                            child: Container(
                                                              child: Icon(
                                                                Icons
                                                                    .shopping_cart,
                                                                color: Colors
                                                                    .white,
                                                                size: 30,
                                                              ),
                                                              decoration: BoxDecoration(
                                                                  color: ColorConstant
                                                                      .lightBlue700,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              38)),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Column(
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Container(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          0.36,
                                                                      child:
                                                                          SingleChildScrollView(
                                                                        scrollDirection:
                                                                            Axis.horizontal,
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Text(
                                                                              'Order ID: ',
                                                                            ),
                                                                            SingleChildScrollView(
                                                                              scrollDirection: Axis.horizontal,
                                                                              child: Text(
                                                                                shopDetails!.data.orderDetails[index].invoiceNo,
                                                                                maxLines: 2,
                                                                                overflow: TextOverflow.ellipsis,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                255,
                                                                                223,
                                                                                220),
                                                                            borderRadius:
                                                                                BorderRadius.circular(5),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(6.0),
                                                                            child:
                                                                                SingleChildScrollView(
                                                                              scrollDirection: Axis.horizontal,
                                                                              child: Text(shopDetails!.data.orderDetails[index].status!),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              3,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Text(
                                                                            'Date : '),
                                                                        Text(shopDetails!
                                                                            .data
                                                                            .orderDetails[index]
                                                                            .orderDate),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 5,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Container(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          0.36,
                                                                      child:
                                                                          SingleChildScrollView(
                                                                        scrollDirection:
                                                                            Axis.horizontal,
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Text('Created by: '),
                                                                            Text(
                                                                              shopDetails!.data.orderDetails[index].createdBy,
                                                                              maxLines: 2,
                                                                              overflow: TextOverflow.ellipsis,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        Text(
                                                                          '₹',
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                18,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          shopDetails!
                                                                              .data
                                                                              .orderDetails[index]
                                                                              .price
                                                                              .toString(),
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                18,
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              20,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
                                  ],
                                ),
                              ),
                              //// -----------------------------------tab bars here 2 invoice details-----------------
                              SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8, left: 8),
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Text('Total Oder Amount : '),
                                            Text(shopDetails!.data.invoiceTotal
                                                .toString()),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: ListView.builder(
                                            physics: ScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: shopDetails!
                                                .data.invoiceDetails.length,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5, bottom: 5),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            InvoiceDetailsScreen(
                                                                oderid: shopDetails!
                                                                    .data
                                                                    .invoiceDetails[
                                                                        index]
                                                                    .id
                                                                    .toString(),
                                                                token:
                                                                    widget.id),
                                                      ),
                                                    );
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Color(0xFFDEF3FF),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.black26,
                                                        )
                                                      ],
                                                    ),
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    right: 7),
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.07,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.14,
                                                            child: Container(
                                                              child: Icon(
                                                                Icons
                                                                    .shopping_cart,
                                                                color: Colors
                                                                    .white,
                                                                size: 30,
                                                              ),
                                                              decoration: BoxDecoration(
                                                                  color: ColorConstant
                                                                      .lightBlue700,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              38)),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Column(
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Text(
                                                                            'Invoice ID : '),
                                                                        Text(
                                                                          shopDetails!
                                                                              .data
                                                                              .invoiceDetails[index]
                                                                              .invoiceNo,
                                                                          maxLines:
                                                                              2,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 7,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Text(
                                                                            'Date : '),
                                                                        Text(
                                                                          shopDetails!
                                                                              .data
                                                                              .invoiceDetails[index]
                                                                              .orderDate,
                                                                          maxLines:
                                                                              2,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 5,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Text(
                                                                            'Created by : '),
                                                                        Text(
                                                                          shopDetails!
                                                                              .data
                                                                              .invoiceDetails[index]
                                                                              .createdBy,
                                                                          maxLines:
                                                                              2,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        Text(
                                                                          '₹',
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                18,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          shopDetails!
                                                                              .data
                                                                              .invoiceDetails[index]
                                                                              .price
                                                                              .toString(),
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                18,
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              20,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //// -----------------------------------tab bars here 3 payment details-----------------
                              SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, top: 8),
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Text('Total Payment Amount : '),
                                            Text(
                                              shopDetails!.data.paymentTotal
                                                  .toString(),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            physics: ScrollPhysics(),
                                            itemCount: shopDetails!
                                                .data.paymentDetails.length,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5, bottom: 5),
                                                child: Slidable(
                                                  key: const ValueKey(0),
                                                  startActionPane: ActionPane(
                                                      motion: DrawerMotion(),
                                                      children: [
                                                        SlidableAction(
                                                          onPressed: (context) {
                                                            if (shopDetails!
                                                                    .data
                                                                    .paymentDetails[
                                                                        index]
                                                                    .isEdit ==
                                                                true) {
                                                              onDelete(index);
                                                            } else {
                                                              showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return AlertDialog(
                                                                    content: Text(
                                                                        'Cannot delete this Payment'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                        child: Text(
                                                                            'Close'),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              );
                                                            }
                                                          },
                                                          backgroundColor:
                                                              Color(0xFFFE4A49),
                                                          foregroundColor:
                                                              Colors.white,
                                                          icon: Icons.delete,
                                                          label: 'Delete',
                                                        ),
                                                        SlidableAction(
                                                          onPressed: (context) {
                                                            shopDetails!
                                                                        .data
                                                                        .paymentDetails[
                                                                            index]
                                                                        .isEdit ==
                                                                    true
                                                                ? Navigator
                                                                    .push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              PaymentEditingScreen(
                                                                        id: widget
                                                                            .id,
                                                                        paymentId: shopDetails!
                                                                            .data
                                                                            .paymentDetails[index]
                                                                            .paymentId,
                                                                      ),
                                                                    ),
                                                                  )
                                                                : showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return AlertDialog(
                                                                        content:
                                                                            Text('Cannot Edit this Payment'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed:
                                                                                () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child:
                                                                                Text('Close'),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  );
                                                          },
                                                          backgroundColor:
                                                              Color(0xFF21B7CA),
                                                          foregroundColor:
                                                              Colors.white,
                                                          icon: Icons.edit,
                                                          label: 'Edit',
                                                        ),
                                                      ]),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Color(0xFFDEF3FF),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.black26,
                                                        )
                                                      ],
                                                    ),
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    right: 7),
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.07,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.14,
                                                            child: Container(
                                                              child: Icon(
                                                                Icons
                                                                    .shopping_cart,
                                                                color: Colors
                                                                    .white,
                                                                size: 30,
                                                              ),
                                                              decoration: BoxDecoration(
                                                                  color: ColorConstant
                                                                      .lightBlue700,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              38)),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Column(
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Text(
                                                                            'Date : '),
                                                                        Text(
                                                                          shopDetails!
                                                                              .data
                                                                              .paymentDetails[index]
                                                                              .createdAt,
                                                                          maxLines:
                                                                              2,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 7,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Text(
                                                                            'Payment by : '),
                                                                        Text(
                                                                          shopDetails!
                                                                              .data
                                                                              .paymentDetails[index]
                                                                              .paymentType,
                                                                          maxLines:
                                                                              2,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 5,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Text(
                                                                            'Created by :'),
                                                                        Text(
                                                                          shopDetails!
                                                                              .data
                                                                              .paymentDetails[index]
                                                                              .createdBy,
                                                                          maxLines:
                                                                              2,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        Text(
                                                                          '₹',
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                18,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          shopDetails!
                                                                              .data
                                                                              .paymentDetails[index]
                                                                              .paidAmount
                                                                              .toString(),
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                18,
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              20,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  void _showPopupTextField() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Enter Comment'),
          content: TextFormField(
            controller: _commentController,
            decoration: InputDecoration(hintText: 'Type here...'),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Close')),
            ElevatedButton(
              onPressed: () async {
                var comment = _commentController.text;
                AddComment addComment = await HttpService.addShopComments(
                    widget.id, widget.shopId, comment);
                setState(() {
                  _commentController.text = '';
                  Fluttertoast.showToast(
                    msg: addComment!.message,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.black,
                    textColor: Colors.white,
                  );
                });
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Add Comment'),
            ),
          ],
        );
      },
    );
  }

  deletePopup() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Are you sure to Delete this Shop?'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('No')),
            ElevatedButton(
              onPressed: () {
                shopDelete();
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  onDelete(index) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          scrollable: true,
          content: Text('Are you Sure to Delete?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('No'),
            ),
            ElevatedButton(
                onPressed: () async {
                  DeletePayment deletePayment = await HttpService.deletePayment(
                      widget.id,
                      shopDetails!.data.paymentDetails[index].paymentId);
                  setState(() {
                    if (deletePayment.status == true) {
                      Fluttertoast.showToast(
                        msg: deletePayment.message,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                      );
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ShopDetailsPage(
                                id: widget.id, shopId: widget.shopId),
                          ));
                    }
                  });
                },
                child: Text('Yes Delete'))
          ],
        );
      },
    );
  }

  deleteorderData(index) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          scrollable: true,
          content: Text('Are you Sure to Delete?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('No'),
            ),
            ElevatedButton(
                onPressed: () async {
                  DeleteOrder deleteOrder = await HttpService.deleteOrder(
                      widget.id,
                      shopDetails!.data.orderDetails[index].id.toString());
                  setState(() {
                    if (deleteOrder.status == true) {
                      Fluttertoast.showToast(
                        msg: deleteOrder.message,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                      );
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ShopDetailsPage(
                                id: widget.id, shopId: widget.shopId),
                          ));
                    }
                  });
                },
                child: Text('Yes Delete'))
          ],
        );
      },
    );
  }

  shopDelete() async {
    DeleteShop deleteShop =
        await HttpService.deleteShop(widget.id, widget.shopId);
    if (deleteShop.status == true) {
      Fluttertoast.showToast(
        msg: deleteShop!.message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BottomNavigationScreen(id: widget.id),
        ),
      );
    } else {
      print('Not deleted');
    }
  }

  checkConnectiVity() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      dataConnection = true;
      if (dataConnection == true) {
        setState(() {
          shopDetailingScreen();
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
