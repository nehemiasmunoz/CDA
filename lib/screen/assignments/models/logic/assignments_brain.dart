import 'package:centro_actividades/screen/assignments/models/assigments_model.dart';

class AssignmentsBrain {
  List<AssignmentsModel> _AssignmentsSamples = [
    AssignmentsModel(name: 'Calculo I'),
    AssignmentsModel(name: 'Calculo II'),
    AssignmentsModel(name: 'Principios de la modelacion matematica'),
    AssignmentsModel(name: 'Fundamentos de matematicas'),
    AssignmentsModel(name: 'Funciones algebraicas y trascendentes'),
    AssignmentsModel(name: 'Matematicas para la toma de decisiones'),
    AssignmentsModel(name: 'Trigonometria e introduccion a la estadistica'),
  ];

  int getLength() {
    return _AssignmentsSamples.length;
  }

  String getName(index) {
    return _AssignmentsSamples[index].name;
  }
}
