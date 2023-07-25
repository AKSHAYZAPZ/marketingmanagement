// To parse this JSON data, do
//
//     final cashPayment = cashPaymentFromJson(jsonString);

import 'dart:convert';

CashPayment cashPaymentFromJson(String str) => CashPayment.fromJson(json.decode(str));

String cashPaymentToJson(CashPayment data) => json.encode(data.toJson());

class CashPayment {
  bool status;
  String message;
  bool data;

  CashPayment({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CashPayment.fromJson(Map<String, dynamic> json) => CashPayment(
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
