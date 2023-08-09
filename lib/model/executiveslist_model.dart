// To parse this JSON data, do
//
//     final executiveLists = executiveListsFromJson(jsonString);

import 'dart:convert';

ExecutiveLists executiveListsFromJson(String str) => ExecutiveLists.fromJson(json.decode(str));

String executiveListsToJson(ExecutiveLists data) => json.encode(data.toJson());

class ExecutiveLists {
  bool status;
  String message;
  List<Datum> data;

  ExecutiveLists({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ExecutiveLists.fromJson(Map<String, dynamic> json) => ExecutiveLists(
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
  String name;

  Datum({
    required this.id,
    required this.name,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
