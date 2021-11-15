// To parse this JSON data, do
//
//     final assignment = assignmentFromMap(jsonString);

import 'dart:convert';

class AssignmentModel {
  AssignmentModel({
    required this.name,
  });

  String name;
  String? id;
  factory AssignmentModel.fromJson(String str) =>
      AssignmentModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AssignmentModel.fromMap(Map<String, dynamic> json) => AssignmentModel(
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
      };
}
