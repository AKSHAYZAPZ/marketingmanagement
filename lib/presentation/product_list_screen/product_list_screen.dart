import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:jibin_s_application1/presentation/product_detailed_screen.dart';
import 'package:jibin_s_application1/services/service.dart';
import '../../model/products_model.dart';

class ProductListScreen extends StatefulWidget {
  ProductListScreen({Key? key, required this.id, required this.subCategoryId})
      : super(key: key);

  String id;
  String subCategoryId;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  ProductList? productList;

  TextEditingController searchCntrller = TextEditingController();

  String search = '';
  bool dataConnection = false;

  @override
  void initState() {
    super.initState();
    checkConnectiVity();
  }

  allProductList() async {
    productList = await HttpService.allProductbysubcategory(
        widget.id, widget.subCategoryId, search);
    if (productList != null) {
      setState(() {});
    }
  }

  Future<void> _onRefresh() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      allProductList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Products'),
          centerTitle: true,
        ),
        body: productList == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : RefreshIndicator(
                onRefresh: _onRefresh,
                child: Stack(children: <Widget>[
                  ListView(),
                  Column(
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
                                      prefixIcon: Icon(Icons.search,
                                          color: Colors.grey),
                                      hintText: 'Search',
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
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
                                    search = searchCntrller.text;
                                    allProductList();
                                  },
                                  child: Text('Search'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: productList!.data.length > 0
                            ? ListView.builder(
                                itemCount: productList!.data.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8, top: 8),
                                    child: GestureDetector(
                                      onTap: () {
                                        var productId = productList!
                                            .data[index].productId
                                            .toString();
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ProductDetailScreen(
                                                    id: widget.id,
                                                    productId: productId),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.blueGrey[50],
                                        ),
                                        child: ListTile(
                                          leading: Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(productList!
                                                    .data[index].image),
                                              ),
                                              color: Colors.grey,
                                            ),
                                            width: 60,
                                            height: 120,
                                          ),
                                          title: Text(productList!
                                              .data[index].productName),
                                          subtitle: Text(productList!
                                              .data[index].productCode),
                                          trailing: Text(productList!
                                              .data[index].sellingPrice),
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
                    ],
                  ),
                ]),
              ));
  }

  checkConnectiVity() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      dataConnection = true;
      if (dataConnection == true) {
        setState(() {
          allProductList();
        });
      }
    } else {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.red,
            ),
            height: 70,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'No Network connection',
                    style: TextStyle(color: Colors.white),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    child: const Text(
                      'Retry',
                      style: TextStyle(color: Colors.black),
                    ),
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
