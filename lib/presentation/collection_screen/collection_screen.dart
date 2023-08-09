import 'package:intl/intl.dart';
import 'package:jibin_s_application1/presentation/add_collection_screen/add_collection_screen.dart';
import 'package:jibin_s_application1/services/service.dart';
import '../../model/collection_model.dart';
import '../bottom_navigation_page/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:jibin_s_application1/core/app_export.dart';

class CollectionScreen extends StatefulWidget {
  CollectionScreen({Key? key, required this.id}) : super(key: key);
  String id;

  @override
  State<CollectionScreen> createState() => _CollectionScreenState();
}

class _CollectionScreenState extends State<CollectionScreen> {
  Collection? collection;

  String fdate = DateFormat('dd-MM-yyyy').format(DateTime.now());
  String tdate = DateFormat('dd-MM-yyyy').format(DateTime.now());
  String search = '';
  TextEditingController _searchController = TextEditingController();

  String? fromselectDate;
  String? toselectDate;

  @override
  void initState() {
    super.initState();
    collectionReport();
  }

  collectionReport() async {
    collection =
        await HttpService.getCollection(widget.id, fdate, tdate, search);
    if (collection != null) {
      setState(() {});
    }
  }

  Future<void> _onRefresh() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      collectionReport();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      appBar: AppBar(
        backgroundColor: ColorConstant.lightBlue700,
        centerTitle: true,
        title: Text('Collection'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle the back button press here
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => BottomNavigationScreen(id: widget.id),
              ),
            );
          },
        ),
      ),
      body: collection == null
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _onRefresh,
              child: Stack(
                children: <Widget>[
                  ListView(),
                  Column(
                    children: [
                      Container(
                        width: double.maxFinite,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 45,
                              margin: getMargin(left: 20, right: 20),
                              padding: getPadding(
                                  left: 26, top: 5, right: 26, bottom: 5),
                              decoration: BoxDecoration(
                                color: ColorConstant.lightBlue700,
                              ).copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder19),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                      padding: getPadding(left: 5, top: 4),
                                      child: Text("Opening Balance : ",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style:
                                              AppStyle.txtDMSansBoldItalic18)),
                                  Padding(
                                    padding:
                                        getPadding(left: 6, top: 2, bottom: 1),
                                    child: Row(
                                      children: [
                                        Text("₹ ",
                                            style: AppStyle
                                                .txtDMSansBold18WhiteA700),
                                        Text(
                                            collection!.data.totalAmount
                                                .toString(),
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtDMSansBold18WhiteA700),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                          fromselectDate = DateFormat(
                                              'dd-MM-yyyy')
                                              .format(
                                              selctedDatetimetemp);
                                          fdate = fromselectDate!;
                                          collectionReport();
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
                                              fdate,
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
                                    onTap: ()async {
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
                                          toselectDate = DateFormat(
                                              'dd-MM-yyyy')
                                              .format(toDateselectTemp);
                                          tdate = toselectDate!;
                                          // print('==============$fdate');
                                          // print('++++++++++++++++ $tdate');
                                          collectionReport();
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
                                              tdate,
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
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 12, right: 8),
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Collection Amount',
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '₹',
                                              style: TextStyle(
                                                fontSize: 24,
                                              ),
                                            ),
                                            Text(
                                              collection!.data.totalAmount
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 24,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    width: MediaQuery.of(context).size.width *
                                        0.60,
                                    height: 60,
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
                                      borderRadius: BorderRadius.circular(15),
                                      color: ColorConstant.gray50,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            AddCollectionScreen(
                                          id: widget.id,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 60,
                                    width: MediaQuery.of(context).size.width *
                                        0.33,
                                    padding: getPadding(
                                        left: 8, top: 5, right: 8, bottom: 5),
                                    decoration: AppDecoration.fillBlue600
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder16),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Add ',
                                            style:
                                                AppStyle.txtDMSansBoldItalic18,
                                          ),
                                          Icon(Icons.add,
                                              color: ColorConstant.whiteA700),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 8,
                                right: 8,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 40,
                                        child: TextFormField(
                                          controller: _searchController,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.fromLTRB(
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
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    ElevatedButton(
                                      onPressed: () async {
                                        search = _searchController.text;
                                        setState(() {
                                          collectionReport();
                                        });
                                      },
                                      child: Text('Search'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 15, left: 15, top: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Cash Amount',
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '₹',
                                              style: TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                            Text(
                                              collection!.data.cashAmount
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    width: 150,
                                    height: 50,
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
                                      borderRadius: BorderRadius.circular(15),
                                      color: ColorConstant.gray50,
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Bank Amount',
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '₹',
                                              style: TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                            Text(
                                              collection!.data.bankAmount
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    width: 150,
                                    height: 50,
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
                                      borderRadius: BorderRadius.circular(15),
                                      color: ColorConstant.gray50,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Table(
                                columnWidths: {
                                  0: FixedColumnWidth(
                                      MediaQuery.of(context).size.width * 0.24),
                                  1: FixedColumnWidth(
                                      MediaQuery.of(context).size.width * 0.39),
                                  2: FixedColumnWidth(
                                      MediaQuery.of(context).size.width * 0.27),
                                  3: FixedColumnWidth(
                                      MediaQuery.of(context).size.width * 0.06),
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
                                        child: Text('Date'),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Name'),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text('Amount'),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(''),
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
                            itemCount: collection!.data.collectionReport.length,
                            itemBuilder: (context, index) {
                              int count = index + 1;
                              // Each item in the ListView is represented by a Table widget
                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: Table(
                                      columnWidths: {
                                        0: FixedColumnWidth(
                                            MediaQuery.of(context).size.width *
                                                0.24),
                                        1: FixedColumnWidth(
                                            MediaQuery.of(context).size.width *
                                                0.39),
                                        2: FixedColumnWidth(
                                            MediaQuery.of(context).size.width *
                                                0.27),
                                        3: FixedColumnWidth(
                                            MediaQuery.of(context).size.width *
                                                0.06),
                                      },
                                      children: [
                                        // Each TableRow represents a row in the Table
                                        TableRow(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: ColorConstant.bluelite,
                                          ),
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(collection!.data
                                                  .collectionReport[index].date
                                                  .toString()),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(collection!
                                                  .data
                                                  .collectionReport[index]
                                                  .shopName),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(collection!
                                                  .data
                                                  .collectionReport[index]
                                                  .paidAmount
                                                  .toString()),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: collection!
                                                          .data
                                                          .collectionReport[
                                                              index]
                                                          .paymentMethod ==
                                                      "online"
                                                  ? Center(
                                                      child: Container(
                                                        height: 14,
                                                        width: 14,
                                                        decoration:
                                                            BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                            image: NetworkImage(
                                                                "https://cdn.pixabay.com/photo/2012/04/01/18/44/circle-23965_960_720.png"),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  : SizedBox(),
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
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }

  /// Navigates back to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is used
  /// to navigate back to the previous screen.
  onTapArrowleft5(BuildContext context) {
    Navigator.pop(context);
  }
}
