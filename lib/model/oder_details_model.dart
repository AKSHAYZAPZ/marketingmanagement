// To parse this JSON data, do
//
//     final oderDetailsModel = oderDetailsModelFromJson(jsonString);

import 'dart:convert';

OderDetailsModel oderDetailsModelFromJson(String str) => OderDetailsModel.fromJson(json.decode(str));

String oderDetailsModelToJson(OderDetailsModel data) => json.encode(data.toJson());

class OderDetailsModel {
  bool status;
  String message;
  Data data;

  OderDetailsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory OderDetailsModel.fromJson(Map<String, dynamic> json) => OderDetailsModel(
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
  String shopName;
  String shopId;
  String orderId;
  String orderDate;
  int total;
  String createdBy;
  bool isEditable;
  String orderMasterId;
  List<OrderDetail> orderDetails;

  Data({
    required this.shopName,
    required this.shopId,
    required this.orderId,
    required this.orderDate,
    required this.total,
    required this.createdBy,
    required this.isEditable,
    required this.orderMasterId,
    required this.orderDetails,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    shopName: json["shop_name"],
    shopId: json["shop_id"],
    orderId: json["orderId"],
    orderDate: json["order_date"],
    total: json["total"],
    createdBy: json["created_by"],
    isEditable: json["is_editable"],
    orderMasterId: json["order_master_id"],
    orderDetails: List<OrderDetail>.from(json["order_details"].map((x) => OrderDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "shop_name": shopName,
    "shop_id": shopId,
    "orderId": orderId,
    "order_date": orderDate,
    "total": total,
    "created_by": createdBy,
    "is_editable": isEditable,
    "order_master_id": orderMasterId,
    "order_details": List<dynamic>.from(orderDetails.map((x) => x.toJson())),
  };
}

class OrderDetail {
  String orderDetailsId;
  String productCode;
  String productName;
  String sellingPrice;
  String quantity;
  int price;

  OrderDetail({
    required this.orderDetailsId,
    required this.productCode,
    required this.productName,
    required this.sellingPrice,
    required this.quantity,
    required this.price,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
    orderDetailsId: json["order_details_id"],
    productCode: json["product_code"],
    productName: json["product_name"],
    sellingPrice: json["selling_price"],
    quantity: json["quantity"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "order_details_id": orderDetailsId,
    "product_code": productCode,
    "product_name": productName,
    "selling_price": sellingPrice,
    "quantity": quantity,
    "price": price,
  };
}
