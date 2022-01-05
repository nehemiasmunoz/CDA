import 'dart:convert';

class Content {
  Content({
    required this.concept,
    required this.image,
  });

  String concept;
  String image;

  factory Content.fromJson(String str) => Content.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Content.fromMap(Map<String, dynamic> json) => Content(
        concept: json["concept"],
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "concept": concept,
        "image": image,
      };
}
