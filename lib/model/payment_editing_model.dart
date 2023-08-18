// To parse this JSON data, do
//
//     final editPayment = editPaymentFromJson(jsonString);

import 'dart:convert';

EditPayment editPaymentFromJson(String str) => EditPayment.fromJson(json.decode(str));

String editPaymentToJson(EditPayment data) => json.encode(data.toJson());

class EditPayment {
  bool status;
  String message;
  Data data;

  EditPayment({
    required this.status,
    required this.message,
    required this.data,
  });

  factory EditPayment.fromJson(Map<String, dynamic> json) => EditPayment(
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
  int shopId;
  String payMethod;
  int paymentMethodId;
  int payAmount;
  int paymentId;
  String createdAt;

  Data({
    required this.shopName,
    required this.shopId,
    required this.payMethod,
    required this.paymentMethodId,
    required this.payAmount,
    required this.paymentId,
    required this.createdAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    shopName: json["shop_name"],
    shopId: json["shop_id"],
    payMethod: json["payMethod"],
    paymentMethodId: json["payment_method_id"],
    payAmount: json["payAmount"],
    paymentId: json["payment_id"],
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "shop_name": shopName,
    "shop_id": shopId,
    "payMethod": payMethod,
    "payment_method_id": paymentMethodId,
    "payAmount": payAmount,
    "payment_id": paymentId,
    "created_at": createdAt,
  };
}
