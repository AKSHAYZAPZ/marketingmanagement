// To parse this JSON data, do
//
//     final markVisit = markVisitFromJson(jsonString);

import 'dart:convert';

MarkVisit markVisitFromJson(String str) => MarkVisit.fromJson(json.decode(str));

String markVisitToJson(MarkVisit data) => json.encode(data.toJson());

class MarkVisit {
  bool status;
  String message;
  bool data;

  MarkVisit({
    required this.status,
    required this.message,
    required this.data,
  });

  factory MarkVisit.fromJson(Map<String, dynamic> json) => MarkVisit(
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
