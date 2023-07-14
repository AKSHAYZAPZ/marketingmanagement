
import 'dart:convert';

Attendance attendanceFromJson(String str) => Attendance.fromJson(json.decode(str));

String attendanceToJson(Attendance data) => json.encode(data.toJson());

class Attendance {
  bool status;
  String message;
  bool data;

  Attendance({
    required this.status,
    required this.message,
    required this.data,
  });

  factory Attendance.fromJson(Map<String, dynamic> json) => Attendance(
    status: json["status"],
    message: json["message"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data,
  };
}
