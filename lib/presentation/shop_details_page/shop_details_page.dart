import 'package:custom_switch_widget/custom_switch_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:jibin_s_application1/model/shop_details_model.dart';
import 'package:jibin_s_application1/presentation/add_collection_screen/add_collection_screen.dart';
import 'package:jibin_s_application1/presentation/invoice_details_screen/invoice_details_screen.dart';
import 'package:jibin_s_application1/presentation/shop_editing_screen/shop_editing_screen.dart';
import 'package:jibin_s_application1/services/service.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../model/add_comment_model.dart';
import '../../model/dashboard_model.dart';
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
  MarkVisit? markVisit;
  String whatsappurl = "https://wa.me/91";

  var tabbarController;
  ShopDetails? shopDetails;

  String fdate = DateFormat('dd-MM-yyyy').format(DateTime.now());
  String tdate = DateFormat('dd-MM-yyyy').format(DateTime.now());

  TextEditingController _commentController = TextEditingController();

  final CustomSwitchController _switchcontroller =
      CustomSwitchController(initialValue: false);

  void _enable() async {
    _switchcontroller.enable();

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    } else {}
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    double latitudes = position.latitude;
    double longitudes = position.longitude;

    var latitude = latitudes.toString();
    var longitude = longitudes.toString();
    print(latitude);
    print(longitude);

    markVisit = await HttpService.markVisit(
        widget.shopId, latitude, longitude, widget.id);
    if (markVisit!.status == true) {
      Fluttertoast.showToast(
        msg: markVisit!.message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
    } else {}
  }

  void _disable() async {
    _switchcontroller.disable();
  }

  @override
  void initState() {
    tabbarController = TabController(length: 3, vsync: this);
    shopDetailingScreen();
    super.initState();
  }

  shopDetailingScreen() async {
    // print('shop id ---- ${widget.shopId}');
    // print('shop id ---- ${widget.id}');
    // print('fdate ---- ${fdate}');
    // print('fdate ---- ${tdate}');
    shopDetails =
        await HttpService.shopDetails(widget.shopId, widget.id, fdate, tdate);
    if (shopDetails != null) {
      setState(() {});
    }
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
          IconButton(
              onPressed: () {
                deletePopup();
              },
              icon: Icon(Icons.delete))
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
          : Column(
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
                  padding: const EdgeInsets.all(12.0),
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
                                    borderRadius: BorderRadius.circular(50),
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
                                width: MediaQuery.of(context).size.width * 0.40,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(1.0),
                                        child: Text(
                                          shopDetails!.data.shopName,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: AppStyle
                                              .txtDMSansRegular18WhiteA700,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(1.0),
                                        child: Text(
                                          shopDetails!.data.address,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: AppStyle
                                              .txtDMSansRegular18WhiteA702,
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.width * 0.33,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  // color: Colors.yellow
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () async {
                                        var whatsapp =
                                            shopDetails!.data.whatsappNumber;
                                        await launch(whatsappurl + whatsapp);
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
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder12),
                                        child: Stack(
                                          children: [
                                            CustomImageView(
                                                imagePath:
                                                    ImageConstant.imgWhatsapp31,
                                                height: getSize(25),
                                                width: getSize(25),
                                                alignment: Alignment.topCenter),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
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
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder12),
                                        child: Stack(
                                          children: [
                                            CustomImageView(
                                                imagePath: ImageConstant
                                                    .imgRectangle23x23,
                                                height: getSize(23),
                                                width: getSize(23),
                                                alignment: Alignment.topCenter)
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  padding: const EdgeInsets.only(right: 10),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              AddCollectionScreen(
                                                  id: widget.id,
                                                  shopId: widget.shopId),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.9,
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
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [Text('Collection +')],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.32,
                              height: MediaQuery.of(context).size.height * 0.05,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
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
                                      style:
                                          AppStyle.txtDMSansRegular18WhiteA702,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.19,
                              height: MediaQuery.of(context).size.height * 0.05,
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
                              width: MediaQuery.of(context).size.width * 0.32,
                              height: MediaQuery.of(context).size.height * 0.08,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                TakeOderScreen(
                                              id: widget.shopId,
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
                                    child: Text('Take oder'),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  fdate.toString(),
                                ),
                              ),
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
                                  child: Icon(
                                    Icons.calendar_month,
                                    color: Colors.white,
                                  ),
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: ColorConstant.lightBlue700,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  tdate.toString(),
                                ),
                              ),
                              GestureDetector(
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
                                      tdate = DateFormat('dd-MM-yyyy')
                                          .format(toDateselectTemp);
                                      shopDetailingScreen();
                                    });
                                  }
                                },
                                child: Container(
                                  child: Icon(
                                    Icons.calendar_month,
                                    color: Colors.white,
                                  ),
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: ColorConstant.lightBlue700,
                                  ),
                                ),
                              )
                            ],
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
                      text: 'Payment Details',
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabbarController,
                    children: [
                      //// -----------------------------------tab bars here 1 oder details-----------------
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ListView.builder(
                            itemCount: shopDetails!.data.orderDetails.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(top: 5, bottom: 5),
                                child: GestureDetector(
                                  onTap: () {
                                    shopDetails!.data.orderDetails[index].status == "Waiting for Invoice" ?
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => OderDetailsScreen(
                                            oderid: shopDetails!
                                                .data.orderDetails[index].id
                                                .toString(),
                                            token: widget.id),
                                      ),
                                    ):
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            InvoiceDetailsScreen(
                                                oderid: shopDetails!.data
                                                    .invoiceDetails[index].id
                                                    .toString(),
                                                token: widget.id),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xFFDEF3FF),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                        )
                                      ],
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(right: 7),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.07,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.14,
                                            child: Container(
                                              child: Icon(
                                                Icons.shopping_cart,
                                                color: Colors.white,
                                                size: 30,
                                              ),
                                              decoration: BoxDecoration(
                                                  color: ColorConstant
                                                      .lightBlue700,
                                                  borderRadius:
                                                      BorderRadius.circular(
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
                                                        Text('Order ID : '),
                                                        Text(
                                                          shopDetails!
                                                              .data
                                                              .orderDetails[
                                                                  index]
                                                              .invoiceNo,
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    255,
                                                                    223,
                                                                    220),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Text(
                                                                shopDetails!
                                                                    .data
                                                                    .orderDetails[
                                                                        index]
                                                                    .status!),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 8,
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
                                                        Text('Date : '),
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
                                                    Row(
                                                      children: [
                                                        Text('Created by: '),
                                                        Text(
                                                          shopDetails!
                                                              .data
                                                              .orderDetails[
                                                                  index]
                                                              .createdBy,
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          '₹',
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                          ),
                                                        ),
                                                        Text(
                                                          shopDetails!
                                                              .data
                                                              .orderDetails[
                                                                  index]
                                                              .price
                                                              .toString(),
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 20,
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
                      //// -----------------------------------tab bars here 2 invoice details-----------------
                      Container(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ListView.builder(
                              itemCount:
                                  shopDetails!.data.invoiceDetails.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, bottom: 5),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              InvoiceDetailsScreen(
                                                  oderid: shopDetails!.data
                                                      .invoiceDetails[index].id
                                                      .toString(),
                                                  token: widget.id),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color(0xFFDEF3FF),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black26,
                                          )
                                        ],
                                      ),
                                      width: MediaQuery.of(context).size.width,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(right: 7),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.07,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.14,
                                              child: Container(
                                                child: Icon(
                                                  Icons.shopping_cart,
                                                  color: Colors.white,
                                                  size: 30,
                                                ),
                                                decoration: BoxDecoration(
                                                    color: ColorConstant
                                                        .lightBlue700,
                                                    borderRadius:
                                                        BorderRadius.circular(
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
                                                          Text('Invoice ID : '),
                                                          Text(
                                                            shopDetails!
                                                                .data
                                                                .invoiceDetails[
                                                                    index]
                                                                .invoiceNo,
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
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
                                                          Text('Date : '),
                                                          Text(
                                                            shopDetails!
                                                                .data
                                                                .invoiceDetails[
                                                                    index]
                                                                .orderDate,
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
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
                                                          Text('Created by :'),
                                                          Text(
                                                            shopDetails!
                                                                .data
                                                                .invoiceDetails[
                                                                    index]
                                                                .createdBy,
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            '₹',
                                                            style: TextStyle(
                                                              fontSize: 18,
                                                            ),
                                                          ),
                                                          Text(
                                                            shopDetails!
                                                                .data
                                                                .invoiceDetails[
                                                                    index]
                                                                .price
                                                                .toString(),
                                                            style: TextStyle(
                                                              fontSize: 18,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 20,
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
                      //// -----------------------------------tab bars here 3 payment details-----------------
                      Container(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ListView.builder(
                              itemCount:
                                  shopDetails!.data.paymentDetails.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, bottom: 5),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xFFDEF3FF),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                        )
                                      ],
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(right: 7),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.07,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.14,
                                            child: Container(
                                              child: Icon(
                                                Icons.shopping_cart,
                                                color: Colors.white,
                                                size: 30,
                                              ),
                                              decoration: BoxDecoration(
                                                  color: ColorConstant
                                                      .lightBlue700,
                                                  borderRadius:
                                                      BorderRadius.circular(
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
                                                        Text('Date : '),
                                                        Text(
                                                          shopDetails!
                                                              .data
                                                              .paymentDetails[
                                                                  index]
                                                              .createdAt,
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
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
                                                        Text('Payment by : '),
                                                        Text(
                                                          shopDetails!
                                                              .data
                                                              .paymentDetails[
                                                                  index]
                                                              .paymentType,
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
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
                                                        Text('Created by :'),
                                                        Text(
                                                          shopDetails!
                                                              .data
                                                              .paymentDetails[
                                                                  index]
                                                              .createdBy,
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          '₹',
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                          ),
                                                        ),
                                                        Text(
                                                          shopDetails!
                                                              .data
                                                              .paymentDetails[
                                                                  index]
                                                              .paidAmount
                                                              .toString(),
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 20,
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
                                );
                              }),
                        ),
                      ),
                    ],
                  ),
                )
              ],
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
}
