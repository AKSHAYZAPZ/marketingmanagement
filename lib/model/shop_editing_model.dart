// To parse this JSON data, do
//
//     final shopEdit = shopEditFromJson(jsonString);

import 'dart:convert';

ShopEdit shopEditFromJson(String str) => ShopEdit.fromJson(json.decode(str));

String shopEditToJson(ShopEdit data) => json.encode(data.toJson());

class ShopEdit {
  bool status;
  String message;
  Data data;

  ShopEdit({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ShopEdit.fromJson(Map<String, dynamic> json) => ShopEdit(
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
  String id;
  String name;
  String address;
  String phoneNumber;
  String whatsappNumber;
  String gstNo;
  String route;
  String openingBalance;

  Data({
    required this.id,
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.whatsappNumber,
    required this.gstNo,
    required this.route,
    required this.openingBalance,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id "],
    name: json["name "],
    address: json["address"],
    phoneNumber: json["phone_number"],
    whatsappNumber: json["whatsapp_number"],
    gstNo: json["gst_no"],
    route: json["route"],
    openingBalance: json["openingBalance "],
  );

  Map<String, dynamic> toJson() => {
    "id ": id,
    "name ": name,
    "address": address,
    "phone_number": phoneNumber,
    "whatsapp_number": whatsappNumber,
    "gst_no": gstNo,
    "route": route,
    "openingBalance ": openingBalance,
  };
}
