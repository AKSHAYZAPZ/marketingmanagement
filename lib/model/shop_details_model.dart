// To parse this JSON data, do
//
//     final shopDetails = shopDetailsFromJson(jsonString);

import 'dart:convert';

ShopDetails shopDetailsFromJson(String str) => ShopDetails.fromJson(json.decode(str));

String shopDetailsToJson(ShopDetails data) => json.encode(data.toJson());

class ShopDetails {
  bool status;
  String message;
  Data data;

  ShopDetails({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ShopDetails.fromJson(Map<String, dynamic> json) => ShopDetails(
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
  String address;
  String phoneNumber;
  String whatsappNumber;
  String gstNo;
  String createdAt;
  int balance;
  List<Detail> orderDetails;
  List<Detail> invoiceDetails;
  List<PaymentDetail> paymentDetails;
  int orderTotal;
  int paymentTotal;
  int invoiceTotal;

  Data({
    required this.shopName,
    required this.address,
    required this.phoneNumber,
    required this.whatsappNumber,
    required this.gstNo,
    required this.createdAt,
    required this.balance,
    required this.orderDetails,
    required this.invoiceDetails,
    required this.paymentDetails,
    required this.orderTotal,
    required this.paymentTotal,
    required this.invoiceTotal,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    shopName: json["shop_name"],
    address: json["address"],
    phoneNumber: json["phone_number"],
    whatsappNumber: json["whatsapp_number"],
    gstNo: json["gst_no"],
    createdAt: json["created_at"],
    balance: json["balance"],
    orderDetails: List<Detail>.from(json["orderDetails"].map((x) => Detail.fromJson(x))),
    invoiceDetails: List<Detail>.from(json["invoiceDetails"].map((x) => Detail.fromJson(x))),
    paymentDetails: List<PaymentDetail>.from(json["paymentDetails"].map((x) => PaymentDetail.fromJson(x))),
    orderTotal: json["order_total"],
    paymentTotal: json["payment_total"],
    invoiceTotal: json["invoice_total"],
  );

  Map<String, dynamic> toJson() => {
    "shop_name": shopName,
    "address": address,
    "phone_number": phoneNumber,
    "whatsapp_number": whatsappNumber,
    "gst_no": gstNo,
    "created_at": createdAt,
    "balance": balance,
    "orderDetails": List<dynamic>.from(orderDetails.map((x) => x.toJson())),
    "invoiceDetails": List<dynamic>.from(invoiceDetails.map((x) => x.toJson())),
    "paymentDetails": List<dynamic>.from(paymentDetails.map((x) => x.toJson())),
    "order_total": orderTotal,
    "payment_total": paymentTotal,
    "invoice_total": invoiceTotal,
  };
}

class Detail {
  int id;
  String invoiceNo;
  String billNo;
  String orderDate;
  String quantity;
  int price;
  String createdBy;
  bool isEdit;
  String? status;

  Detail({
    required this.id,
    required this.invoiceNo,
    required this.billNo,
    required this.orderDate,
    required this.quantity,
    required this.price,
    required this.createdBy,
    required this.isEdit,
    this.status,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    id: json["id"],
    invoiceNo: json["invoice_no"],
    billNo: json["bill_no"],
    orderDate: json["order_date"],
    quantity: json["quantity"],
    price: json["price"],
    createdBy: json["created_by"],
    isEdit: json["is_edit"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "invoice_no": invoiceNo,
    "bill_no": billNo,
    "order_date": orderDate,
    "quantity": quantity,
    "price": price,
    "created_by": createdBy,
    "is_edit": isEdit,
    "status": status,
  };
}

class PaymentDetail {
  String paidAmount;
  String paymentId;
  String paymentType;
  String createdAt;
  String createdBy;
  bool isEdit;

  PaymentDetail({
    required this.paidAmount,
    required this.paymentId,
    required this.paymentType,
    required this.createdAt,
    required this.createdBy,
    required this.isEdit,
  });

  factory PaymentDetail.fromJson(Map<String, dynamic> json) => PaymentDetail(
    paidAmount: json["paid_amount"],
    paymentId: json["payment_id"],
    paymentType: json["payment_type"],
    createdAt: json["created_at"],
    createdBy: json["created_by"],
    isEdit: json["is_edit"],
  );

  Map<String, dynamic> toJson() => {
    "paid_amount": paidAmount,
    "payment_id": paymentId,
    "payment_type": paymentType,
    "created_at": createdAt,
    "created_by": createdBy,
    "is_edit": isEdit,
  };
}
