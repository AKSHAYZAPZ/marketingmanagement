// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
  bool status;
  String message;
  List<Datum> data;

  Products({
    required this.status,
    required this.message,
    required this.data,
  });

  factory Products.fromJson(Map<String, dynamic> json) => Products(
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
  String categoryName;
  String categoryImage;
  List<ProductDetail> productDetails;

  Datum({
    required this.categoryName,
    required this.categoryImage,
    required this.productDetails,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    categoryName: json["categoryName"],
    categoryImage: json["category_image"],
    productDetails: List<ProductDetail>.from(json["productDetails"].map((x) => ProductDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "categoryName": categoryName,
    "category_image": categoryImage,
    "productDetails": List<dynamic>.from(productDetails.map((x) => x.toJson())),
  };
}

class ProductDetail {
  String categoryId;
  String productName;
  String productCode;
  String sellingPrice;

  ProductDetail({
    required this.categoryId,
    required this.productName,
    required this.productCode,
    required this.sellingPrice,
  });

  factory ProductDetail.fromJson(Map<String, dynamic> json) => ProductDetail(
    categoryId: json["category_id"],
    productName: json["product_name"],
    productCode: json["product_code"],
    sellingPrice: json["selling_price"],
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "product_name": productName,
    "product_code": productCode,
    "selling_price": sellingPrice,
  };
}
