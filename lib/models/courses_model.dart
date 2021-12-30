// To parse this JSON data, do
//
//     final assignment = assignmentFromMap(jsonString);

import 'dart:convert';

class CoursesModel {
  CoursesModel({
    required this.name,
  });

  String name;
  String? id;

  factory CoursesModel.fromJson(String str) =>
      CoursesModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CoursesModel.fromMap(Map<String, dynamic> json) => CoursesModel(
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
      };
}
