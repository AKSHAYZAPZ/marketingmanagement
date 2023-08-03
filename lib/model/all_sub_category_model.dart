// To parse this JSON data, do
//
//     final allSubCategory = allSubCategoryFromJson(jsonString);

import 'dart:convert';

AllSubCategory allSubCategoryFromJson(String str) => AllSubCategory.fromJson(json.decode(str));

String allSubCategoryToJson(AllSubCategory data) => json.encode(data.toJson());

class AllSubCategory {
  bool status;
  String message;
  Data data;

  AllSubCategory({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AllSubCategory.fromJson(Map<String, dynamic> json) => AllSubCategory(
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
  List<Subcategory> subcategory;
  List<Product> products;

  Data({
    required this.subcategory,
    required this.products,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    subcategory: List<Subcategory>.from(json["subcategory"].map((x) => Subcategory.fromJson(x))),
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "subcategory": List<dynamic>.from(subcategory.map((x) => x.toJson())),
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
  };
}

class Product {
  int categoryId;
  int subCategoryId;
  int productId;
  String productName;
  String productCode;
  String sellingPrice;
  String image;

  Product({
    required this.categoryId,
    required this.subCategoryId,
    required this.productId,
    required this.productName,
    required this.productCode,
    required this.sellingPrice,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    categoryId: json["category_id"],
    subCategoryId: json["sub_category_id"],
    productId: json["product_id"],
    productName: json["product_name"],
    productCode: json["product_code"],
    sellingPrice: json["selling_price"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "sub_category_id": subCategoryId,
    "product_id": productId,
    "product_name": productName,
    "product_code": productCode,
    "selling_price": sellingPrice,
    "image": image,
  };
}

class Subcategory {
  int subcategoryId;
  int categoryId;
  String subcategoryName;
  String subcategoryImage;

  Subcategory({
    required this.subcategoryId,
    required this.categoryId,
    required this.subcategoryName,
    required this.subcategoryImage,
  });

  factory Subcategory.fromJson(Map<String, dynamic> json) => Subcategory(
    subcategoryId: json["subcategory_id"],
    categoryId: json["category_id"],
    subcategoryName: json["subcategory_name"],
    subcategoryImage: json["subcategory_image"],
  );

  Map<String, dynamic> toJson() => {
    "subcategory_id": subcategoryId,
    "category_id": categoryId,
    "subcategory_name": subcategoryName,
    "subcategory_image": subcategoryImage,
  };
}
