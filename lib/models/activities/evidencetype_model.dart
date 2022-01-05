import 'dart:convert';

class Evidencetype {
  Evidencetype({
    required this.code,
    required this.name,
  });

  String code;
  String name;

  factory Evidencetype.fromJson(String str) =>
      Evidencetype.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Evidencetype.fromMap(Map<String, dynamic> json) => Evidencetype(
        code: json["code"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "name": name,
      };
}
