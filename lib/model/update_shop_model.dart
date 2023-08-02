// To parse this JSON data, do
//
//     final updateShop = updateShopFromJson(jsonString);

import 'dart:convert';

UpdateShop updateShopFromJson(String str) => UpdateShop.fromJson(json.decode(str));

String updateShopToJson(UpdateShop data) => json.encode(data.toJson());

class UpdateShop {
  bool status;
  String message;
  bool data;

  UpdateShop({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UpdateShop.fromJson(Map<String, dynamic> json) => UpdateShop(
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
