// To parse this JSON data, do
//
//     final deleteOderDetailId = deleteOderDetailIdFromJson(jsonString);

import 'dart:convert';

DeleteOderDetailId deleteOderDetailIdFromJson(String str) => DeleteOderDetailId.fromJson(json.decode(str));

String deleteOderDetailIdToJson(DeleteOderDetailId data) => json.encode(data.toJson());

class DeleteOderDetailId {
  bool status;
  String message;
  bool data;

  DeleteOderDetailId({
    required this.status,
    required this.message,
    required this.data,
  });

  factory DeleteOderDetailId.fromJson(Map<String, dynamic> json) => DeleteOderDetailId(
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
