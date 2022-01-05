import 'dart:convert';

import 'package:centro_actividades/models/models.dart';

class ContentModel {
  ContentModel({
    required this.concept,
    required this.image,
    this.alternatives,
    required this.question,
    required this.resource,
  });

  String concept;
  String image;
  List<Alternative>? alternatives;
  String question;
  String resource;

  factory ContentModel.fromJson(String str) =>
      ContentModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ContentModel.fromMap(Map<String, dynamic> json) => ContentModel(
        concept: json["concept"] == null ? 'null' : json["concept"],
        image: json["image"] == null ? '' : json["image"],
        alternatives: json["alternatives"] == null
            ? null
            : List<Alternative>.from(
                json["alternatives"].map((x) => Alternative.fromMap(x))),
        question: json["question"] == null ? '' : json["question"],
        resource: json["resource"] == null ? '' : json["resource"],
      );

  Map<String, dynamic> toMap() => {
        "concept": concept == null ? null : concept,
        "image": image == null ? null : image,
        "alternatives": alternatives == null
            ? null
            : List<dynamic>.from(alternatives!.map((x) => x.toMap())),
        "question": question == null ? null : question,
        "resource": resource == null ? null : resource,
      };
}
