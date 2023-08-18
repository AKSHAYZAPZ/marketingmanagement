// To parse this JSON data, do
//
//     final deleteOrder = deleteOrderFromJson(jsonString);

import 'dart:convert';

DeleteOrder deleteOrderFromJson(String str) => DeleteOrder.fromJson(json.decode(str));

String deleteOrderToJson(DeleteOrder data) => json.encode(data.toJson());

class DeleteOrder {
  bool status;
  String message;
  bool data;

  DeleteOrder({
    required this.status,
    required this.message,
    required this.data,
  });

  factory DeleteOrder.fromJson(Map<String, dynamic> json) => DeleteOrder(
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
