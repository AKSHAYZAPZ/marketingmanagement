import 'package:jibin_s_application1/model/products_model.dart';
import 'package:jibin_s_application1/services/service.dart';

import '../bottom_navigation_page/bottom_navigation.dart';
import '../product_detailed_screen.dart';
import '../product_screen/widgets/listone_item_widget.dart';
import '../product_screen/widgets/listsix_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:jibin_s_application1/core/app_export.dart';
import 'package:jibin_s_application1/widgets/app_bar/appbar_image.dart';
import 'package:jibin_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:jibin_s_application1/widgets/app_bar/custom_app_bar.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({Key? key, required this.id}) : super(key: key);

  String id;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Products? products;

  bool selectIndex = false;

  TextEditingController searchCntrller = TextEditingController();

  var searchKey = '';

  @override
  void initState() {
    super.initState();
    productDetails();
  }

  productDetails() async {
    products = await HttpService.getProducts(widget.id, searchKey);
    if (products != null) {
      setState(() {});
    }
  }

  int firstIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.lightBlue700,
        centerTitle: true,
        title: Text('Products'),
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
      body: products == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: 135,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Categories', style: AppStyle.txtDMSansBold18),
                        SizedBox(
                          height: 5,
                        ),
                        Expanded(
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: products!.data.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.only(left: 3, right: 3),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        firstIndex = index;
                                      });
                                    },
                                    child: Container(
                                      width: 100,
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 90,
                                            width: 90,
                                            decoration: BoxDecoration(
                                                border: firstIndex == index
                                                    ? Border.all(
                                                        color: Colors
                                                            .red, // Border color
                                                        width:
                                                            2.0, // Border width
                                                      )
                                                    : Border.all(
                                                        color:
                                                            Colors.transparent),
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(
                                                        products!.data[index]
                                                            .categoryImage)),
                                                color: Colors.transparent,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                              products!
                                                  .data[index].categoryName,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: AppStyle
                                                  .txtDMSansBold14Gray700)
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15, top: 1),
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
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey[300],
                                  prefixIcon:
                                      Icon(Icons.search, color: Colors.grey),
                                  hintText: 'Search',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(15),
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
                              searchKey = searchCntrller.text;
                              productDetails();
                            },
                            child: Text('Search'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(1),
                            child: Table(
                              columnWidths: {
                                0: FixedColumnWidth(55.0),
                                1: FixedColumnWidth(60.0),
                                2: FixedColumnWidth(120.0),
                                3: FixedColumnWidth(80.0),
                                4: FixedColumnWidth(55.0),
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
                                      child: Text('Price'),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
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
                  ),
                  Container(
                    child: Expanded(
                      child: ListView.builder(
                        itemCount:
                            products!.data[firstIndex].productDetails.length,
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
                                    0: FixedColumnWidth(55.0),
                                    1: FixedColumnWidth(60.0),
                                    2: FixedColumnWidth(120.0),
                                    3: FixedColumnWidth(80.0),
                                    4: FixedColumnWidth(50.0),
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
                                            products!
                                                .data[firstIndex]
                                                .productDetails[childIndex]
                                                .productCode,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                              products!
                                                  .data[firstIndex]
                                                  .productDetails[childIndex]
                                                  .productName,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                              products!
                                                  .data[firstIndex]
                                                  .productDetails[childIndex]
                                                  .sellingPrice,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: GestureDetector(
                                            child: GestureDetector(
                                                onTap: () {
                                                  String productid = products!
                                                      .data[firstIndex]
                                                      .productDetails[childIndex]
                                                      .productId.toString();
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          ProductDetailScreen( prdctId: productid,),
                                                    ),
                                                  );
                                                },
                                                child: Icon(Icons.visibility)),
                                          ),
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
    );
  }

  /// Navigates to the productDScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the `Navigator` widget
  /// to push the named route for the productDScreen.
  onTapImgRectanglefive(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.productDScreen);
  }

  /// Navigates back to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is used
  /// to navigate back to the previous screen.
  onTapArrowleft3(BuildContext context) {
    Navigator.pop(context);
  }
}
