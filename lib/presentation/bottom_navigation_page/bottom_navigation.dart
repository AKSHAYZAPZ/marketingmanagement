import 'package:flutter/material.dart';
import 'package:jibin_s_application1/presentation/product_screen/product_screen.dart';
import '../collection_screen/collection_screen.dart';
import '../home_dashboard_screen/home_dashboard_screen.dart';
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
        fixedColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.blue,
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
            child: ProductScreen(id: widget.id),
          ),
          Offstage(
            offstage: _currentIndex != 3,
            child: CollectionScreen(id: widget.id),
          ),
        // _pages[_currentIndex],
        ],
      ),
    );
  }
}
