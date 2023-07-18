import 'package:custom_switch_widget/custom_switch_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jibin_s_application1/services/service.dart';

import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../model/dashboard_model.dart';
import '../../theme/app_decoration.dart';
import '../../theme/app_style.dart';
import '../../widgets/custom_image_view.dart';
import '../bottom_navigation_page/bottom_navigation.dart';

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
  var tabbarController;

  String fdate = DateFormat('dd-MM-yyyy').format(DateTime.now());
  String tdate = DateFormat('dd-MM-yyyy').format(DateTime.now());

  ShopDetail? shopDetail;

  final CustomSwitchController _switchcontroller =
      CustomSwitchController(initialValue: false);

  void _enable() async {
    _switchcontroller.enable();
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
    print('shop id ---- ${widget.shopId}');
    print('shop id ---- ${widget.id}');
    print('fdate ---- ${fdate}');
    print('fdate ---- ${tdate}');
    shopDetail =
        await HttpService.shopDetails(widget.shopId, widget.id, fdate, tdate);
    if (shopDetail != null) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.lightBlue700,
        centerTitle: true,
        title: Text('Shop Deatils'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle the back button press here
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => BottomNavigationScreen(id: widget.id),
            //   ),
            // );
          },
        ),
      ),
      body: shopDetail == null
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
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                        color: ColorConstant.lightBlue700,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: 60,
                                  height: 60,
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
                                width: MediaQuery.of(context).size.width * 0.48,
                                height:
                                    MediaQuery.of(context).size.height * 0.12,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                          'Tradly Store pribate limited',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: AppStyle
                                              .txtDMSansRegular18WhiteA700,
                                        ),
                                      ),
                                      Text(
                                        'Nap junction, kathrikkadavu,Ernakulam kerala ',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: AppStyle
                                            .txtDMSansRegular18WhiteA702,
                                      ),
                                    ],
                                  ),
                                )),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.08,
                              width: MediaQuery.of(context).size.width * 0.32,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(
                                  children: [
                                    Container(
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
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
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
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        Container(
                          width: double.infinity,
                          height: 20,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'GST NO :',
                                style: AppStyle.txtDMSansRegular18WhiteA700,
                              ),
                              Text(
                                '121212121212',
                                style: AppStyle.txtDMSansRegular18WhiteA700,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.38,
                              height: MediaQuery.of(context).size.height * 0.10,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_month,
                                      color: ColorConstant.whiteA700,
                                    ),
                                    Text(
                                      '13-06-2023',
                                      style:
                                          AppStyle.txtDMSansRegular18WhiteA702,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.28,
                              height: MediaQuery.of(context).size.height * 0.10,
                              child: Icon(
                                Icons.comment_outlined,
                                size: 42,
                                color: ColorConstant.whiteA700,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 15, right: 15, top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                            SizedBox(
                              width: 15,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      tdate.toString(),
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
                                          fdate = DateFormat('dd-MM-yyyy')
                                              .format(toDateselectTemp);
                                          // print('==============$fdate');
                                          // print('++++++++++++++++ $tdate');
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
                    ],
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
                  child: TabBarView(controller: tabbarController, children: [
                    //// -----------------------------------tab bars here 1 oder details-----------------
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text('Recent Oders'),
                            Container(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Table(
                                      columnWidths: {
                                        0: FixedColumnWidth(50.0),
                                        1: FixedColumnWidth(60.0),
                                        2: FixedColumnWidth(100.0),
                                        3: FixedColumnWidth(100.0),
                                        4: FixedColumnWidth(50.0),
                                      },
                                      children: [
                                        TableRow(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: ColorConstant.gray300,
                                          ),
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text('SlNo.'),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text('Data'),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text('Invoice ID'),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text('Price'),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text('View'),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Container(
                                        child: Table(
                                          columnWidths: {
                                            0: FixedColumnWidth(50.0),
                                            1: FixedColumnWidth(60.0),
                                            2: FixedColumnWidth(100.0),
                                            3: FixedColumnWidth(100.0),
                                            4: FixedColumnWidth(60.0),
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
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text('1'),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    'maino',
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text('bainoo',
                                                      maxLines: 2,
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text('vainoo',
                                                      maxLines: 2,
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                ),
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child:
                                                        Icon(Icons.visibility)),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //// -----------------------------------tab bars here 2 payment details-----------------
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text('Recent Oders'),
                            Container(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Table(
                                      columnWidths: {
                                        0: FixedColumnWidth(50.0),
                                        1: FixedColumnWidth(60.0),
                                        2: FixedColumnWidth(100.0),
                                        3: FixedColumnWidth(100.0),
                                        4: FixedColumnWidth(50.0),
                                      },
                                      children: [
                                        TableRow(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: ColorConstant.gray300,
                                          ),
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text('SlNo.'),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text('Date'),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text('Invoice ID'),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text('Price'),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text('View'),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Container(
                                        child: Table(
                                          columnWidths: {
                                            0: FixedColumnWidth(50.0),
                                            1: FixedColumnWidth(60.0),
                                            2: FixedColumnWidth(100.0),
                                            3: FixedColumnWidth(100.0),
                                            4: FixedColumnWidth(60.0),
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
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text('1'),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    'maino',
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text('bainoo',
                                                      maxLines: 2,
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text('vainoo',
                                                      maxLines: 2,
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                ),
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child:
                                                        Icon(Icons.visibility)),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //// -----------------------------------tab bars here 3 payment details-----------------
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text('Recent Oders'),
                            Container(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(3),
                                    child: Table(
                                      columnWidths: {
                                        0: FixedColumnWidth(50.0),
                                        1: FixedColumnWidth(80.0),
                                        2: FixedColumnWidth(110.0),
                                        3: FixedColumnWidth(130.0),
                                      },
                                      children: [
                                        TableRow(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: ColorConstant.gray300,
                                          ),
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text('SlNo.'),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text('Date'),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text('Amount'),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text('Payment Methord'),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Container(
                                        child: Table(
                                          columnWidths: {
                                            0: FixedColumnWidth(50.0),
                                            1: FixedColumnWidth(80.0),
                                            2: FixedColumnWidth(110.0),
                                            3: FixedColumnWidth(130.0),
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
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text('1'),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    'maino',
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text('10000',
                                                      maxLines: 2,
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                      'Cash on Delivery',
                                                      maxLines: 2,
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ]),
                )
              ],
            ),
    );
  }
}
