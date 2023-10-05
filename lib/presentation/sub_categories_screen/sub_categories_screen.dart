import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:jibin_s_application1/model/all_sub_category_model.dart';
import 'package:jibin_s_application1/presentation/product_list_screen/product_list_screen.dart';
import 'package:jibin_s_application1/services/service.dart';
import '../../core/utils/color_constant.dart';
import '../product_detailed_screen.dart';

class SubCategoriesScreen extends StatefulWidget {
  SubCategoriesScreen({Key? key, required this.id, required this.CategoryId})
      : super(key: key);

  String CategoryId;
  String id;

  @override
  State<SubCategoriesScreen> createState() => _SubCategoriesScreenState();
}

class _SubCategoriesScreenState extends State<SubCategoriesScreen> {
  TextEditingController searchCntrller = TextEditingController();

  var searchkey = '';
  bool dataConnection = false;
  AllSubCategory? allSubCategory;

  @override
  void initState() {
    super.initState();
    checkConnectiVity();
  }

  Future<void> _onRefresh() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      allSubCategoys();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          backgroundColor: ColorConstant.lightBlue700,
          centerTitle: true,
          title: Text('Sub Categories'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: allSubCategory == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : RefreshIndicator(
                onRefresh: _onRefresh,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                        right: 8,
                      ),
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
                                  searchkey = searchCntrller.text;
                                  allSubCategoys();
                                },
                                child: Text('Search'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: allSubCategory!.data.subcategory.length > 0
                          ? GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3, // Number of columns
                                crossAxisSpacing: 0, // Spacing between columns
                                mainAxisSpacing: 0, // Spacing between rows
                              ),
                              itemCount:
                                  allSubCategory!.data.subcategory.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    String subCategryId = allSubCategory!
                                        .data.subcategory[index].subcategoryId
                                        .toString();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ProductListScreen(
                                            id: widget.id,
                                            subCategoryId: subCategryId),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    child: Center(
                                      child: Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: Colors.white,
                                            ),
                                            height: 90,
                                            width: 90,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: NetworkImage(
                                                          allSubCategory!
                                                              .data
                                                              .subcategory[
                                                                  index]
                                                              .subcategoryImage)),
                                                  color: Colors.grey[100],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(allSubCategory!
                                              .data
                                              .subcategory[index]
                                              .subcategoryName),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            )
                          : Container(
                              child: Center(
                                child: Text('No Data'),
                              ),
                            ),
                    ),
                    allSubCategory!.data.products.length > 0
                        ? Container(
                            height: 30,
                            child: Text('Recently Added'),
                          )
                        : Container(),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: allSubCategory!.data.products.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, top: 8),
                            child: GestureDetector(
                              onTap: () {
                                var productId = allSubCategory!
                                    .data.products[index].productId
                                    .toString();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetailScreen(
                                        id: widget.id, productId: productId),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blueGrey[50],
                                ),
                                child: ListTile(
                                  leading: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(allSubCategory!
                                            .data.products[index].image),
                                      ),
                                      color: Colors.grey,
                                    ),
                                    width: 60,
                                    height: 120,
                                  ),
                                  title: Text(allSubCategory!
                                      .data.products[index].productName),
                                  subtitle: Text(allSubCategory!
                                      .data.products[index].productCode),
                                  trailing: Text(allSubCategory!
                                      .data.products[index].sellingPrice),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  allSubCategoys() async {
    allSubCategory = await HttpService.allSubCategorys(
        widget.id, widget.CategoryId, searchkey);
    if (allSubCategory != null) {
      setState(() {});
    }
  }

  checkConnectiVity() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      dataConnection = true;
      if (dataConnection == true) {
        setState(() {
          allSubCategoys();
        });
      }
    } else {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 200,
            color: Colors.amber,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text('No Network connection'),
                  ElevatedButton(
                    child: const Text('Retry'),
                    onPressed: () {
                      Navigator.pop(context);
                      checkConnectiVity();
                    },
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }
}
