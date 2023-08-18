// To parse this JSON data, do
//
//     final updateOderdetail = updateOderdetailFromJson(jsonString);

import 'dart:convert';

UpdateOderdetail updateOderdetailFromJson(String str) => UpdateOderdetail.fromJson(json.decode(str));

String updateOderdetailToJson(UpdateOderdetail data) => json.encode(data.toJson());

class UpdateOderdetail {
  bool status;
  String message;
  bool data;

  UpdateOderdetail({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UpdateOderdetail.fromJson(Map<String, dynamic> json) => UpdateOderdetail(
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
