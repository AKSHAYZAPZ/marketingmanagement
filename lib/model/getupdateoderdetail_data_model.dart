// To parse this JSON data, do
//
//     final getupdateOderDetail = getupdateOderDetailFromJson(jsonString);

import 'dart:convert';

GetupdateOderDetail getupdateOderDetailFromJson(String str) => GetupdateOderDetail.fromJson(json.decode(str));

String getupdateOderDetailToJson(GetupdateOderDetail data) => json.encode(data.toJson());

class GetupdateOderDetail {
  bool status;
  String message;
  Data data;

  GetupdateOderDetail({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetupdateOderDetail.fromJson(Map<String, dynamic> json) => GetupdateOderDetail(
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
  String orderMasterId;
  String orderDetailId;
  String categoryId;
  String categoryName;
  String productId;
  String productName;
  String sellingPrice;
  String productCode;
  String brandName;
  String requestedQty;
  String totalAmount;

  Data({
    required this.orderMasterId,
    required this.orderDetailId,
    required this.categoryId,
    required this.categoryName,
    required this.productId,
    required this.productName,
    required this.sellingPrice,
    required this.productCode,
    required this.brandName,
    required this.requestedQty,
    required this.totalAmount,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    orderMasterId: json["order_master_id"],
    orderDetailId: json["order_detail_id"],
    categoryId: json["category_id"],
    categoryName: json["category_name"],
    productId: json["product_id"],
    productName: json["product_name"],
    sellingPrice: json["selling_price"],
    productCode: json["product_code"],
    brandName: json["brand_name"],
    requestedQty: json["requested_qty"],
    totalAmount: json["total_amount"],
  );

  Map<String, dynamic> toJson() => {
    "order_master_id": orderMasterId,
    "order_detail_id": orderDetailId,
    "category_id": categoryId,
    "category_name": categoryName,
    "product_id": productId,
    "product_name": productName,
    "selling_price": sellingPrice,
    "product_code": productCode,
    "brand_name": brandName,
    "requested_qty": requestedQty,
    "total_amount": totalAmount,
  };
}
