// To parse this JSON data, do
//
//     final learningStyleModel = learningStyleModelFromMap(jsonString);

import 'dart:convert';

class LearningStyleModel {
  LearningStyleModel({
    required this.name,
    required this.icon,
  });
  String name;
  String icon;
  String? id;

  factory LearningStyleModel.fromJson(String str) =>
      LearningStyleModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LearningStyleModel.fromMap(Map<String, dynamic> json) =>
      LearningStyleModel(
        name: json["name"],
        icon: json["icon"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "icon": icon == null ? null : icon,
      };
}
