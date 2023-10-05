// To parse this JSON data, do
//
//     final getExpens = getExpensFromJson(jsonString);

import 'dart:convert';

GetExpens getExpensFromJson(String str) => GetExpens.fromJson(json.decode(str));

String getExpensToJson(GetExpens data) => json.encode(data.toJson());

class GetExpens {
  bool status;
  String message;
  Data data;

  GetExpens({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetExpens.fromJson(Map<String, dynamic> json) => GetExpens(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  String expenseId;
  String expenseCategoryId;
  String expenseCategory;
  String amount;
  String remark;
  String file;

  Data({
    required this.expenseId,
    required this.expenseCategoryId,
    required this.expenseCategory,
    required this.amount,
    required this.remark,
    required this.file,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    expenseId: json["expense_id"],
    expenseCategoryId: json["expense_category_id"],
    expenseCategory: json["expense_category"],
    amount: json["amount"],
    remark: json["remark"],
    file: json["file"],
  );

  Map<String, dynamic> toJson() => {
    "expense_id": expenseId,
    "expense_category_id": expenseCategoryId,
    "expense_category": expenseCategory,
    "amount": amount,
    "remark": remark,
    "file": file,
  };
}
