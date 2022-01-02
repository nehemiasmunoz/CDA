import 'dart:convert';

class EvidencetypeModel {
  EvidencetypeModel({
    required this.name,
  });

  String name;

  factory EvidencetypeModel.fromJson(String str) =>
      EvidencetypeModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EvidencetypeModel.fromMap(Map<String, dynamic> json) =>
      EvidencetypeModel(
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
      };
}
