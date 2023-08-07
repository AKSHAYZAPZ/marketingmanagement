import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jibin_s_application1/services/service.dart';

import '../core/utils/color_constant.dart';
import '../core/utils/size_utils.dart';
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
    'Option 3',
    'Option 4',
  ];

  Routelist? routelist;
  var routes = '';

  String fdate = DateFormat('dd-MM-yyyy').format(DateTime.now());
  String tdate = DateFormat('dd-MM-yyyy').format(DateTime.now());

  TextEditingController searchCntrller = TextEditingController();


  @override
  void initState() {
    super.initState();
    getRoutes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.lightBlue700,
        title: Text('Orders'),
        centerTitle: true,
      ),
      body: Column(
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
                          contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          filled: true,
                          fillColor: Colors.grey[300],
                          prefixIcon: Icon(Icons.search, color: Colors.grey),
                          hintText: 'Search',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
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
                      setState(() {});
                    },
                    child: Text('Search'),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
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
                            final selctedDatetimetemp = await showDatePicker(
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
          Container(
            child: Padding(
              padding: getPadding(left: 15, top: 8, right: 23),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DropdownButton(
                    hint: Text('Status'),
                    items: dropdownItems.map((item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(), onChanged: (value) {
                    
                  },),
                  DropdownButton(
                    hint: Text('Executive'),
                    items: dropdownItems.map((item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(), onChanged: (value) {

                  },),
                  DropdownButton(
                    underline: Container(),
                    value: routes == '' ? null : routes,
                    hint: Text('Select Route'),
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
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
                  child: GestureDetector(
                      onTap: () {

                      },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(10),
                        color: Color(0xFFDEF3FF),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                          )
                        ],
                      ),
                      width:
                      MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              margin:
                              EdgeInsets.only(right: 7),
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
                                    BorderRadius
                                        .circular(38)),
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
                                              'Order ID: '),
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Text(
                                              '01234'
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            decoration:
                                            BoxDecoration(
                                              color: Color
                                                  .fromARGB(
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
                                                  .all(
                                                  6.0),
                                              child: SingleChildScrollView(
                                                scrollDirection: Axis.horizontal,
                                                child: Text('Status'),
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
                                      Text(
                                          'Shop Name: '),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Text(
                                            'Komalavalli'
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text('Date : '),
                                          Text('13-01-2024',
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
                                              'Created by: '),
                                          Text(
                                            'Admin',
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '₹',
                                            style:
                                            TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                          Text(
                                            '50000',
                                            style:
                                            TextStyle(
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
}
