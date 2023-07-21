import 'package:flutter/material.dart';
import 'package:jibin_s_application1/services/service.dart';

import '../model/product_by_id_model.dart';

class ProductDetailScreen extends StatefulWidget {
  ProductDetailScreen({Key? key, required this.prdctId}) : super(key: key);

  String prdctId;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  ProuctById? prouctById;
var currentIndex = 0;

  @override
  void initState() {
    super.initState();
    product();
  }

  product() async {
    prouctById = await HttpService.productDetailsByID(widget.prdctId);
    if (prouctById != null) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return prouctById == null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(prouctById!.data.productName),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 12, right: 12, top: 8, bottom: 8),
                    child: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage
                          (prouctById!.data.images[currentIndex].productImage)),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  Container(
                    height: 80,
                    child: ListView.builder(
                      itemCount: prouctById!.data.images.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              currentIndex = index;
                              setState(() {
                              });
                            },
                            child: Container(
                              width: 110,
                              height: 70,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: NetworkImage(prouctById!.data.images[index].productImage)),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              prouctById!.data.productName,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text('₹'),
                                SizedBox(
                                  width: 7,
                                ),
                                Text(prouctById!.data.sellingPrice),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text('Product Code :'),
                                Text(prouctById!.data.productCode),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
