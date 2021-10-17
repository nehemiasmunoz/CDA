class PreviewActivityModel {
  String name;
  String description;

  PreviewActivityModel(this.name, this.description);

  static List<PreviewActivityModel> samples = [
    PreviewActivityModel(
      'Debate',
      'Te invito a compartir tu opinión, de acuerdo siguiente tema o problema determinado:',
    ),
    PreviewActivityModel(
      'Hangman',
      'Encuentra el concepto relacionados con esta definición',
    ),
    PreviewActivityModel(
      'Investigacion',
      'Realice una investigación complementaria asociada al siguiente concepto:',
    ),
  ];
  //TODO: crear metodo que traiga todas las actividades correspondiente a la asignatura desde base de datos
}
