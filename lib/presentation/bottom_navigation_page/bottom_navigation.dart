import 'package:flutter/material.dart';
import 'package:jibin_s_application1/core/app_export.dart';
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
              icon:Icon(Icons.collections_bookmark_outlined),
              label: 'Collection'
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
            child: ShopsScreen(),
          ),
          Offstage(
            offstage: _currentIndex != 2,
            child: CategoryScreen(id: widget.id),
          ),
          Offstage(
            offstage: _currentIndex != 3,
            child: CollectionScreen(id: widget.id),
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
}
