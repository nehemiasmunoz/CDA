class BasicActivityModel {
  String title;
  List<String> evidenceType;
  String? imgUrl;
  String? imgConceptUrl;
  String description;
  String instruccion;

  BasicActivityModel({
    required this.title,
    required this.evidenceType,
    this.imgUrl,
    required this.description,
    this.imgConceptUrl,
    required this.instruccion,
  });
}
