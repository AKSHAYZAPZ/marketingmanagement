// To parse this JSON data, do
//
//     final dashboard = dashboardFromJson(jsonString);

import 'dart:convert';

Dashboard dashboardFromJson(String str) => Dashboard.fromJson(json.decode(str));

String dashboardToJson(Dashboard data) => json.encode(data.toJson());

class Dashboard {
  bool status;
  String message;
  Data data;

  Dashboard({
    required this.status,
    required this.message,
    required this.data,
  });

  factory Dashboard.fromJson(Map<String, dynamic> json) => Dashboard(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  bool attendance;
  String profileImg;
  List<ShopDetail> shopDetails;

  Data({
    required this.attendance,
    required this.profileImg,
    required this.shopDetails,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    attendance: json["attendance"],
    profileImg: json["profile_img"],
    shopDetails: List<ShopDetail>.from(json["shop_details"].map((x) => ShopDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "attendance": attendance,
    "profile_img": profileImg,
    "shop_details": List<dynamic>.from(shopDetails.map((x) => x.toJson())),
  };
}

class ShopDetail {
  int shopid;
  String shopName;
  String address;
  String phoneNumber;
  String whatsappNumber;
  String createdAt;
  String route;
  int openingBalance;
  int balance;

  ShopDetail({
    required this.shopid,
    required this.shopName,
    required this.address,
    required this.phoneNumber,
    required this.whatsappNumber,
    required this.createdAt,
    required this.route,
    required this.openingBalance,
    required this.balance,
  });

  factory ShopDetail.fromJson(Map<String, dynamic> json) => ShopDetail(
    shopid: json["shopid"],
    shopName: json["shopName"],
    address: json["address"],
    phoneNumber: json["phoneNumber"],
    whatsappNumber: json["whatsappNumber"],
    createdAt: json["created_at"],
    route: json["route"],
    openingBalance: json["openingBalance"],
    balance: json["balance"],
  );

  Map<String, dynamic> toJson() => {
    "shopid": shopid,
    "shopName": shopName,
    "address": address,
    "phoneNumber": phoneNumber,
    "whatsappNumber": whatsappNumber,
    "created_at": createdAt,
    "route": route,
    "openingBalance": openingBalance,
    "balance": balance,
  };
}
