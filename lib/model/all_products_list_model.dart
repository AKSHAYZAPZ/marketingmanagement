// To parse this JSON data, do
//
//     final allProductLists = allProductListsFromJson(jsonString);

import 'dart:convert';

List<AllProductLists> allProductListsFromJson(String str) => List<AllProductLists>.from(json.decode(str).map((x) => AllProductLists.fromJson(x)));

String allProductListsToJson(List<AllProductLists> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllProductLists {
  int productId;
  int categoryid;
  String productName;
  String productCode;
  int sellingPrice;

  AllProductLists({
    required this.productId,
    required this.categoryid,
    required this.productName,
    required this.productCode,
    required this.sellingPrice,
  });

  factory AllProductLists.fromJson(Map<String, dynamic> json) => AllProductLists(
    productId: json["product_id"],
    categoryid: json["categoryid"],
    productName: json["product_name"],
    productCode: json["product_code"],
    sellingPrice: json["selling_price"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "categoryid": categoryid,
    "product_name": productName,
    "product_code": productCode,
    "selling_price": sellingPrice,
  };
}
