// To parse this JSON data, do
//
//     final sendotp = sendotpFromJson(jsonString);

import 'dart:convert';

Sendotp sendotpFromJson(String str) => Sendotp.fromJson(json.decode(str));

String sendotpToJson(Sendotp data) => json.encode(data.toJson());

class Sendotp {
  bool status;
  String message;
  bool data;

  Sendotp({
    required this.status,
    required this.message,
    required this.data,
  });

  factory Sendotp.fromJson(Map<String, dynamic> json) => Sendotp(
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
