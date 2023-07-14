// To parse this JSON data, do
//
//     final allshops = allshopsFromJson(jsonString);

import 'dart:convert';

Allshops allshopsFromJson(String str) => Allshops.fromJson(json.decode(str));

String allshopsToJson(Allshops data) => json.encode(data.toJson());

class Allshops {
  bool status;
  String message;
  List<Datum> data;

  Allshops({
    required this.status,
    required this.message,
    required this.data,
  });

  factory Allshops.fromJson(Map<String, dynamic> json) => Allshops(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  int id;
  String shopName;
  String address;
  String phoneNo;
  String whatsappNo;
  DateTime createdAt;

  Datum({
    required this.id,
    required this.shopName,
    required this.address,
    required this.phoneNo,
    required this.whatsappNo,
    required this.createdAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    shopName: json["shop_name"],
    address: json["address"],
    phoneNo: json["phone_no"],
    whatsappNo: json["whatsapp_no"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "shop_name": shopName,
    "address": address,
    "phone_no": phoneNo,
    "whatsapp_no": whatsappNo,
    "created_at": createdAt.toIso8601String(),
  };
}
