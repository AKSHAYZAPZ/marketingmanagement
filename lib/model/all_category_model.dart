// To parse this JSON data, do
//
//     final allCategory = allCategoryFromJson(jsonString);

import 'dart:convert';

AllCategory allCategoryFromJson(String str) => AllCategory.fromJson(json.decode(str));

String allCategoryToJson(AllCategory data) => json.encode(data.toJson());

class AllCategory {
  bool status;
  String message;
  List<Datum> data;

  AllCategory({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AllCategory.fromJson(Map<String, dynamic> json) => AllCategory(
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
  String categoryName;
  String categoryImage;

  Datum({
    required this.id,
    required this.categoryName,
    required this.categoryImage,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    categoryName: json["category_name"],
    categoryImage: json["category_image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_name": categoryName,
    "category_image": categoryImage,
  };
}
