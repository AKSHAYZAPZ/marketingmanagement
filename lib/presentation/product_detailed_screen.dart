import 'package:flutter/material.dart';
import 'package:jibin_s_application1/services/service.dart';

import '../model/product_by_id_model.dart';

class ProductDetailScreen extends StatefulWidget {
  ProductDetailScreen({Key? key,}) : super(key: key);



  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
//   ProductById? prouctById;
// var currentIndex = 0;

  // @override
  // void initState() {
  //   super.initState();
  //   product();
  // }

  // product() async {
  //   prouctById = await HttpService.productDetailsByID(widget.prdctId);
  //   if (prouctById != null) {
  //     setState(() {});
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('ProductName'),
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
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage
                          ('https://cdn.moglix.com/p/YZfgS1m8eCbxT-xxlarge.jpg')),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  Container(
                    height: 80,
                    child: ListView.builder(
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              // currentIndex = index;
                              setState(() {
                              });
                            },
                            child: Container(
                              width: 110,
                              height: 70,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: NetworkImage('https://static1.industrybuying.com/products/office-supplies/office-furniture/office-chairs/OFF.OFF.72853554_1668034426005.webp'),
                                  ),
                        borderRadius: BorderRadius.circular(10)
                            ),
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
                              'ProductName',
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
                                Text('₹',
                                style: TextStyle(
                                  fontSize: 20,
                                ),),
                                SizedBox(
                                  width: 7,
                                ),
                                Text('5000',
                                  style: TextStyle(
                                  fontSize: 20,
                                ),),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text('Product Code :'),
                                Text('0003'),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(" is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem",
                            style: TextStyle(
                              color: Colors.grey[600]
                            ),)
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
