// To parse this JSON data, do
//
//     final allProductList = allProductListFromJson(jsonString);

import 'dart:convert';

AllProductList allProductListFromJson(String str) => AllProductList.fromJson(json.decode(str));

String allProductListToJson(AllProductList data) => json.encode(data.toJson());

class AllProductList {
  bool status;
  String message;
  List<Datum> data;

  AllProductList({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AllProductList.fromJson(Map<String, dynamic> json) => AllProductList(
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
  String productName;
  String productCode;
  int sellingPrice;

  Datum({
    required this.id,
    required this.productName,
    required this.productCode,
    required this.sellingPrice,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    productName: json["product_name"],
    productCode: json["product_code"],
    sellingPrice: json["selling_price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_name": productName,
    "product_code": productCode,
    "selling_price": sellingPrice,
  };
}
