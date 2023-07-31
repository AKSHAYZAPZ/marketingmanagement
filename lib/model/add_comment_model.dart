// To parse this JSON data, do
//
//     final addComment = addCommentFromJson(jsonString);

import 'dart:convert';

AddComment addCommentFromJson(String str) => AddComment.fromJson(json.decode(str));

String addCommentToJson(AddComment data) => json.encode(data.toJson());

class AddComment {
  bool status;
  String message;
  bool data;

  AddComment({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AddComment.fromJson(Map<String, dynamic> json) => AddComment(
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
