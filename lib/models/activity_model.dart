import 'dart:convert';

class ActivityModel {
  ActivityModel({
    required this.activityCode,
    required this.assignment,
    required this.concept,
    required this.description,
    required this.evidenceType,
    required this.image,
    required this.instruction,
    required this.learningStyle,
  });

  String activityCode;
  String assignment;
  String concept;
  String description;
  String evidenceType;
  String image;
  String instruction;
  List<String> learningStyle;
  String? id;

  factory ActivityModel.fromJson(String str) =>
      ActivityModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ActivityModel.fromMap(Map<String, dynamic> json) => ActivityModel(
        activityCode: json["activity_code"],
        assignment: json["assignment"],
        concept: json["concept"],
        description: json["description"],
        evidenceType: json["evidence_type"],
        image: json["image"],
        instruction: json["instruction"],
        learningStyle: List<String>.from(json["learning_style"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "activity_code": activityCode,
        "assignment": assignment,
        "concept": concept,
        "description": description,
        "evidence_type": evidenceType,
        "image": image,
        "instruction": instruction,
        "learning_style": List<dynamic>.from(learningStyle.map((x) => x)),
      };
}
