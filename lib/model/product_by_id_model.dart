// To parse this JSON data, do
//
//     final prouctById = prouctByIdFromJson(jsonString);

import 'dart:convert';

ProuctById prouctByIdFromJson(String str) => ProuctById.fromJson(json.decode(str));

String prouctByIdToJson(ProuctById data) => json.encode(data.toJson());

class ProuctById {
  bool status;
  String message;
  Data data;

  ProuctById({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ProuctById.fromJson(Map<String, dynamic> json) => ProuctById(
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
  String categoryId;
  String productName;
  String productCode;
  String sellingPrice;
  List<Image> images;

  Data({
    required this.categoryId,
    required this.productName,
    required this.productCode,
    required this.sellingPrice,
    required this.images,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    categoryId: json["category_id"],
    productName: json["product_name"],
    productCode: json["product_code"],
    sellingPrice: json["selling_price"],
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "product_name": productName,
    "product_code": productCode,
    "selling_price": sellingPrice,
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
  };
}

class Image {
  String productImage;

  Image({
    required this.productImage,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    productImage: json["product_image"],
  );

  Map<String, dynamic> toJson() => {
    "product_image": productImage,
  };
}
