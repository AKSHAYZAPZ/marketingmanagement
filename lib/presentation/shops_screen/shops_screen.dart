import 'package:jibin_s_application1/presentation/home_dashboard_screen/home_dashboard_screen.dart';
import 'package:jibin_s_application1/services/service.dart';
import '../../model/allshops_model.dart';
import '../../shared_prefrence/shared_preference.dart';
import '../bottom_navigation_page/bottom_navigation.dart';
import '../shops_screen/widgets/shops_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:jibin_s_application1/core/app_export.dart';
import 'package:jibin_s_application1/widgets/app_bar/appbar_image.dart';
import 'package:jibin_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:jibin_s_application1/widgets/app_bar/custom_app_bar.dart';

class ShopsScreen extends StatefulWidget {
  ShopsScreen({Key? key}) : super(key: key);

  @override
  State<ShopsScreen> createState() => _ShopsScreenState();
}

class _ShopsScreenState extends State<ShopsScreen> {
  TextEditingController searchCntrller = TextEditingController();

  Allshops? allshops;

  var searchKey = '';
  var token = '';

  @override
  void initState() {
    super.initState();
    getid();
  }

  getid() async {
    token = await CommonFuntion.getSavedKey('token');
    // print('this is token: $token');
    setState(() {
      getShops();
    });
  }

  getShops() async {
    allshops = await HttpService.allShops(token, searchKey);
    if (allshops!.data.length > 0) {
      setState(() {});
    }
    // print(allshops);
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
                  builder: (context) => BottomNavigationScreen(id: token),
                ),
              );
            },
          ),
        ),
        body: allshops == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: SizedBox(
                  width: double.maxFinite,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, top: 5),
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
                                width: 5,
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
                                    token
                                  );
                                })
                            : Text('No Data'),
                      )),
                    ],
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
          builder: (context) => BottomNavigationScreen(id: token),
        ));
  }
}
