// To parse this JSON data, do
//
//     final learningStyleModel = learningStyleModelFromMap(jsonString);

import 'dart:convert';

class LearningStyleModel {
  LearningStyleModel({
    required this.name,
    required this.icon,
    required this.code,
  });
  String name;
  String icon;
  String? id;
  String code;

  factory LearningStyleModel.fromJson(String str) =>
      LearningStyleModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LearningStyleModel.fromMap(Map<String, dynamic> json) =>
      LearningStyleModel(
        name: json["name"],
        icon: json["icon"],
        code: json["code"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "icon": icon,
        "code": code,
      };
}
