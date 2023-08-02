import 'package:jibin_s_application1/model/products_model.dart';
import 'package:jibin_s_application1/presentation/sub_categories_screen/sub_categories_screen.dart';
import 'package:jibin_s_application1/services/service.dart';

import '../../model/product_by_id_model.dart';
import '../bottom_navigation_page/bottom_navigation.dart';
import '../product_detailed_screen.dart';
import 'package:flutter/material.dart';
import 'package:jibin_s_application1/core/app_export.dart';
import 'package:jibin_s_application1/widgets/app_bar/appbar_image.dart';
import 'package:jibin_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:jibin_s_application1/widgets/app_bar/custom_app_bar.dart';

class CategoryScreen extends StatefulWidget {
  CategoryScreen({Key? key, required this.id}) : super(key: key);

  String id;

  @override
  State<CategoryScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<CategoryScreen> {
  Products? products;
  ProductById? productById;

  var currentIndex = 0;

  bool selectIndex = false;
  bool productVisibility = false;

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
        title: Text('Categories'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => BottomNavigationScreen(id: widget.id),
              ),
            );
          },
        ),
      ),
      body:  Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: searchCntrller,
                        decoration: InputDecoration(
                          contentPadding:
                          EdgeInsets.fromLTRB(
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
                    SizedBox(
                      width: 5,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        // Set the background color of the button
                        padding: EdgeInsets.all(8.0),
                        // Set the padding of the button
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              8.0), // Set the border radius of the button
                        ),
                      ),
                      onPressed: () async {
                        searchKey = searchCntrller.text;
                        // shops  = await HttpService.shopList(widget.id,searchKey,route);
                      },
                      child: Text('Search'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 3, // Number of columns
                 crossAxisSpacing: 0, // Spacing between columns
                 mainAxisSpacing:0, // Spacing between rows
               ),
               itemCount: 15, // Total number of items in the grid
               itemBuilder: (context, index) {
                 // Replace this with the widget you want to display at each grid item
                 return GestureDetector(
                   onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SubCategoriesScreen(),));
                   },
                   child: Container(
                     child: Center(
                       child: Column(
                         children: [
                           Container(
                             height: 90,
                             width: 90,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage("https://cdn.firstcry.com/education/2022/11/08143105/Green-Vegetables-Names-in-English-for-Kids.jpg")),
                              borderRadius: BorderRadius.circular(15)
                            ),
                           ),
                            SizedBox(
                              height: 5,
                            ),
                            Text('Vegetable'),
                         ],
                       )
                     ),
                   ),
                 );
               },
                  ),
            ),
          ),
        ],
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
