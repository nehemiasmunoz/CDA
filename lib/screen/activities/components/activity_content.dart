import 'package:centro_actividades/models/models.dart';
import 'package:centro_actividades/utils/constant.dart';
import 'package:flutter/material.dart';

class ActivityContent extends StatelessWidget {
  ActivityContent({Key? key, required this.data}) : super(key: key);

  ActivityModel data;

  @override
  Widget build(BuildContext context) {
    if (data.type == 'concept') {
      return ConceptContent(
        data: data,
      );
    } else {
      return QuizContent(
        data: data,
      );
    }
  }
}

class ConceptContent extends StatelessWidget {
  ConceptContent({Key? key, required this.data}) : super(key: key);

  ActivityModel data;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      child: Container(
        padding: EdgeInsets.all(10.0),
        width: size.width * 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Descripcion', style: kSubtitleText),
            Text(
              data.description + ' ' + data.content[0].concept,
              style: kNormalText,
              textAlign: TextAlign.justify,
            ),
            Text('Instruciones', style: kSubtitleText),
            Text(
              data.instructions,
              style: kNormalText,
              textAlign: TextAlign.justify,
            )
          ],
        ),
      ),
    );
  }
}

class QuizContent extends StatelessWidget {
  QuizContent({Key? key, required this.data}) : super(key: key);

  ActivityModel data;
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
