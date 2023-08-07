import 'package:custom_switch_widget/custom_switch_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jibin_s_application1/core/app_export.dart';
import 'package:jibin_s_application1/model/attendance_model.dart';
import 'package:jibin_s_application1/presentation/add_shop_screen/add_shop_screen.dart';
import 'package:jibin_s_application1/presentation/collection_screen/collection_screen.dart';
import 'package:jibin_s_application1/presentation/oders_screen.dart';
import 'package:jibin_s_application1/presentation/shop_details_page/shop_details_page.dart';
import 'package:jibin_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:jibin_s_application1/widgets/custom_icon_button.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../model/dashboard_model.dart';
import '../../model/routemodel.dart';
import '../../services/service.dart';
import '../../shared_prefrence/shared_preference.dart';
import '../category_screen/category_screen.dart';


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
  final CustomSwitchController _switchcontroller =
      CustomSwitchController(initialValue: false);

  TextEditingController searchCntrller = TextEditingController();
  Routelist? routelist;

  String date = DateFormat('dd-MM-yyyy').format(DateTime.now());

  Dashboard? dashboard;
  var username = '';
  var searchKey = '';
  var routes = '';

  void _enable() async {
    if (dashboard!.data.attendance == false) {
      attendanceMarking();
    } else {}
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
    dashboard = await HttpService.Dashborad(widget.id, searchKey, routes);
    if (dashboard != null) {
      setState(() {
        _switchcontroller.value = dashboard!.data.attendance;
      });
    }
  }

  Future<void> _onRefresh() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      getList();
    });
  }

  // Future<bool> _onWillPop() async {
  //   Navigator.pop(context, (route) => false);
  //   return false;
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Close the app when the back button is pressed on the home page
        SystemNavigator.pop();
        return false; // Return false to prevent popping the route
      },
      child: Scaffold(
          backgroundColor: ColorConstant.whiteA700,
          body: dashboard == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SafeArea(
                 top: false,
                child: RefreshIndicator(
                    onRefresh: _onRefresh,
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 12),
                                      child: Container(
                                        height: 60,
                                        width: 60,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              image: DecorationImage(
                                                  fit: BoxFit.fitWidth,
                                                  image: NetworkImage(dashboard!
                                                      .data.profileImg)),
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width * 0.5,
                                      // color: Colors.red,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Hi, ${username}',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16),
                                          ),
                                          Text(
                                            date,
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: 15,
                                  ),
                                  child: Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text("Mark Your Attendance Here",
                                            maxLines: 1,
                                            textAlign: TextAlign.right,
                                            style: AppStyle.txtDMSansRegular12),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        CustomSwitchWidget(
                                          activeColor: ColorConstant.blue600,
                                          inactiveColor: Colors.red,
                                          controller: _switchcontroller,
                                          onChange: (value) {
                                            if (dashboard!.data.attendance ==
                                                true) {
                                              _disable();
                                            } else
                                              _enable();
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            width: MediaQuery.of(context).size.width,
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(ImageConstant.imgCrm232)),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            padding: getPadding(top: 4, bottom: 4),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: getVerticalSize(132),
                                    width: double.infinity,
                                    margin: getMargin(top: 9),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                                  Get.to(OderScreen(
                                                      id: widget.id));
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
                                                      'Orders',
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
                                                  Get.to(CategoryScreen(
                                                      id: widget.id));
                                                },
                                                icon: Icon(
                                                  Icons
                                                      .arrow_forward_ios_outlined,
                                                  color:
                                                      ColorConstant.lightBlue700,
                                                ),
                                              ),
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: ColorConstant
                                                          .black9003f,
                                                      spreadRadius:
                                                          getHorizontalSize(
                                                        2,
                                                      ),
                                                      blurRadius:
                                                          getHorizontalSize(
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
                                                  Get.to(CollectionScreen(
                                                      id: widget.id));
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
                                                onPressed: () {
                                                  Get.to(CollectionScreen(
                                                      id: widget.id));
                                                },
                                                icon: Icon(
                                                  Icons
                                                      .arrow_forward_ios_outlined,
                                                  color:
                                                      ColorConstant.lightBlue700,
                                                ),
                                              ),
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: ColorConstant
                                                          .black9003f,
                                                      spreadRadius:
                                                          getHorizontalSize(
                                                        2,
                                                      ),
                                                      blurRadius:
                                                          getHorizontalSize(
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
                                                  Icons
                                                      .arrow_forward_ios_outlined,
                                                  color:
                                                      ColorConstant.lightBlue700,
                                                ),
                                              ),
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: ColorConstant
                                                          .black9003f,
                                                      spreadRadius:
                                                          getHorizontalSize(
                                                        2,
                                                      ),
                                                      blurRadius:
                                                          getHorizontalSize(
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
                                    left: 8,
                                    right: 8,
                                  ),
                                  child: Container(
                                    height: 50,
                                    width: double.infinity,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              controller: searchCntrller,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.fromLTRB(
                                                        0, 10, 0, 10),
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
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.blue,
                                              // Set the background color of the button
                                              padding: EdgeInsets.all(8.0),
                                              // Set the padding of the button
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(
                                                    8.0), // Set the border radius of the button
                                              ),
                                            ),
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
                                      getPadding(left: 15, top: 8, right: 23),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                          padding: getPadding(top: 8),
                                          child: Text("Shops",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtDMSansBold20Black900)),
                                      DropdownButton(
                                        underline: Container(),
                                        value: routes == '' ? null : routes,
                                        hint: Text('Select Route'),
                                        items: routelist != null
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
                                    ],
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8, top: 0.0),
                                    child: dashboard!.data.shopDetails.length > 0
                                        ? MediaQuery.removePadding(
                                            context: context,
                                            removeTop: true,
                                            child: ListView.builder(

                                              physics: BouncingScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: dashboard!
                                                  .data.shopDetails.length,
                                              itemBuilder: (context, index) {
                                                return GestureDetector(
                                                  onTap: () async {
                                                    var shopsId = await dashboard!
                                                        .data
                                                        .shopDetails[index]
                                                        .shopid
                                                        .toString();
                                                    // print('Clicked');
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            ShopDetailsPage(
                                                          id: widget.id,
                                                          shopId: shopsId,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Card(
                                                    clipBehavior: Clip.antiAlias,
                                                    elevation: 0,
                                                    margin: getMargin(top: 8),
                                                    color: ColorConstant.blue600,
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder16),
                                                    child: Container(
                                                      height:
                                                          getVerticalSize(138),
                                                      width:
                                                          getHorizontalSize(378),
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
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              CustomIconButton(
                                                                  height: 42,
                                                                  width: 42,
                                                                  margin:
                                                                      getMargin(
                                                                          bottom:
                                                                              54),
                                                                  shape: IconButtonShape
                                                                      .CircleBorder16,
                                                                  padding:
                                                                      IconButtonPadding
                                                                          .PaddingAll8,
                                                                child: Text(dashboard!.data.shopDetails[index].shopName[0].toUpperCase()), ),
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
                                                                      dashboard!
                                                                          .data
                                                                          .shopDetails[
                                                                              index]
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
                                                                      dashboard!
                                                                          .data
                                                                          .shopDetails[
                                                                              index]
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
                                                            alignment: Alignment
                                                                .bottomRight,
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .only(
                                                                          left:
                                                                              8),
                                                                  child: Row(
                                                                    children: [
                                                                      Text(
                                                                        'Balance : ',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white),
                                                                      ),
                                                                      Text(
                                                                        dashboard!
                                                                            .data
                                                                            .shopDetails[
                                                                                index]
                                                                            .balance
                                                                            .toString(),
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Row(
                                                                  children: [
                                                                  Text('Route :',style: TextStyle(color: Colors.white),),
                                                                    SizedBox(
                                                                      width: 5,
                                                                    ),
                                                                    Text(
                                                                      dashboard!
                                                                          .data
                                                                          .shopDetails[
                                                                              index]
                                                                          .route,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style: AppStyle
                                                                          .txtDMSansBold16,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment: Alignment
                                                                .topRight,
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                Card(
                                                                  clipBehavior: Clip
                                                                      .antiAlias,
                                                                  elevation: 0,
                                                                  margin:
                                                                      EdgeInsets
                                                                          .all(0),
                                                                  color: ColorConstant
                                                                      .whiteA700,
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadiusStyle
                                                                              .roundedBorder12),
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap:
                                                                        () async {
                                                                      var whatsapp = dashboard!
                                                                          .data
                                                                          .shopDetails[
                                                                              index]
                                                                          .whatsappNumber;
                                                                      // https://wa.me/91" + whatsapp
                                                                      await launch(
                                                                          whatsappurl +
                                                                              whatsapp);
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          getVerticalSize(
                                                                              42),
                                                                      width:
                                                                          getHorizontalSize(
                                                                              61),
                                                                      padding: getPadding(
                                                                          left:
                                                                              18,
                                                                          top: 8,
                                                                          right:
                                                                              18,
                                                                          bottom:
                                                                              8),
                                                                      decoration: AppDecoration
                                                                          .outlineBlack9003f
                                                                          .copyWith(
                                                                              borderRadius:
                                                                                  BorderRadiusStyle.roundedBorder12),
                                                                      child:
                                                                          Stack(
                                                                        children: [
                                                                          CustomImageView(
                                                                              imagePath:
                                                                                  ImageConstant.imgWhatsapp31,
                                                                              height: getSize(25),
                                                                              width: getSize(25),
                                                                              alignment: Alignment.topCenter)
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Card(
                                                                    clipBehavior: Clip
                                                                        .antiAlias,
                                                                    elevation: 0,
                                                                    margin:
                                                                        getMargin(
                                                                            left:
                                                                                5),
                                                                    color: ColorConstant
                                                                        .whiteA700,
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadiusStyle
                                                                                .roundedBorder12),
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap:
                                                                          () async {
                                                                        await launch(
                                                                            "tel:/${dashboard!.data.shopDetails[index].phoneNumber}");
                                                                      },
                                                                      child: Container(
                                                                          height: getVerticalSize(42),
                                                                          width: getHorizontalSize(61),
                                                                          padding: getPadding(left: 19, top: 9, right: 19, bottom: 9),
                                                                          decoration: AppDecoration.outlineBlack9003f.copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
                                                                          child: Stack(children: [
                                                                            CustomImageView(
                                                                                imagePath: ImageConstant.imgRectangle23x23,
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
                                            ),
                                          )
                                        : Text('No data')),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              )),
    );
  }

  onTapTxtOne(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.addShopScreen);
  }

  onTapImgAddtobasketone(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddShopScreen(token: widget.id),
      ),
    );
  }

  attendanceMarking() async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Are You Sure?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('No'),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.of(context).pop();
                _switchcontroller.enable();
                LocationPermission permission =
                    await Geolocator.checkPermission();
                if (permission == LocationPermission.denied) {
                  permission = await Geolocator.requestPermission();
                } else {}
                // Get the current position
                Position position = await Geolocator.getCurrentPosition(
                  desiredAccuracy: LocationAccuracy.high,
                );

                // Access the latitude and longitude from the Position object
                double latitudes = position.latitude;
                double longitudes = position.longitude;

                var latitude = latitudes.toString();
                var longitude = longitudes.toString();

                Attendance attendance = await HttpService.markAttendance(
                    latitude, longitude, widget.id);

                if (attendance.data != null) {
                  _switchcontroller.enable();
                  Fluttertoast.showToast(
                    msg: attendance.message,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.black,
                    textColor: Colors.white,
                  );
                  getList();
                }
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}
