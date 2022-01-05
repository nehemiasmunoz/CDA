// To parse this JSON data, do
//
//     final assignment = assignmentFromMap(jsonString);

import 'dart:convert';

class CoursesModel {
  CoursesModel({
    required this.name,
    required this.code,
  });

  String name;
  String? id;
  String code;
  factory CoursesModel.fromJson(String str) =>
      CoursesModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CoursesModel.fromMap(Map<String, dynamic> json) => CoursesModel(
        name: json["name"],
        code: json["code"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "code": code,
      };
}
