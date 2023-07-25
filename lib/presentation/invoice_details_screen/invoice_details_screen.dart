import 'package:flutter/material.dart';
import 'package:jibin_s_application1/services/service.dart';

import '../../core/utils/color_constant.dart';
import '../../model/invoice_details_model.dart';

class InvoiceDetailsScreen extends StatefulWidget {
   InvoiceDetailsScreen({Key? key, required this.oderid, required this.token})
      : super(key: key);

  String oderid;
  String token;

  @override
  State<InvoiceDetailsScreen> createState() => _InvoiceDetailsScreenState();
}

class _InvoiceDetailsScreenState extends State<InvoiceDetailsScreen> {

  InvoiceDetailsModel? invoiceDetailsModel;

@override
  void initState() {
    super.initState();
    invoice();
  }

   invoice()async{
     invoiceDetailsModel  = await HttpService.invoiceDetailsByID(widget.oderid, widget.token);
     if(invoiceDetailsModel!.status == true){
       setState(() {

       });
     }
   }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.lightBlue700,
        title: Text('Invoice Details'),
        centerTitle: true,
      ),
      body: invoiceDetailsModel == null
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
                            'Invoice Date :',
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
                              'Invoice No :',
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
                                invoiceDetailsModel!.data.shopName,
                                style: TextStyle(fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                              invoiceDetailsModel!.data.invoiceDate,
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
                                invoiceDetailsModel!.data.invoiceNo,
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
                              invoiceDetailsModel!.data.total.toString(),
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
                    itemCount: invoiceDetailsModel!.data.orderDetails.length,
                    itemBuilder: (context, index) {
                      int count = index + 1;
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
                                        invoiceDetailsModel!.data.orderDetails[index].productCode,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(invoiceDetailsModel!.data.orderDetails[index].productName,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(invoiceDetailsModel!.data.orderDetails[index].quantity,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(invoiceDetailsModel!.data.orderDetails[index].price.toString(),
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