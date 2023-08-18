// To parse this JSON data, do
//
//     final routelist = routelistFromJson(jsonString);

import 'dart:convert';

Routelist routelistFromJson(String str) => Routelist.fromJson(json.decode(str));

String routelistToJson(Routelist data) => json.encode(data.toJson());

class Routelist {
  bool status;
  String message;
  List<Datum> data;

  Routelist({
    required this.status,
    required this.message,
    required this.data,
  });

  factory Routelist.fromJson(Map<String, dynamic> json) => Routelist(
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
  String id;
  String route;

  Datum({
    required this.id,
    required this.route,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    route: json["route"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "route": route,
  };
}
