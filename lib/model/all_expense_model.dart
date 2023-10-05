// To parse this JSON data, do
//
//     final allExpense = allExpenseFromJson(jsonString);

import 'dart:convert';

AllExpense allExpenseFromJson(String str) => AllExpense.fromJson(json.decode(str));

String allExpenseToJson(AllExpense data) => json.encode(data.toJson());

class AllExpense {
  bool status;
  String message;
  Data data;

  AllExpense({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AllExpense.fromJson(Map<String, dynamic> json) => AllExpense(
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
  String totalExpense;
  String totalReimbursement;
  int balance;
  List<ExpenseDetail> expenseDetails;

  Data({
    required this.totalExpense,
    required this.totalReimbursement,
    required this.balance,
    required this.expenseDetails,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    totalExpense: json["totalExpense"],
    totalReimbursement: json["totalReimbursement"],
    balance: json["balance"],
    expenseDetails: List<ExpenseDetail>.from(json["expenseDetails"].map((x) => ExpenseDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "totalExpense": totalExpense,
    "totalReimbursement": totalReimbursement,
    "balance": balance,
    "expenseDetails": List<dynamic>.from(expenseDetails.map((x) => x.toJson())),
  };
}

class ExpenseDetail {
  String expenseId;
  String expenseCategoryId;
  String expenseCategory;
  String amount;
  String remark;
  String file;
  String createdAt;

  ExpenseDetail({
    required this.expenseId,
    required this.expenseCategoryId,
    required this.expenseCategory,
    required this.amount,
    required this.remark,
    required this.file,
    required this.createdAt,
  });

  factory ExpenseDetail.fromJson(Map<String, dynamic> json) => ExpenseDetail(
    expenseId: json["expense_id"],
    expenseCategoryId: json["expense_category_id"],
    expenseCategory: json["expense_category"],
    amount: json["amount"],
    remark: json["remark"],
    file: json["file"],
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "expense_id": expenseId,
    "expense_category_id": expenseCategoryId,
    "expense_category": expenseCategory,
    "amount": amount,
    "remark": remark,
    "file": file,
    "created_at": createdAt,
  };
}
