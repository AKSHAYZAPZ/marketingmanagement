import 'dart:convert';

Addshop addshopFromJson(String str) => Addshop.fromJson(json.decode(str));

String addshopToJson(Addshop data) => json.encode(data.toJson());

class Addshop {
  bool status;
  String message;
  String data;

  Addshop({
    required this.status,
    required this.message,
    required this.data,
  });

  factory Addshop.fromJson(Map<String, dynamic> json) => Addshop(
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
