// To parse this JSON data, do
//
//     final postOder = postOderFromJson(jsonString);

import 'dart:convert';

PostOder postOderFromJson(String str) => PostOder.fromJson(json.decode(str));

String postOderToJson(PostOder data) => json.encode(data.toJson());

class PostOder {
  bool status;
  String message;
  bool data;

  PostOder({
    required this.status,
    required this.message,
    required this.data,
  });

  factory PostOder.fromJson(Map<String, dynamic> json) => PostOder(
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
