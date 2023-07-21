import 'package:flutter/material.dart';
import 'package:jibin_s_application1/core/app_export.dart';
import 'package:jibin_s_application1/presentation/take_order_screen/SuggestionTextField.dart';
import 'package:jibin_s_application1/services/service.dart';

import '../model/all_products_list_model.dart';

class TakeOderScreen extends StatefulWidget {
  TakeOderScreen({Key? key, required this.id}) : super(key: key);
  String id;

  @override
  State<TakeOderScreen> createState() => _TakeOderScreenState();
}

class _TakeOderScreenState extends State<TakeOderScreen> {
  AllProductList? allProductList;

  @override
  void initState() {
    super.initState();
    // allProducts();
  }

  // allProducts()async{
  //   allProductList = await HttpService.allProductList(widget.id);
  //   if(allProductList != null){
  //     setState(() {
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Take Oder'),
      ),
      body:
          // allProductList==null ?
          // CircularProgressIndicator():
          Container(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: 60,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Container(
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
                        // child: SuggestionTextField(
                        //   id: widget.id,
                        //   backendAPIURL:
                        //       'https://dev.login2.in/MeMa/MobileApi/allProductDetails', // Replace this with your actual backend API URL
                        // ),
                      ),
                    ),
                    SizedBox(
                      width: 9,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Container(
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
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Quantity',
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                            ),
                          )),
                    ),
                    SizedBox(
                      width: 9,
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.4,
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
                    )),
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
                    padding: const EdgeInsets.all(1),
                    child: Table(
                      columnWidths: {
                        0: FixedColumnWidth(60.0),
                        1: FixedColumnWidth(85.0),
                        2: FixedColumnWidth(100.0),
                        3: FixedColumnWidth(65.0),
                        4: FixedColumnWidth(70.0),
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
                              child: Text('Sl No.'),
                            ),
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
                  itemCount: 3,
                  itemBuilder: (context, childIndex) {
                    // Each item in the ListView is represented by a Table widget
                    int count = childIndex + 1;
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          child: Table(
                            columnWidths: {
                              0: FixedColumnWidth(60.0),
                              1: FixedColumnWidth(85.0),
                              2: FixedColumnWidth(100.0),
                              3: FixedColumnWidth(65.0),
                              4: FixedColumnWidth(70.0),
                            },
                            children: [
                              // Each TableRow represents a row in the Table
                              TableRow(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: ColorConstant.gray100,
                                ),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(count.toString()),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '223652',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Tool bar',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('252',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('25000',
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
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text('Generate Bill'),
      ),
    );
  }
}
