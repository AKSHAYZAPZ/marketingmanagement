import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jibin_s_application1/model/sendotp_model.dart';
import '../model/Reset_model.dart';
import '../model/addshopmodel.dart';
import '../model/allshops_model.dart';
import '../model/attendance_model.dart';
import '../model/checknumber.dart';
import '../model/collection_model.dart';
import '../model/dashboard_model.dart';
import '../model/routemodel.dart';
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

  static Future shopList(token, searchkey, route) async {
    var shoplistResponse = await http.post(
      Uri.parse("${baseurl}dashboard"),
      body: ({'token': token, 'search_key': searchkey, 'route': route}),
    );
    // print(shoplistResponse.statusCode);
    if (shoplistResponse.statusCode == 200) {
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
      shopname, adress, phone, whatsapp, gst, route, token) async {
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
        'openingBalance': '',
        'latitude': '',
        'longitude': '',
      }),
    );

    if (addShopResponse.statusCode == 200) {
      // print('status code:  ${addShopResponse.statusCode}');
      return addshopFromJson(addShopResponse.body);
    } else {
      print('status code:  ${addShopResponse.statusCode}');
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
      print('Response: ${response.body}');
      return checkNumberFromJson(response.body);
    } else {
      // Error in the request
      print('Error: ${response.statusCode}');
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
      print(verifyresponse.statusCode);
    }
  }

  static Future resetPassword(mob, password) async {
    final params = {'phoneNumber': mob, 'password': password};
    print('params    : $params');
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
      print(resetResponse.statusCode);
    }
  }

  static Future getCollection(token, fdate, tdate) async {
    final params = {'token': token, 'fdate': fdate, 'tdate': tdate};
    http.Response CollectionResp = await http.get(
      Uri.parse("${baseurl}collectionReport").replace(
        queryParameters: params,
      ),
    );
    if (CollectionResp.statusCode == 200) {
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

  static Future allShops(token, searchkey) async {
    // print('token----------- $token');
    // print('searchkey----------- $searchkey');
    http.Response response = await http.post(
      Uri.parse("${baseurl}getExecuitiveShopDetails"),
      body: ({
        'token': token,
        'search_key': searchkey,
      }),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      // print("----------------------------------${response.body}");
      return allshopsFromJson(response.body);
    }
  }

 static Future shopDetails(shopid,token)async{
    http.post(Uri.parse("${baseurl}markAttendance"));
 }
}
