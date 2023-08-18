// To parse this JSON data, do
//
//     final updatePayment = updatePaymentFromJson(jsonString);

import 'dart:convert';

UpdatePayment updatePaymentFromJson(String str) => UpdatePayment.fromJson(json.decode(str));

String updatePaymentToJson(UpdatePayment data) => json.encode(data.toJson());

class UpdatePayment {
  bool status;
  String message;
  bool data;

  UpdatePayment({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UpdatePayment.fromJson(Map<String, dynamic> json) => UpdatePayment(
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
