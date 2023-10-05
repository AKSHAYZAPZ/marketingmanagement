import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jibin_s_application1/core/app_export.dart';
import 'package:jibin_s_application1/presentation/expense_screen/expense_screen.dart';
import '../category_screen/category_screen.dart';
import '../collection_screen/collection_screen.dart';
import '../home_dashboard_screen/home_dashboard_screen.dart';
import '../settings_screen/settings_screen.dart';
import '../shops_screen/shops_screen.dart';

class BottomNavigationScreen  extends StatefulWidget {
  final String id;
  BottomNavigationScreen({required this.id});

  @override
  State<BottomNavigationScreen > createState() => _MainPageState();
}

class _MainPageState extends State<BottomNavigationScreen > {

  bool  dataConnection = false;

  @override
  void initState() {
    super.initState();
    checkConnectiVity();
  }

  int _currentIndex = 0;
  // final List<Widget> _pages = [
  //   HomeDashboardScreen(id: '',),
  //   ShopsScreen(),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: ColorConstant.lightBlue700,
        unselectedItemColor: Colors.grey[400],
        backgroundColor: ColorConstant.lightBlue700,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
            checkConnectiVity();
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Shops'
          ),
          BottomNavigationBarItem(
              icon:Icon(Icons.view_list),
              label: 'Products'
          ),
          BottomNavigationBarItem(
              icon:Icon(Icons.receipt_long_outlined),
              label: 'Expense'
          ),
          BottomNavigationBarItem(
              icon:Icon(Icons.settings),
              label: 'Settings'
          ),
        ],
      ),
      body:
      Stack(
        children: [
          Offstage(
            offstage: _currentIndex != 0,
            child: HomeDashboardScreen(id: widget.id),
          ),
          Offstage(
            offstage: _currentIndex != 1,
            child: ShopsScreen(id: widget.id),
          ),
          Offstage(
            offstage: _currentIndex != 2,
            child: CategoryScreen(id: widget.id),
          ),
          Offstage(
            offstage: _currentIndex != 3,
            child: ExpenseScreen(id: widget.id),
          ),
          Offstage(
            offstage: _currentIndex != 4,
            child: SettingsScreen(id: widget.id),
          ),
        // _pages[_currentIndex],
        ],
      ),
    );
  }
  checkConnectiVity()async{
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      dataConnection =true;
      if(dataConnection==true){
        setState(() {

        });
      } else{
        setState(() {

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
