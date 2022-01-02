import 'dart:convert';

class ContentModel {
  ContentModel({
    required this.concept,
    required this.image,
  });

  String concept;
  String image;

  factory ContentModel.fromJson(String str) =>
      ContentModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ContentModel.fromMap(Map<String, dynamic> json) => ContentModel(
        concept: json["concept"],
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "concept": concept,
        "image": image,
      };
}
