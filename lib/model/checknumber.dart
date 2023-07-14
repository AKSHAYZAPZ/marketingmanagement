
import 'dart:convert';

CheckNumber checkNumberFromJson(String str) => CheckNumber.fromJson(json.decode(str));

String checkNumberToJson(CheckNumber data) => json.encode(data.toJson());

class CheckNumber {
  bool status;
  String message;
  bool data;

  CheckNumber({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CheckNumber.fromJson(Map<String, dynamic> json) => CheckNumber(
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
