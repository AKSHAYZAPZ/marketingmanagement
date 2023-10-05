// To parse this JSON data, do
//
//     final postingExpense = postingExpenseFromJson(jsonString);

import 'dart:convert';

PostingExpense postingExpenseFromJson(String str) => PostingExpense.fromJson(json.decode(str));

String postingExpenseToJson(PostingExpense data) => json.encode(data.toJson());

class PostingExpense {
  bool status;
  String message;
  bool data;

  PostingExpense({
    required this.status,
    required this.message,
    required this.data,
  });

  factory PostingExpense.fromJson(Map<String, dynamic> json) => PostingExpense(
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
