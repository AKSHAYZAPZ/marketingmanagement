import 'package:custom_switch_widget/custom_switch_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:jibin_s_application1/core/app_export.dart';
import 'package:jibin_s_application1/model/attendance_model.dart';
import 'package:jibin_s_application1/presentation/add_shop_screen/add_shop_screen.dart';
import 'package:jibin_s_application1/presentation/collection_screen/collection_screen.dart';
import 'package:jibin_s_application1/presentation/shop_details_page/shop_details_page.dart';
import 'package:jibin_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:jibin_s_application1/widgets/custom_icon_button.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../model/dashboard_model.dart';
import '../../model/routemodel.dart';
import '../../services/service.dart';
import '../../shared_prefrence/shared_preference.dart';
import '../product_screen/product_screen.dart';

class HomeDashboardScreen extends StatefulWidget {
  HomeDashboardScreen({
    Key? key,
    required this.id,
  }) : super(key: key);
  String id;

  @override
  State<HomeDashboardScreen> createState() => _HomeDashboardScreenState();
}

class _HomeDashboardScreenState extends State<HomeDashboardScreen> {


  final CustomSwitchController _switchcontroller = CustomSwitchController(initialValue: false);

  TextEditingController searchCntrller = TextEditingController();
  Routelist? routelist;

  Dashboard? dashboard;
  var username = '';
  var searchKey = '';
  var routes = '';

  void _enable() async {

      _switchcontroller.enable();

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      } else {
      }
      // Get the current position
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Access the latitude and longitude from the Position object
      double latitudes = position.latitude;
      double longitudes = position.longitude;

      var latitude = latitudes.toString();
      var longitude = longitudes.toString();

      Attendance attendance =
      await HttpService.markAttendance(latitude, longitude, widget.id);
      if (attendance.data != null) {
        _switchcontroller.enable();
        Fluttertoast.showToast(
          msg: attendance.message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          textColor: Colors.white,
        );
      }

  }

  void _disable() {
    _switchcontroller.enable();
    Fluttertoast.showToast(
      msg: 'Attendance already marked',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }

  @override
  void initState() {
    super.initState();
    getname();
    getList();
    getRoutes();

  }

  String whatsappurl = "https://wa.me/91";

  getRoutes() async {
    routelist = await HttpService.getRoute(widget.id);
    // print('routes---------- :${routelist!.data.length}');
    if (routelist == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      setState(() {});
    }
  }

  getname() async {
    username = await CommonFuntion.getSavedname('name');
    // print('this is usernmae: $username');
    if (dashboard != null) {
      setState(() {});
    }
  }

  getList() async {
    // print('newpage : ${widget.id}');
    dashboard = await HttpService.shopList(widget.id, searchKey, routes);
    if (dashboard != null) {
      setState(() {
        _switchcontroller.value=dashboard!.data.attendance;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: dashboard == null
        ?Center(
          child: CircularProgressIndicator(),
        )
            : SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: SizedBox(
                  width: double.maxFinite,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: getVerticalSize(219),
                          width: double.maxFinite,
                          child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: SizedBox(
                                    height: getVerticalSize(210),
                                    width: double.maxFinite,
                                    child: Stack(
                                      alignment: Alignment.bottomLeft,
                                      children: [
                                        CustomImageView(
                                            imagePath: ImageConstant.imgCrm232,
                                            height: getVerticalSize(210),
                                            width: getHorizontalSize(430),
                                            alignment: Alignment.center),
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Padding(
                                            padding:
                                                getPadding(left: 24, bottom: 8),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CustomAppBar(
                                                    height: 70,
                                                    leadingWidth: 70,
                                                    leading: Container(
                                                      width: 70,
                                                      height: 70,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(70),
                                                          color: Colors.white,
                                                          image: DecorationImage(
                                                              image: AssetImage(
                                                                  ImageConstant
                                                                      .imgEllipse1))),
                                                    ),
                                                    title: Padding(
                                                        padding: getPadding(
                                                            left: 10),
                                                        child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  'Hi, ${username}',
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: AppStyle
                                                                      .txtDMSansBold20),
                                                              Text(
                                                                  "13 JUNE 2023",
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: AppStyle
                                                                      .txtDMSansMedium16),
                                                            ]))),
                                                Container(
                                                    width:
                                                        getHorizontalSize(310),
                                                    margin: getMargin(top: 39),
                                                    child: Text(
                                                        "Mark Your Attendance Here",
                                                        maxLines: 1,
                                                        textAlign:
                                                            TextAlign.right,
                                                        style: AppStyle
                                                            .txtDMSansRegular12))
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 22),
                                  child: CustomSwitchWidget(
                                    activeColor: ColorConstant.blue600,
                                    inactiveColor: Colors.red,
                                    controller: _switchcontroller,
                                    onChange: (value) {
                                      if
                                      (dashboard!.data.attendance == true){
                                        _disable();
                                      }
                                      else
                                        _enable();
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ])),
                      Container(
                        padding: getPadding(top: 4, bottom: 4),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: getVerticalSize(132),
                              width: getHorizontalSize(375),
                              margin: getMargin(top: 9),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Row(
                                  children: [
                                    Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Container(
                                          height: 90,
                                          width: 105,
                                        ),
                                        Align(
                                          alignment: Alignment.topCenter,
                                          child: GestureDetector(
                                            onTap: () {
                                              Get.to(ProductScreen( id: widget.id));
                                            },
                                            child: Container(
                                              height: 90,
                                              width: 90,
                                              decoration: BoxDecoration(
                                                color: ColorConstant.blue600,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Products',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: IconButton(
                                            onPressed: () {
                                              Get.to(ProductScreen( id: widget.id));
                                            },
                                            icon: Icon(
                                              Icons.arrow_forward_ios_outlined,
                                              color: ColorConstant.lightBlue700,
                                            ),
                                          ),
                                          width: 40,
                                          height: 40,
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
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: ColorConstant.whiteA700),
                                        )
                                      ],
                                    ),
                                    Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Container(
                                          height: 90,
                                          width: 105,
                                        ),
                                        Align(
                                          alignment: Alignment.topCenter,
                                          child: GestureDetector(
                                            onTap: () {
                                              Get.to(CollectionScreen( id:widget.id));
                                            },
                                            child: Container(
                                              child: Center(
                                                child: Text(
                                                  'Collection',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                              height: 90,
                                              width: 90,
                                              decoration: BoxDecoration(
                                                color: ColorConstant.blue600,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.arrow_forward_ios_outlined,
                                              color:  ColorConstant.lightBlue700,
                                            ),
                                          ),
                                          width: 40,
                                          height: 40,
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
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: ColorConstant.whiteA700),
                                        )
                                      ],
                                    ),
                                    Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Container(
                                          height: 90,
                                          width: 105,
                                        ),
                                        Align(
                                          alignment: Alignment.topCenter,
                                          child: GestureDetector(
                                            onTap: () {
                                              onTapImgAddtobasketone(context);
                                            },
                                            child: Container(
                                              child: Center(
                                                child: Text(
                                                  'Add Shop',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                              height: 90,
                                              width: 90,
                                              decoration: BoxDecoration(
                                                color: ColorConstant.blue600,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: IconButton(
                                            onPressed: () {
                                              onTapImgAddtobasketone(context);
                                            },
                                            icon: Icon(
                                              Icons.arrow_forward_ios_outlined,
                                              color:  ColorConstant.lightBlue700,
                                            ),
                                          ),
                                          width: 40,
                                          height: 40,
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
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: ColorConstant.whiteA700),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 30, right: 30, top: 10),
                              child: Container(
                                height: 60,
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          controller: searchCntrller,
                                          decoration: InputDecoration(
                                            hintStyle: TextStyle(
                                              color: Colors.grey,
                                            ),
                                            filled: true,
                                            fillColor: Colors.grey[300],
                                            prefixIcon: Icon(Icons.search,
                                                color: Colors.grey),
                                            hintText: 'Search',
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      ElevatedButton(
                                        onPressed: () async {
                                          searchKey = searchCntrller.text;
                                          getList();
                                          // shops  = await HttpService.shopList(widget.id,searchKey,route);
                                        },
                                        child: Text('Search'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                                padding:
                                    getPadding(left: 25, top: 15, right: 23),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                          padding: getPadding(top: 8),
                                          child: Text("Shops",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtDMSansBold20Black900)),
                                      DropdownButton(
                                        hint: Text('Select Route'),
                                        items: routelist !=null
                                            ? routelist!.data
                                                .map<DropdownMenuItem<String>>(
                                                    (e) {
                                                return DropdownMenuItem<String>(
                                                  value: e.id.toString(),
                                                  child: Text(e.route),
                                                );
                                              }).toList()
                                            : null,
                                        onChanged: (value) {
                                          setState(() {
                                            routes = value.toString();
                                            getList();
                                          });
                                        },
                                      ),
                                    ])),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: dashboard!.data.shopDetails.length > 0
                                    ? ListView.builder(
                                        physics: BouncingScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: dashboard!.data.shopDetails.length,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: ()async {
                                             var shopsId = await dashboard!.data.shopDetails[index].shopid.toString();
                                              // print('Clicked');
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => ShopDetailsPage(id: widget.id, shopId:shopsId,),),);
                                            },
                                            child: Card(
                                              clipBehavior: Clip.antiAlias,
                                              elevation: 0,
                                              margin: getMargin(top: 8),
                                              color: ColorConstant.blue600,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadiusStyle
                                                      .roundedBorder16),
                                              child: Container(
                                                height: getVerticalSize(138),
                                                width: getHorizontalSize(378),
                                                padding: getPadding(
                                                    left: 13,
                                                    top: 24,
                                                    right: 13,
                                                    bottom: 24),
                                                decoration: AppDecoration
                                                    .fillBlue600
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder16),
                                                child: Stack(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.end,
                                                      children: [
                                                        CustomIconButton(
                                                            height: 32,
                                                            width: 32,
                                                            margin: getMargin(
                                                                bottom: 54),
                                                            shape: IconButtonShape
                                                                .CircleBorder16,
                                                            padding:
                                                                IconButtonPadding
                                                                    .PaddingAll8,
                                                            child: CustomImageView(
                                                                svgPath: ImageConstant
                                                                    .imgArrowdown)),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                                dashboard!.data.shopDetails[index]
                                                                    .shopName,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: AppStyle
                                                                    .txtDMSansMedium20),
                                                            Text(
                                                                dashboard!.data.shopDetails[index]
                                                                    .address,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: AppStyle
                                                                    .txtDMSansRegular18WhiteA700),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Align(
                                                      alignment:
                                                          Alignment.bottomRight,
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment.end,
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .calendar_today_outlined,
                                                            color: Colors.white,
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          Text(
                                                            dashboard!.data.shopDetails[index]
                                                                .createdAt,
                                                            overflow: TextOverflow
                                                                .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtDMSansBold14,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          Alignment.topRight,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment.end,
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Card(
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            elevation: 0,
                                                            margin:
                                                                EdgeInsets.all(0),
                                                            color: ColorConstant
                                                                .whiteA700,
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadiusStyle
                                                                        .roundedBorder12),
                                                            child:
                                                                GestureDetector(
                                                              onTap: () async {
                                                                var whatsapp = dashboard!
                                                                    .data.shopDetails[index]
                                                                    .whatsappNumber;
                                                                // https://wa.me/91" + whatsapp
                                                                await launch(
                                                                    whatsappurl +
                                                                        whatsapp);
                                                              },
                                                              child: Container(
                                                                height:
                                                                    getVerticalSize(
                                                                        42),
                                                                width:
                                                                    getHorizontalSize(
                                                                        61),
                                                                padding:
                                                                    getPadding(
                                                                        left: 18,
                                                                        top: 8,
                                                                        right: 18,
                                                                        bottom:
                                                                            8),
                                                                decoration: AppDecoration
                                                                    .outlineBlack9003f
                                                                    .copyWith(
                                                                        borderRadius:
                                                                            BorderRadiusStyle
                                                                                .roundedBorder12),
                                                                child: Stack(
                                                                  children: [
                                                                    CustomImageView(
                                                                        imagePath:
                                                                            ImageConstant
                                                                                .imgWhatsapp31,
                                                                        height:
                                                                            getSize(
                                                                                25),
                                                                        width:
                                                                            getSize(
                                                                                25),
                                                                        alignment:
                                                                            Alignment
                                                                                .topCenter)
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Card(
                                                              clipBehavior:
                                                                  Clip.antiAlias,
                                                              elevation: 0,
                                                              margin: getMargin(
                                                                  left: 5),
                                                              color: ColorConstant
                                                                  .whiteA700,
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadiusStyle
                                                                          .roundedBorder12),
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () async {
                                                                  await launch(
                                                                      "tel:/${dashboard!.data.shopDetails[index].phoneNumber}");
                                                                },
                                                                child: Container(
                                                                    height:
                                                                        getVerticalSize(
                                                                            42),
                                                                    width:
                                                                        getHorizontalSize(
                                                                            61),
                                                                    padding:
                                                                        getPadding(
                                                                            left:
                                                                                19,
                                                                            top:
                                                                                9,
                                                                            right:
                                                                                19,
                                                                            bottom:
                                                                                9),
                                                                    decoration: AppDecoration
                                                                        .outlineBlack9003f
                                                                        .copyWith(
                                                                            borderRadius: BorderRadiusStyle
                                                                                .roundedBorder12),
                                                                    child: Stack(
                                                                        children: [
                                                                          CustomImageView(
                                                                              imagePath:
                                                                                  ImageConstant.imgRectangle23x23,
                                                                              height: getSize(23),
                                                                              width: getSize(23),
                                                                              alignment: Alignment.topCenter)
                                                                        ])),
                                                              ))
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      )
                                    : Text('No data')),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )

      ),
    );
  }

  onTapTxtOne(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.addShopScreen);
  }

  onTapImgAddtobasketone(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddShopScreen(id: widget.id),
      ),
    );
  }
}
