import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jibin_s_application1/presentation/invoice_details_screen/invoice_details_screen.dart';
import 'package:jibin_s_application1/presentation/oder_details_screen/oder_details_screen.dart';
import 'package:jibin_s_application1/services/service.dart';

import '../core/utils/color_constant.dart';
import '../core/utils/size_utils.dart';
import '../model/executiveslist_model.dart';
import '../model/oderlist_model.dart';
import '../model/routemodel.dart';
import '../theme/app_style.dart';

class OderScreen extends StatefulWidget {
  OderScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  String id;

  @override
  State<OderScreen> createState() => _OderScreenState();
}

class _OderScreenState extends State<OderScreen> {
  List<String> dropdownItems = [
    'Option 1',
    'Option 2',
  ];
  String searchKey = '';

  String statusbar = '0';

  Oderlists? oderlists;
  ExecutiveLists? executiveLists;
  Routelist? routelist;
  var routes = '';

  String fdate = DateFormat('dd-MM-yyyy').format(DateTime.now());
  String tdate = DateFormat('dd-MM-yyyy').format(DateTime.now());

  TextEditingController searchCntrller = TextEditingController();

  var executive = '';

  @override
  void initState() {
    super.initState();
    executives();
    getRoutes();
    fullOders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.lightBlue700,
        title: Text('Orders'),
        centerTitle: true,
      ),
      body: oderlists == null
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _onRefresh,
              child: Stack(
                children: <Widget>[
                  ListView(),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 5,
                          right: 5,
                        ),
                        child: Container(
                          height: 70,
                          width: double.infinity,
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 40,
                                  child: TextFormField(
                                    controller: searchCntrller,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.fromLTRB(0, 10, 0, 10),
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                      ),
                                      filled: true,
                                      fillColor: Colors.grey[300],
                                      prefixIcon: Icon(Icons.search,
                                          color: Colors.grey),
                                      hintText: 'Shops search here...',
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  setState(() {
                                    searchKey = searchCntrller.text;
                                    fullOders();
                                  });
                                },
                                child: Text('Search'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: ()async {
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
                                      fullOders();
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
                                        padding: const EdgeInsets.only(left: 10),
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
                                onTap: ()async{
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
                                      fullOders();
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
                                        padding: const EdgeInsets.only(left: 10),
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
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.3,
                                  height: 30,
                                  child: DropdownButton<String>(
                                    underline: Container(),
                                    value: statusbar == '' ? null : statusbar,
                                    hint: Text('Status'),
                                    items: [
                                      DropdownMenuItem<String>(
                                        value: '0',
                                        child: Text('All orders'),
                                      ),
                                      DropdownMenuItem<String>(
                                        value: '1',
                                        child: Text('Not confirmed'),
                                      ),
                                      DropdownMenuItem<String>(
                                        value: '2',
                                        child: Text('Confirmed'),
                                      ),
                                    ],
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        statusbar = newValue ?? '';
                                        fullOders();
                                      });
                                    },
                                    isDense: true,
                                    isExpanded: true,
                                    selectedItemBuilder: (BuildContext context) {
                                      return [
                                        'All orders',
                                        'Not confirmed',
                                        'Confirmed',
                                      ].map<Widget>((item) {
                                        return Container(
                                          width: MediaQuery.of(context).size.width * 0.3,
                                          child: Text(
                                            item,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        );
                                      }).toList();
                                    },
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.3,
                                  height: 30,
                                  child: executiveLists == null
                                      ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                      : executiveLists!.status == true
                                      ? DropdownButton<String>(
                                    underline: Container(),
                                    value: executive == '' ? null : executive,
                                    hint: Text('Executive'),
                                    items: executiveLists!.data.map<DropdownMenuItem<String>>(
                                          (e) {
                                        return DropdownMenuItem<String>(
                                          value: e.id.toString(),
                                          child: Text(e.name),
                                        );
                                      },
                                    ).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        executive = newValue ?? '';
                                        fullOders();
                                      });
                                    },
                                    isDense: true,
                                    isExpanded: true,
                                    selectedItemBuilder: (BuildContext context) {
                                      return executiveLists!.data.map<Widget>((e) {
                                        return Container(
                                          width: MediaQuery.of(context).size.width * 0.3,
                                          child: Text(
                                            e.name,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        );
                                      }).toList();
                                    },
                                  )
                                      : SizedBox(),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.3,
                                  height: 30,
                                  child: DropdownButton(
                                    underline: Container(),
                                    value: routes == '' ? null : routes,
                                    hint: Text('Select Route'),
                                    isDense: true, // Make the dropdown compact
                                    isExpanded: true, // Expand the selected value to fit the width
                                    items: routelist != null
                                        ? routelist!.data.map<DropdownMenuItem<String>>((e) {
                                      return DropdownMenuItem<String>(
                                        value: e.id.toString(),
                                        child: Text(e.route),
                                      );
                                    }).toList()
                                        : null,
                                    onChanged: (value) {
                                      setState(() {
                                        routes = value.toString();
                                        fullOders();
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: oderlists!.data.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, top: 10),
                              child: GestureDetector(
                                onTap: () {
                                  oderlists!.data[index].orderStatus ==
                                          "Order Confirmed"
                                      ? Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                InvoiceDetailsScreen(
                                                    oderid: oderlists!
                                                        .data[index].id.toString(),
                                                    token: widget.id),
                                          ),
                                        )
                                      : Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                OderDetailsScreen(
                                                    oderid: oderlists!
                                                        .data[index].id.toString(),
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
                                                color:
                                                    ColorConstant.lightBlue700,
                                                borderRadius:
                                                    BorderRadius.circular(38)),
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
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.35,
                                                    child:
                                                        SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        children: [
                                                          Icon(Icons.assignment,color: Colors.grey[700]),
                                                          // Text('Order ID: '),
                                                          SizedBox(width: 5,),
                                                          Text(
                                                              oderlists!
                                                                  .data[index]
                                                                  .orderId,
                                                              maxLines: 1,
                                                               overflow: TextOverflow.ellipsis,
                                                            ),
                                                        ],
                                                      ),
                                                    ),
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
                                                      Icon(Icons.calendar_month,color: Colors.grey[700]),
                                                      // Text('Date : '),
                                                      SizedBox(width: 5,),

                                                      Text(
                                                        oderlists!.data[index]
                                                            .orderDate
                                                            .toString(),
                                                      ),
                                                    ],
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
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(6.0),
                                                          child:
                                                              SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: Text(oderlists!
                                                                .data[index]
                                                                .orderStatus!),
                                                          ),
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
                                                children: [
                                                  // Text('Shop Name: '),
                                                  Icon(Icons.store,color: Colors.grey[700]),
                                                  SizedBox(width: 5,),
                                                  SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Text(oderlists!
                                                        .data[index].shopName),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 2,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                    Icon(Icons.person,color: Colors.grey[700],),

                                                      // Text('Created by: '),
                                                      SizedBox(width: 5,),
                                                      Text(
                                                        oderlists!.data[index]
                                                            .createdBy!,
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
                                                        oderlists!
                                                            .data[index].price
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
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
    );
  }

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

  executives() async {
    executiveLists = await HttpService.executiveLists(widget.id);
    fullOders();
    if (executiveLists != null) {
      setState(() {});
    }
  }

  fullOders() async {
    oderlists = await HttpService.orderLists(
        widget.id, fdate, tdate, searchKey, routes, statusbar, executive);
    if (oderlists == null) {
      Center(
        child: CircularProgressIndicator(),
      );
    } else {
      setState(() {});
    }
  }

  Future<void> _onRefresh() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      getRoutes();
      executives();
    });
  }
}
