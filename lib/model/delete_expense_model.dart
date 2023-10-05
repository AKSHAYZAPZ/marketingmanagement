// To parse this JSON data, do
//
//     final deleteExpense = deleteExpenseFromJson(jsonString);

import 'dart:convert';

DeleteExpense deleteExpenseFromJson(String str) => DeleteExpense.fromJson(json.decode(str));

String deleteExpenseToJson(DeleteExpense data) => json.encode(data.toJson());

class DeleteExpense {
  bool status;
  String message;
  bool data;

  DeleteExpense({
    required this.status,
    required this.message,
    required this.data,
  });

  factory DeleteExpense.fromJson(Map<String, dynamic> json) => DeleteExpense(
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
