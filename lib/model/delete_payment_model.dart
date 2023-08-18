// To parse this JSON data, do
//
//     final deletePayment = deletePaymentFromJson(jsonString);

import 'dart:convert';

DeletePayment deletePaymentFromJson(String str) => DeletePayment.fromJson(json.decode(str));

String deletePaymentToJson(DeletePayment data) => json.encode(data.toJson());

class DeletePayment {
  bool status;
  String message;
  bool data;

  DeletePayment({
    required this.status,
    required this.message,
    required this.data,
  });

  factory DeletePayment.fromJson(Map<String, dynamic> json) => DeletePayment(
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
