// To parse this JSON data, do
//
//     final deleteShop = deleteShopFromJson(jsonString);

import 'dart:convert';

DeleteShop deleteShopFromJson(String str) => DeleteShop.fromJson(json.decode(str));

String deleteShopToJson(DeleteShop data) => json.encode(data.toJson());

class DeleteShop {
  bool status;
  String message;
  bool data;

  DeleteShop({
    required this.status,
    required this.message,
    required this.data,
  });

  factory DeleteShop.fromJson(Map<String, dynamic> json) => DeleteShop(
    status: json["status"],
    message: json["message"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data,
  };
}
