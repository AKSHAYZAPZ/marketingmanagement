// To parse this JSON data, do
//
//     final collection = collectionFromJson(jsonString);

import 'dart:convert';

Collection collectionFromJson(String str) => Collection.fromJson(json.decode(str));

String collectionToJson(Collection data) => json.encode(data.toJson());

class Collection {
  bool status;
  String message;
  Data data;

  Collection({
    required this.status,
    required this.message,
    required this.data,
  });

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
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
  int cashAmount;
  int bankAmount;
  int totalAmount;
  List<CollectionReport> collectionReport;

  Data({
    required this.cashAmount,
    required this.bankAmount,
    required this.totalAmount,
    required this.collectionReport,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    cashAmount: json["cash_amount"],
    bankAmount: json["bank_amount"],
    totalAmount: json["total_amount"],
    collectionReport: List<CollectionReport>.from(json["collection_report"].map((x) => CollectionReport.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "cash_amount": cashAmount,
    "bank_amount": bankAmount,
    "total_amount": totalAmount,
    "collection_report": List<dynamic>.from(collectionReport.map((x) => x.toJson())),
  };
}

class CollectionReport {
  String shopName;
  int paidAmount;
  String paymentMethod;
  String date;

  CollectionReport({
    required this.shopName,
    required this.paidAmount,
    required this.paymentMethod,
    required this.date,
  });

  factory CollectionReport.fromJson(Map<String, dynamic> json) => CollectionReport(
    shopName: json["shop_name"],
    paidAmount: json["paidAmount"],
    paymentMethod: json["PaymentMethod"],
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "shop_name": shopName,
    "paidAmount": paidAmount,
    "PaymentMethod": paymentMethod,
    "date": date,
  };
}
