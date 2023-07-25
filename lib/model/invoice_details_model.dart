// To parse this JSON data, do
//
//     final invoiceDetailsModel = invoiceDetailsModelFromJson(jsonString);

import 'dart:convert';

InvoiceDetailsModel invoiceDetailsModelFromJson(String str) => InvoiceDetailsModel.fromJson(json.decode(str));

String invoiceDetailsModelToJson(InvoiceDetailsModel data) => json.encode(data.toJson());

class InvoiceDetailsModel {
  bool status;
  String message;
  Data data;

  InvoiceDetailsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory InvoiceDetailsModel.fromJson(Map<String, dynamic> json) => InvoiceDetailsModel(
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
  String invoiceNo;
  String invoiceDate;
  int total;
  List<OrderDetail> orderDetails;

  Data({
    required this.shopName,
    required this.invoiceNo,
    required this.invoiceDate,
    required this.total,
    required this.orderDetails,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    shopName: json["shop_name"],
    invoiceNo: json["invoice_no"],
    invoiceDate: json["invoice_date"],
    total: json["total"],
    orderDetails: List<OrderDetail>.from(json["order_details"].map((x) => OrderDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "shop_name": shopName,
    "invoice_no": invoiceNo,
    "invoice_date": invoiceDate,
    "total": total,
    "order_details": List<dynamic>.from(orderDetails.map((x) => x.toJson())),
  };
}

class OrderDetail {
  String productCode;
  String productName;
  String orderDate;
  String quantity;
  int price;

  OrderDetail({
    required this.productCode,
    required this.productName,
    required this.orderDate,
    required this.quantity,
    required this.price,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
    productCode: json["product_code"],
    productName: json["product_name"],
    orderDate: json["order_date"],
    quantity: json["quantity"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "product_code": productCode,
    "product_name": productName,
    "order_date": orderDate,
    "quantity": quantity,
    "price": price,
  };
}
