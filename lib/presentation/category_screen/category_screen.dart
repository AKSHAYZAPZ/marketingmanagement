import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:jibin_s_application1/model/products_model.dart';
import 'package:jibin_s_application1/presentation/sub_categories_screen/sub_categories_screen.dart';
import 'package:jibin_s_application1/services/service.dart';

import '../../model/all_category_model.dart';
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
  // Products? products;
  // ProductById? productById;
  bool dataConnection =false;
  AllCategory? allCategory;

  var currentIndex = 0;

  bool selectIndex = false;
  bool productVisibility = false;

  TextEditingController searchCntrller = TextEditingController();

  var searchKey = '';

  @override
  void initState() {
    checkConnectiVity();
  }
  Future<void> _onRefresh() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      allCategorys();
    });
  }
  // productDetails() async {
  //   products = await HttpService.getProducts(widget.id, searchKey);
  //   if (products != null) {
  //     setState(() {});
  //   }
  // }

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
      body: allCategory == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
        onRefresh: _onRefresh,
            child: Column(
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
                                      EdgeInsets.fromLTRB(0, 10, 0, 10),
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
                                allCategorys();
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
                      child: allCategory!.data.length > 0
                          ? GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3, // Number of columns
                                crossAxisSpacing: 0, // Spacing between columns
                                mainAxisSpacing: 0, // Spacing between rows
                              ),
                              itemCount: allCategory!.data.length,
                              // Total number of items in the grid
                              itemBuilder: (context, index) {
                                // Replace this with the widget you want to display at each grid item
                                return GestureDetector(
                                  onTap: () {
                                    String CategoryId =
                                        allCategory!.data[index].id.toString();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              SubCategoriesScreen(
                                                  id: widget.id,
                                                  CategoryId: CategoryId),
                                        ));
                                  },
                                  child: Container(
                                    child: Center(
                                        child: Column(
                                      children: [
                                        Container(
                                          height: 90,
                                          width: 90,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(allCategory!
                                                      .data[index]
                                                      .categoryImage)),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(allCategory!
                                            .data[index].categoryName),
                                      ],
                                    )),
                                  ),
                                );
                              },
                            )
                          : Container(
                            child: Center(
                                child: Text('No Categories'),
                              ),
                          ),
                    ),
                  ),
                ],
              ),
          ),
    );
  }

  checkConnectiVity()async{
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      dataConnection =true;
      if(dataConnection==true){
        allCategorys();
      }
    } else{
      dataConnection =false;
      showDialog(context: context, builder: (context) {
        return AlertDialog(
          content:Container(
            height: 200,
            child: Column(
              children: [
                Text('No data Connection'),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(ImageConstant.network),),
                  ),
                )
              ],
            ),

          ),
          actions: [
            TextButton(onPressed: () {
              setState(() {
                checkConnectiVity();
                Navigator.pop(context);
              });

            }, child: Text('Retry'))
          ],
        );
      },);
    }
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

  allCategorys() async {
    allCategory = await HttpService.allCategorys(widget.id, searchKey);
    if (allCategory != null) {
      setState(() {});
    }
  }
}
