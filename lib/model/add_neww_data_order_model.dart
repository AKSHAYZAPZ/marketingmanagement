// To parse this JSON data, do
//
//     final addNewDataInOrder = addNewDataInOrderFromJson(jsonString);

import 'dart:convert';

AddNewDataInOrder addNewDataInOrderFromJson(String str) => AddNewDataInOrder.fromJson(json.decode(str));

String addNewDataInOrderToJson(AddNewDataInOrder data) => json.encode(data.toJson());

class AddNewDataInOrder {
  bool status;
  String message;
  bool data;

  AddNewDataInOrder({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AddNewDataInOrder.fromJson(Map<String, dynamic> json) => AddNewDataInOrder(
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
