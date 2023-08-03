// To parse this JSON data, do
//
//     final productList = productListFromJson(jsonString);

import 'dart:convert';

ProductList productListFromJson(String str) => ProductList.fromJson(json.decode(str));

String productListToJson(ProductList data) => json.encode(data.toJson());

class ProductList {
  bool status;
  String message;
  List<Datum> data;

  ProductList({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
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
  int categoryId;
  int productId;
  String productName;
  String productCode;
  String sellingPrice;
  String image;

  Datum({
    required this.categoryId,
    required this.productId,
    required this.productName,
    required this.productCode,
    required this.sellingPrice,
    required this.image,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    categoryId: json["category_id"],
    productId: json["product_id"],
    productName: json["product_name"],
    productCode: json["product_code"],
    sellingPrice: json["selling_price"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "product_id": productId,
    "product_name": productName,
    "product_code": productCode,
    "selling_price": sellingPrice,
    "image": image,
  };
}
