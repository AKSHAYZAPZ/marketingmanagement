class ApiData {
  final String code;
  final String name;

  ApiData({required this.code, required this.name});

  factory ApiData.fromJson(Map<String, dynamic> json) {
    return  ApiData(
      code: json['product_code'],
      name: json['product_name'],
    );
  }
}