import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:jibin_s_application1/model/product_view_model.dart';
import 'package:jibin_s_application1/services/service.dart';

import '../model/product_by_id_model.dart';

class ProductDetailScreen extends StatefulWidget {
  ProductDetailScreen({Key? key, required this.id, required this.productId})
      : super(key: key);

  String id;
  String productId;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
//   ProductById? prouctById;
  var currentIndex = 0;
  ProductView? productView;
  bool dataConnection =false;

  @override
  void initState() {
    super.initState();
    checkConnectiVity();
  }

  product() async {
    productView = await HttpService.productViews(widget.id, widget.productId);
    if (productView != null) {
      setState(() {});
    }
  }

  Future<void> _onRefresh() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      product();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('ProductName'),
      ),
      body: productView == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: _onRefresh,
              child: Stack(
                children: <Widget>[
                  ListView(),
                  Padding(
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
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(productView!.data
                                        .image[currentIndex].productImage)),
                                borderRadius: BorderRadius.circular(18)),
                          ),
                        ),
                        Container(
                          height: 80,
                          child: ListView.builder(
                            itemCount: productView!.data.image.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    currentIndex = index;
                                    setState(() {});
                                  },
                                  child: Container(
                                    width: 110,
                                    height: 70,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(productView!
                                              .data.image[index].productImage),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  productView!.data.productName,
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
                                    Text(
                                      '₹',
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    Text(
                                      productView!.data.sellingPrice,
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text('Product Code :'),
                                    Text(productView!.data.productCode),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  productView!.data.description,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(color: Colors.grey[600]),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
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
        setState(() {
          product();
        });
      }
    } else{
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          decoration: BoxDecoration(color: Colors.red,
          ),
          height: 70,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('No Network connection',style: TextStyle(color: Colors.white),),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: const Text('Retry',style: TextStyle(color: Colors.black),),
                  onPressed: (){
                    Navigator.pop(context);
                    checkConnectiVity();
                  },
                ),
              ],
            ),
          ),
        );
      },);
    }
  }
}
