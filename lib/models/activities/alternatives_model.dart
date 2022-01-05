import 'dart:convert';

class Alternative {
  Alternative({
    required this.description,
    required this.name,
  });

  String description;
  String name;

  factory Alternative.fromJson(String str) =>
      Alternative.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Alternative.fromMap(Map<String, dynamic> json) => Alternative(
        description: json["description"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "description": description,
        "name": name,
      };
}
