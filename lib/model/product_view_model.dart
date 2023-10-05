// To parse this JSON data, do
//
//     final productView = productViewFromJson(jsonString);

import 'dart:convert';

ProductView productViewFromJson(String str) => ProductView.fromJson(json.decode(str));

String productViewToJson(ProductView data) => json.encode(data.toJson());

class ProductView {
  bool status;
  String message;
  Data data;

  ProductView({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ProductView.fromJson(Map<String, dynamic> json) => ProductView(
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
  int productId;
  int categoryId;
  int subcategoryId;
  String productName;
  String productCode;
  String sellingPrice;
  String description;
  List<Image> image;

  Data({
    required this.productId,
    required this.categoryId,
    required this.subcategoryId,
    required this.productName,
    required this.productCode,
    required this.sellingPrice,
    required this.description,
    required this.image,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    productId: json["product_id"],
    categoryId: json["category_id"],
    subcategoryId: json["subcategory_id"],
    productName: json["product_name"],
    productCode: json["product_code"],
    sellingPrice: json["selling_price"],
    description: json["description"],
    image: List<Image>.from(json["image"].map((x) => Image.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "category_id": categoryId,
    "subcategory_id": subcategoryId,
    "product_name": productName,
    "product_code": productCode,
    "selling_price": sellingPrice,
    "description": description,
    "image": List<dynamic>.from(image.map((x) => x.toJson())),
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
