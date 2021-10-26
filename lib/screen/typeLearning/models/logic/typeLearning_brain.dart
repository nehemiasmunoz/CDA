import 'package:centro_actividades/screen/typeLearning/models/typeLearning_model.dart';

class TypeLearningBrain {
  //Propiedades
  final List<TypeLearningModel> _samples = [
    TypeLearningModel(name: 'Naturalista', iconName: 'leaf'),
    TypeLearningModel(name: 'Musical', iconName: 'music'),
    TypeLearningModel(name: 'Linguistico', iconName: 'book'),
    TypeLearningModel(name: 'Visual', iconName: 'eye'),
    TypeLearningModel(name: 'Logico', iconName: 'calculator'),
    TypeLearningModel(name: 'Interpersonal', iconName: 'link'),
    TypeLearningModel(name: 'Intrapersonal', iconName: 'heart'),
    TypeLearningModel(name: 'Kinestesico', iconName: 'child'),
  ];

  //Metodos

  List<String> getInfo(index) {
    return [_samples[index].name, _samples[index].iconName];
  }

  int getLength() {
    return _samples.length;
  }
}
