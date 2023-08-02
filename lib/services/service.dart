import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jibin_s_application1/model/post_oder_model.dart';
import 'package:jibin_s_application1/model/sendotp_model.dart';
import '../model/Reset_model.dart';
import '../model/add_comment_model.dart';
import '../model/addshopmodel.dart';
import '../model/all_products_list_model.dart';
import '../model/allshops_model.dart';
import '../model/attendance_model.dart';
import '../model/cashpayment_model.dart';
import '../model/checknumber.dart';
import '../model/collection_model.dart';
import '../model/dashboard_model.dart';
import '../model/delete_shop_model.dart';
import '../model/invoice_details_model.dart';
import '../model/mark_visit_model.dart';
import '../model/oder_details_model.dart';
import '../model/payment_type_model.dart';
import '../model/product_by_id_model.dart';
import '../model/products_model.dart';
import '../model/routemodel.dart';
import '../model/shop_details_model.dart';
import '../model/shop_editing_model.dart';
import '../model/update_shop_model.dart';
import '../model/usermodel.dart';

class HttpService {
  static var baseurl = 'https://dev.login2.in/MeMa/MobileApi/';

  //check the login----------------check the login

  static Future checkLogin(mobile, password) async {
    var response = await http.post(
      Uri.parse("${baseurl}login"),
      body: ({'phone': mobile, 'password': password}),
    );
    if (response.statusCode == 200) {
      // print('Status code: ${response.statusCode}');
      // print(response.body);
      return userModelFromJson(response.body);
    } else {}
  }

  // Dashboard----------------Dashboard

  static Future Dashborad(token, searchkey, route) async {
    var shoplistResponse = await http.post(
      Uri.parse("${baseurl}dashboard"),
      body: ({'token': token, 'search_key': searchkey, 'route': route}),
    );
    // print(shoplistResponse.statusCode);
    if (shoplistResponse.statusCode == 200) {
      // print(shoplistResponse.body);
      return dashboardFromJson(shoplistResponse.body);
    } else {
      // print('shops: ${shoplistResponse.statusCode}');
      return;
    }
  }

  // geting all routes ----------------------------geting all routes

  static Future getRoute(token) async {
    var routeRsponse = await http.post(
      Uri.parse("${baseurl}getExecuitiveRoute"),
      body: ({'token': token}),
    );
    // print('new response : ${routeRsponse.statusCode}');
    if (routeRsponse.statusCode == 200) {
      // print(routeRsponse.body);
      return routelistFromJson(routeRsponse.body);
    } else {}
  }

  // shop adding ----------------------------- shop adding

  static Future addShop(
      shopname, adress, phone, whatsapp, gst, route, token,balance) async {
    var addShopResponse = await http.post(
      Uri.parse("${baseurl}addShop"),
      body: ({
        'name': shopname,
        'address': adress,
        'phone_number': phone,
        'whatsapp_number': whatsapp,
        'gst_no': gst,
        'route': route,
        'token': token,
        'openingBalance': balance,
        'latitude': '',
        'longitude': '',
      }),
    );

    if (addShopResponse.statusCode == 200) {
      // print('status code:  ${addShopResponse.statusCode}');
      return addshopFromJson(addShopResponse.body);
    } else {
      // print('status code:  ${addShopResponse.statusCode}');
    }
  }

  static Future checkPhoneNumber(String phonenum) async {
    // Encode the value
    String encodedValue = Uri.encodeComponent(phonenum);

    // Create the URL with the encoded value
    String url = '${baseurl}checkPhoneNumber?phoneNumber=$encodedValue';

    // Send the GET request
    http.Response response = await http.get(
      Uri.parse(url),
    );

    // Handle the response
    if (response.statusCode == 200) {
      // Successful request
      // print('Response: ${response.body}');
      return checkNumberFromJson(response.body);
    } else {
      // Error in the request
      // print('Error: ${response.statusCode}');
    }
  }

  static Future verifyOtp(phone, otp) async {
    final params = {'phoneNumber': phone, 'otp': otp};
    http.Response verifyresponse = await http.get(
      Uri.parse('${baseurl}sendOTP').replace(
        queryParameters: params,
      ),
    );
    if (verifyresponse.statusCode == 200) {
      // print(verifyresponse.statusCode);
      // print('Response: ${verifyresponse.body}');
      return sendotpFromJson(verifyresponse.body);
    } else {
      // print(verifyresponse.statusCode);
    }
  }

  static Future resetPassword(mob, password) async {
    final params = {'phoneNumber': mob, 'password': password};
    // print('params    : $params');
    http.Response resetResponse = await http.get(
      Uri.parse("${baseurl}resetPassword").replace(
        queryParameters: params,
      ),
    );
    if (resetResponse.statusCode == 200) {
      // print(resetResponse.statusCode);
      // print('Response: ${resetResponse.body}');
      return resetPasswordFromJson(resetResponse.body);
    } else {
      // print(resetResponse.statusCode);
    }
  }

  static Future getCollection(token, fdate, tdate,search) async {
    // print('fdate -- $fdate');
    // print('tdate -- $tdate');
    // print(token);
    final params = {'token': token, 'fdate': fdate, 'tdate': tdate, 'searchkey': search};
    http.Response CollectionResp = await http.get(
      Uri.parse("${baseurl}collectionReport").replace(
        queryParameters: params,
      ),
    );
    // print(CollectionResp.statusCode);
    if (CollectionResp.statusCode == 200) {
      // print(CollectionResp.body);
      return collectionFromJson(CollectionResp.body);
    }
  }

  static Future markAttendance(latitude, longitude, token) async {
    http.Response response = await http.post(
      Uri.parse("${baseurl}markAttendance"),
      body: ({
        'latitude': latitude,
        'longitude': longitude,
        'token': token,
      }),
    );
    if (response.statusCode == 200) {
      return attendanceFromJson(response.body);
    } else {}
  }

  static Future allShops(token, searchkey,route) async {
    // print('token----------- $token');
    // print('searchkey----------- $searchkey');
    http.Response response = await http.post(
      Uri.parse("${baseurl}getExecuitiveShopDetails"),
      body: ({
        'token': token,
        'search_key': searchkey,
        'route' : route,
      }),
    );
    // print(response.statusCode);
    if (response.statusCode == 200) {
      // print("${response.body}");
      return allshopsFromJson(response.body);
    }
  }

  static Future shopDetails(shopid, token, fdate, tdate) async {
    // print(shopid);
    // print(token);
    // print(fdate);
    // print(tdate);
    http.Response response =
        await http.post(Uri.parse("${baseurl}shopDetailsByID"),
            body: ({
              'shop_id': shopid,
              'token': token,
              'fdate': fdate,
              'tdate': tdate,
            }));
    if (response.statusCode == 200) {
      return shopDetailsFromJson(response.body);
    }
  }

  static Future getProducts(token, searchkey) async {
    http.Response response = await http.post(
      Uri.parse("${baseurl}productDetails"),
      body: ({
        'token': token,
        'search_key': searchkey,
      }),
    );
    // print(response.statusCode);
    if (response.statusCode == 200) {
      // print("${response.body}");
      return productsFromJson(response.body);
    }
  }

  static Future markVisit(shopid, latitude, longitude, token) async {
    http.Response response = await http.post(
      Uri.parse("${baseurl}addLocation"),
      body: ({
        'shop_id': shopid,
        'latitude': latitude,
        'longitude': longitude,
        'token': token,
      }),
    );
    if (response.statusCode == 200) {
      // print(response.statusCode);
      return markVisitFromJson(response.body);
    } else {}
  }

  static Future productDetailsByID(productid) async {
    http.Response response = await http.post(
      Uri.parse("${baseurl}productDetailsByID"),
      body: ({'product_id': productid}),
    );
    // print(response.statusCode);
    if (response.statusCode == 200) {
      return productByIdFromJson(response.body);
    } else {}
  }

  static Future allProductList(token) async {
    http.Response response = await http.post(
        Uri.parse("${baseurl}allProductDetails"),
        body: ({'token': token}));
    if (response.statusCode == 200) {
      // print(response.body);
      return allProductListsFromJson(response.body);
    }
  }

  static Future postOrders(
      shopid, orderdate, createdat, orderDetails, token) async {
    http.Response response = await http.post(
      Uri.parse("${baseurl}postOrders"),
      body: ({
        'shop_id': shopid,
        'order_date': orderdate,
        'created_at': createdat,
        'orderDetails': jsonEncode(orderDetails),
        'token': token,
      }),
    );
    if (response.statusCode == 200) {
      return postOderFromJson(response.body);
    } else {}
  }

  static Future orderDetailsByID(oderId, token) async {
    http.Response response = await http.post(
        Uri.parse("${baseurl}orderDetailsByID"),
        body: ({'token': token, 'order_id': oderId}));
    // print(response.statusCode);
    if (response.statusCode == 200) {
      return oderDetailsModelFromJson(response.body);
    } else {}
  }

  static Future invoiceDetailsByID(oderId, token) async {
    http.Response response = await http.post(
        Uri.parse("${baseurl}invoiceDetailsByID"),
        body: ({'token': token, 'order_id': oderId}));
    // print(response.statusCode);
    if (response.statusCode == 200) {
      return invoiceDetailsModelFromJson(response.body);
    } else {}
  }

  static Future paymentByCash(paidAmount, date, token, shopId,type) async {
    http.Response response = await http.post(
      Uri.parse("${baseurl}paymentByCash"),
      body: ({
        'paid_amount': paidAmount,
        'created_at': date,
        'token': token,
        'shop_id': shopId,
        'payment_type':type,
      }),
    );
    if (response.statusCode == 200) {
      return cashPaymentFromJson(response.body);
    }
  }

  static Future paymentTypes() async {
    http.Response response =
        await http.get(Uri.parse("${baseurl}paymentTypes"));
    if (response.statusCode == 200) {
      return paymentTypeFromJson(response.body);
    }
  }
  static Future addShopComments( token, shopId, comment) async {
    http.Response response = await http.post(
      Uri.parse("${baseurl}addShopComments"),
      body: ({
        'token': token,
        'shop_id': shopId,
        'comment':comment,
      }),
    );
    if (response.statusCode == 200) {
      // print(response.statusCode);
      return addCommentFromJson(response.body);
    }
  }

  static Future getShopDetailseditingData( token, shopId,) async {
    http.Response response = await http.post(
      Uri.parse("${baseurl}get_ShopDetails"),
      body: ({
        'token': token,
        'shop_id': shopId,
      }),
    );
    if (response.statusCode == 200) {
      return shopEditFromJson(response.body);
    }
  }

  static Future updateShop(
      shopname, adress, phone, whatsapp, gst, route, token,balance,shopid) async {
    http.Response response = await http.post(
      Uri.parse("${baseurl}updateShop"),
      body: ({
        'name': shopname,
        'address': adress,
        'phone_number': phone,
        'whatsapp_number': whatsapp,
        'gst_no': gst,
        'route': route,
        'token': token,
        'openingBalance': balance,
        'shop_id':shopid,
      }),
    );

    if (response.statusCode == 200) {
      // print('status code:  ${addShopResponse.statusCode}');
      return updateShopFromJson(response.body);
    } else {
      // print('status code:  ${addShopResponse.statusCode}');
    }
  }

  static Future deleteShop( token, shopId) async {
    http.Response response = await http.post(
      Uri.parse("${baseurl}deleteShop"),
      body: ({
        'token': token,
        'shop_id': shopId,
      }),
    );
    if (response.statusCode == 200) {
      return deleteShopFromJson(response.body);
    }
  }
}
