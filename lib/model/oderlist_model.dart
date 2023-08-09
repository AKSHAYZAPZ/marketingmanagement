// To parse this JSON data, do
//
//     final oderlists = oderlistsFromJson(jsonString);

import 'dart:convert';

Oderlists oderlistsFromJson(String str) => Oderlists.fromJson(json.decode(str));

String oderlistsToJson(Oderlists data) => json.encode(data.toJson());

class Oderlists {
  bool status;
  String message;
  List<Datum> data;

  Oderlists({
    required this.status,
    required this.message,
    required this.data,
  });

  factory Oderlists.fromJson(Map<String, dynamic> json) => Oderlists(
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
  int id;
  String shopName;
  String orderId;
  String? datumOrderDate;
  String? datumCreatedBy;
  String quantity;
  int price;
  String? datumOrderStatus;
  String? orderDate;
  String? createdBy;
  String? orderStatus;

  Datum({
    required this.id,
    required this.shopName,
    required this.orderId,
    this.datumOrderDate,
    this.datumCreatedBy,
    required this.quantity,
    required this.price,
    this.datumOrderStatus,
    this.orderDate,
    this.createdBy,
    this.orderStatus,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    shopName: json["shop_name"],
    orderId: json["order_id"],
    datumOrderDate: json["order_date "],
    datumCreatedBy: json["created_by "],
    quantity: json["quantity"],
    price: json["price"],
    datumOrderStatus: json["order_status "],
    orderDate: json["order_date"],
    createdBy: json["created_by"],
    orderStatus: json["order_status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "shop_name": shopName,
    "order_id": orderId,
    "order_date ": datumOrderDate,
    "created_by ": datumCreatedBy,
    "quantity": quantity,
    "price": price,
    "order_status ": datumOrderStatus,
    "order_date": orderDate,
    "created_by": createdBy,
    "order_status": orderStatus,
  };
}
