// To parse this JSON data, do
//
//     final learning = learningFromMap(jsonString);

import 'dart:convert';

class LearningModel {
  LearningModel({
    required this.icon,
    required this.name,
  });

  String icon;
  String name;
  String? id;

  factory LearningModel.fromJson(String str) =>
      LearningModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LearningModel.fromMap(Map<String, dynamic> json) => LearningModel(
        icon: json["icon"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "icon": icon,
        "name": name,
      };
}
