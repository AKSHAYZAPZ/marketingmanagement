// To parse this JSON data, do
//
//     final onlinePayment = onlinePaymentFromJson(jsonString);

import 'dart:convert';

OnlinePayment onlinePaymentFromJson(String str) => OnlinePayment.fromJson(json.decode(str));

String onlinePaymentToJson(OnlinePayment data) => json.encode(data.toJson());

class OnlinePayment {
  bool status;
  String message;
  int data;

  OnlinePayment({
    required this.status,
    required this.message,
    required this.data,
  });

  factory OnlinePayment.fromJson(Map<String, dynamic> json) => OnlinePayment(
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
