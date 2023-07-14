// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  bool status;
  String message;
  Data data;

  UserModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
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
  String token;
  String username;

  Data({
    required this.token,
    required this.username,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    token: json["token"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "username": username,
  };
}
