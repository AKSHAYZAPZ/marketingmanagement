// To parse this JSON data, do
//
//     final paymentType = paymentTypeFromJson(jsonString);

import 'dart:convert';

PaymentType paymentTypeFromJson(String str) => PaymentType.fromJson(json.decode(str));

String paymentTypeToJson(PaymentType data) => json.encode(data.toJson());

class PaymentType {
  bool status;
  String message;
  List<Datum> data;

  PaymentType({
    required this.status,
    required this.message,
    required this.data,
  });

  factory PaymentType.fromJson(Map<String, dynamic> json) => PaymentType(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  int id;
  String type;

  Datum({
    required this.id,
    required this.type,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
  };
}
