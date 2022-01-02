// To parse this JSON data, do
//
//     final activityModel = activityModelFromMap(jsonString);

import 'dart:convert';

import 'package:centro_actividades/models/models.dart';

class ActivityModel {
  ActivityModel({
    required this.code,
    required this.content,
    required this.correctanswer,
    required this.course,
    required this.description,
    required this.evidencetype,
    required this.grade,
    required this.imagepath,
    required this.instructions,
    required this.learningstyle,
    required this.score,
    required this.taxonomiclevel,
    required this.type,
    required this.unit,
  });

  String code;
  List<ContentModel> content;
  String correctanswer;
  String course;
  String description;
  List<EvidencetypeModel> evidencetype;
  String grade;
  String imagepath;
  String instructions;
  List<EvidencetypeModel> learningstyle;
  int score;
  List<TaxonomiclevelModel> taxonomiclevel;
  String type;
  String unit;
  String? id;

  factory ActivityModel.fromJson(String str) =>
      ActivityModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ActivityModel.fromMap(Map<String, dynamic> json) => ActivityModel(
        code: json["code"],
        content: List<ContentModel>.from(
            json["content"].map((x) => ContentModel.fromMap(x))),
        correctanswer: json["correctanswer"],
        course: json["course"],
        description: json["description"],
        evidencetype: List<EvidencetypeModel>.from(
            json["evidencetype"].map((x) => EvidencetypeModel.fromMap(x))),
        grade: json["grade"],
        imagepath: json["imagepath"],
        instructions: json["instructions"],
        learningstyle: List<EvidencetypeModel>.from(
            json["learningstyle"].map((x) => EvidencetypeModel.fromMap(x))),
        score: json["score"],
        taxonomiclevel: List<TaxonomiclevelModel>.from(
            json["taxonomiclevel"].map((x) => TaxonomiclevelModel.fromMap(x))),
        type: json["type"],
        unit: json["unit"],
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "content": List<dynamic>.from(content.map((x) => x.toMap())),
        "correctanswer": correctanswer,
        "course": course,
        "description": description,
        "evidencetype": List<dynamic>.from(evidencetype.map((x) => x.toMap())),
        "grade": grade,
        "imagepath": imagepath,
        "instructions": instructions,
        "learningstyle":
            List<dynamic>.from(learningstyle.map((x) => x.toMap())),
        "score": score,
        "taxonomiclevel":
            List<dynamic>.from(taxonomiclevel.map((x) => x.toMap())),
        "type": type,
        "unit": unit,
      };
}
