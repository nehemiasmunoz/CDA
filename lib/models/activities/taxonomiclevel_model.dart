import 'dart:convert';

class TaxonomiclevelModel {
  TaxonomiclevelModel({
    required this.area,
    required this.level,
  });

  String area;
  String level;

  factory TaxonomiclevelModel.fromJson(String str) =>
      TaxonomiclevelModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TaxonomiclevelModel.fromMap(Map<String, dynamic> json) =>
      TaxonomiclevelModel(
        area: json["area"],
        level: json["level"],
      );

  Map<String, dynamic> toMap() => {
        "area": area,
        "level": level,
      };
}
