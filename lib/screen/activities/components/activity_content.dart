import 'package:centro_actividades/models/models.dart';
import 'package:centro_actividades/screen/components/rounded_container.dart';
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
    } else if (data.type == 'readquiz') {
      return QuizContent(data: data);
    } else {
      return Text('hi');
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
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: FadeInImage(
                height: 150.0,
                width: size.width * 9,
                fit: BoxFit.cover,
                placeholder: AssetImage('assets/loading.gif'),
                image: AssetImage(data.content[0].image),
              ),
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

class QuizContent extends StatefulWidget {
  QuizContent({Key? key, required this.data}) : super(key: key);

  ActivityModel data;

  @override
  State<QuizContent> createState() => _QuizContentState();
}

class _QuizContentState extends State<QuizContent> {
  var _options = '';
  var _mensaje = '';

  @override
  Widget build(BuildContext context) {
    final _correctAnswer = widget.data.correctanswer;
    final size = MediaQuery.of(context).size;
    final List<Alternative> alternatives = widget.data.content[0].alternatives!;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
      width: size.width * 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Descripcion', style: kSubtitleText),
          Text(
            widget.data.description,
            style: kNormalText,
            textAlign: TextAlign.justify,
          ),
          Text(
            widget.data.content[0].question,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            textAlign: TextAlign.justify,
          ),
          Card(
            elevation: 2.0,
            child: Column(
              children: [
                if (_mensaje != '')
                  Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: _mensaje != 'Has acertado'
                            ? Colors.red
                            : Colors.green,
                      ),
                      child: Text(
                        _mensaje,
                        style: TextStyle(color: Colors.white),
                      )),
                ...alternatives.map((e) {
                  return Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: kPrimaryLightColor),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: ListTile(
                      enableFeedback: true,
                      title: Text(
                        e.description,
                      ),
                      leading: Radio(
                        fillColor: MaterialStateProperty.all(kPrimaryColor),
                        value: e.name,
                        groupValue: _options,
                        onChanged: (String? value) => setState(() {
                          _options = value!;
                        }),
                      ),
                    ),
                  );
                }).toList(),
                RoundedContainer(
                  color: kPrimaryColor,
                  child: TextButton(
                    child: Text(
                      'Validar respuesta'.toUpperCase(),
                      style: kLabelStyle.copyWith(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        if (_options != '') {
                          if (_options != _correctAnswer) {
                            _mensaje = 'Eleccion equivocada';
                          } else {
                            _mensaje = 'Has acertado';
                          }
                        } else {
                          _mensaje = 'Selecciona una opcion';
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Text('Instruciones', style: kSubtitleText),
          Text(
            widget.data.instructions,
            style: kNormalText,
            textAlign: TextAlign.justify,
          )
        ],
      ),
    );
  }
}

class ARContent extends StatelessWidget {
  ARContent({Key? key, required this.data}) : super(key: key);

  ActivityModel data;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
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
