import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:jibin_s_application1/services/service.dart';
import '../../model/allshops_model.dart';
import '../../model/routemodel.dart';
import '../../shared_prefrence/shared_preference.dart';
import '../bottom_navigation_page/bottom_navigation.dart';
import '../shops_screen/widgets/shops_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:jibin_s_application1/core/app_export.dart';


class ShopsScreen extends StatefulWidget {
  ShopsScreen({Key? key,required this.id}) : super(key: key);
  String id;

  @override
  State<ShopsScreen> createState() => _ShopsScreenState();
}

class _ShopsScreenState extends State<ShopsScreen> {
  TextEditingController searchCntrller = TextEditingController();

  Allshops? allshops;
  Routelist? routelist;

  bool  dataConnection =false;

  var route ='';
  var searchKey = '';



  @override
  void initState() {
    super.initState();
    checkConnectiVity();
  }


  getRoutes() async {
    routelist = await HttpService.getRoute(widget.id);
    print(routelist);
    // print('routes---------- :${routelist!.data.length}');
    if (routelist == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      setState(() {});
    }
  }

  // getid() async {
  //   token = await CommonFuntion.getSavedKey('token');
  //   // print('this is token: $token');
  //   setState(() {
  //     getShops();
  //   });
  // }

  getShops() async {
    allshops = await HttpService.allShops(widget.id, searchKey, route);
    if (allshops!.data.length > 0) {
      setState(() {});
    }
    // print(allshops);
  }
  Future<void> _onRefresh() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      getShops();
      getRoutes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        appBar: AppBar(
          backgroundColor: ColorConstant.lightBlue700,
          centerTitle: true,
          title: Text('Shops'),
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
        body: allshops == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : RefreshIndicator(
          onRefresh: _onRefresh,
              child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 5, right: 5,),
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
                                        contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 10),
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
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    searchKey = searchCntrller.text;
                                    setState(() {
                                      getShops();
                                    });

                                    // shops  = await HttpService.shopList(widget.id,searchKey,route);
                                  },
                                  child: Text('Search'),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8,right: 8),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Shops",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle
                                      .txtDMSansBold20Black900),
                              DropdownButton(
                                underline: Container(),
                                value: route == '' ? null : route,
                                hint: Text('Select Route'),
                                items: routelist != null
                                    ? routelist!.data
                                    .map<DropdownMenuItem<String>>(
                                        (e) {
                                      return DropdownMenuItem<String>(
                                        value: e.id.toString(),
                                        child: Text(e.route),
                                      );
                                    }).toList()
                                    : null,
                                onChanged: (value) {
                                  setState(() {
                                    route = value.toString();
                                    getShops();
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: Padding(
                          padding: getPadding(top: 10, right: 4),
                          child: allshops!.data.length > 0
                              ? ListView.separated(
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                        height: getVerticalSize(19));
                                  },
                                  itemCount: allshops!.data.length,
                                  itemBuilder: (context, index) {
                                    return ShopsItemWidget(
                                      allshops!.data[index].shopName,
                                      allshops!.data[index].address,
                                      allshops!.data[index].id,
                                      allshops!.data[index].createdAt,
                                      allshops!.data[index].whatsappNo,
                                      allshops!.data[index].phoneNo,
                                        allshops!.data[index].balance,
                                        allshops!.data[index].route,
                                        widget.id
                                    );
                                  })
                              : Text('No Data'),
                        )),
                      ],
                    ),
                  ),
                ),
            ));
  }

  /// Navigates back to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is used
  /// to navigate back to the previous screen.
  onTapArrowleft1(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BottomNavigationScreen(id: widget.id),
        ));
  }

  checkConnectiVity()async{
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      dataConnection =true;
      if(dataConnection==true){
        getRoutes();
        getShops();
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
}
