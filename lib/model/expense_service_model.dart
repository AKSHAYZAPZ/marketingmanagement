// To parse this JSON data, do
//
//     final expenseService = expenseServiceFromJson(jsonString);

import 'dart:convert';

ExpenseService expenseServiceFromJson(String str) => ExpenseService.fromJson(json.decode(str));

String expenseServiceToJson(ExpenseService data) => json.encode(data.toJson());

class ExpenseService {
  bool status;
  String message;
  List<Datum> data;

  ExpenseService({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ExpenseService.fromJson(Map<String, dynamic> json) => ExpenseService(
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
  String id;
  String categoryName;

  Datum({
    required this.id,
    required this.categoryName,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    categoryName: json["category_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_name": categoryName,
  };
}
