import 'package:flutter/material.dart';
import 'package:jibin_s_application1/core/app_export.dart';
import 'package:jibin_s_application1/services/service.dart';
import '../../model/oder_details_model.dart';


class OderDetailsScreen extends StatefulWidget {
  OderDetailsScreen({Key? key, required this.oderid, required this.token})
      : super(key: key);

  String oderid;
  String token;

  @override
  State<OderDetailsScreen> createState() => _OderDetailsScreenState();
}

class _OderDetailsScreenState extends State<OderDetailsScreen> {
  OderDetailsModel? oderDetailsModel;

  @override
  void initState() {
    super.initState();
    oders();
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
    return Scaffold(
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
              height: 120,
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
                    width: 125,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10),
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
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            'Order Date :',
                            style: TextStyle(
                              fontSize: 16,
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
                                fontSize: 16,
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
                              fontSize: 16,
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
                      width: 120,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10),
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
                                style: TextStyle(fontSize: 16,
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
                                fontSize: 16,
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
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                              oderDetailsModel!.data.total.toString(),
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
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
                            MediaQuery.of(context)
                                .size
                                .width *
                                0.25), // Using 10%
                        1: FixedColumnWidth(
                            MediaQuery.of(context)
                                .size
                                .width *
                                0.32), // Using 30%
                        2: FixedColumnWidth(
                            MediaQuery.of(context)
                                .size
                                .width *
                                0.2), // Using 20%
                        3: FixedColumnWidth(
                            MediaQuery.of(context)
                                .size
                                .width *
                                0.16),
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
                          child: Container(
                            child: Table(
                              columnWidths: {
                                0: FixedColumnWidth(
                                    MediaQuery.of(context)
                                        .size
                                        .width *
                                        0.25), // Using 10%
                                1: FixedColumnWidth(
                                    MediaQuery.of(context)
                                        .size
                                        .width *
                                        0.32), // Using 30%
                                2: FixedColumnWidth(
                                    MediaQuery.of(context)
                                        .size
                                        .width *
                                        0.2), // Using 20%
                                3: FixedColumnWidth(
                                    MediaQuery.of(context)
                                        .size
                                        .width *
                                        0.16),
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
                                      child: Text(
                                        oderDetailsModel!.data.orderDetails[index].productCode,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(oderDetailsModel!.data.orderDetails[index].productName,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(oderDetailsModel!.data.orderDetails[index].quantity,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(oderDetailsModel!.data.orderDetails[index].price.toString(),
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
                    //]
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
