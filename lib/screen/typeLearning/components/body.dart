import 'package:flutter/material.dart';
import 'package:centro_actividades/utils/icono_string.dart';
import 'package:centro_actividades/screen/typeLearning/models/logic/typeLearning_brain.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  final TypeLearningBrain learningBrain = TypeLearningBrain();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: learningBrain.getLength(),
      itemBuilder: (BuildContext context, index) {
        return _buildCard(size, index);
      },
    );
  }

  Container _buildCard(Size size, int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 2.5),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      margin: EdgeInsets.all(10.0),
      child: Row(
        children: [
          getIcon(learningBrain.getInfo(index)[1]),
          Spacer(),
          Text(
            learningBrain.getInfo(index)[0],
            style: TextStyle(fontSize: 20.0),
          ),
        ],
      ),
    );
  }
}
