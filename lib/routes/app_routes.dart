import 'package:flutter/material.dart';
import 'package:jibin_s_application1/presentation/splash_screen/splash_screen.dart';
import 'package:jibin_s_application1/presentation/login_screen/login_screen.dart';
import 'package:jibin_s_application1/presentation/home_dashboard_screen/home_dashboard_screen.dart';
import 'package:jibin_s_application1/presentation/add_shop_screen/add_shop_screen.dart';
import 'package:jibin_s_application1/presentation/shops_screen/shops_screen.dart';
import 'package:jibin_s_application1/presentation/shop_details_tab_container_screen/shop_details_tab_container_screen.dart';
import 'package:jibin_s_application1/presentation/product_d_screen/product_d_screen.dart';
import 'package:jibin_s_application1/presentation/collection_screen/collection_screen.dart';
import 'package:jibin_s_application1/presentation/take_order_screen/take_order_screen.dart';
import 'package:jibin_s_application1/presentation/app_navigation_screen/app_navigation_screen.dart';

import '../presentation/category_screen/category_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String loginScreen = '/login_screen';

  static const String homeDashboardScreen = '/home_dashboard_screen';

  static const String addShopScreen = '/add_shop_screen';

  static const String shopsScreen = '/shops_screen';

  static const String shopDetailsOnePage = '/shop_details_one_page';

  static const String shopDetailsPage = '/shop_details_page';

  static const String shopDetailsTabContainerScreen =
      '/shop_details_tab_container_screen';

  static const String productScreen = '/product_screen';

  static const String productDScreen = '/product_d_screen';

  static const String collectionScreen = '/collection_screen';

  static const String takeOrderScreen = '/take_order_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => SplashScreen(),
    loginScreen: (context) => LoginScreen(),
    homeDashboardScreen: (context) => HomeDashboardScreen(id: '',),
    addShopScreen: (context) => AddShopScreen(token: '',),
    shopsScreen: (context) => ShopsScreen(id: ''),
    // shopDetailsTabContainerScreen: (context) => ShopDetailsTabContainerScreen(),
    productScreen: (context) => CategoryScreen(id: '',),
    productDScreen: (context) => ProductDScreen(),
    collectionScreen: (context) => CollectionScreen(id: '',),
    // takeOrderScreen: (context) => TakeOrderScreen(),
    appNavigationScreen: (context) => AppNavigationScreen()
  };
}
