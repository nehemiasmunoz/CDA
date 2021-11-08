import 'package:centro_actividades/screen/typeLearning/components/body.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TypeLearningScreen extends StatelessWidget {
  TypeLearningScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tipos de Aprendizajes'),
      ),
      body: SafeArea(bottom: false, child: Body()),
    );
  }
}
