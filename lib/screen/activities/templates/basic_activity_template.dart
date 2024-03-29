import 'package:centro_actividades/screen/activities/components/evidence_type.dart';
import 'package:flutter/material.dart';

class BasicActivity extends StatelessWidget {
  const BasicActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Card(
        elevation: 2.0,
        margin: EdgeInsets.all(12.0),
        child: Container(
          width: size.width * 1,
          child: Column(
            children: [
              Text(
                //TODO: remplazar con titulo de actividad bd
                'Activity title'.toUpperCase(),
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  leadingDistribution: TextLeadingDistribution.proportional,
                ),
              ),
              //TODO: enviar tipos de aprendizajes que acepta la actividad
              EvidenceTypeBar(),
              Card(
                child: Container(
                  width: size.width * 1,
                  child: Column(
                    children: [
                      // TODO: Falta crear estructura del contenido
                      Text('Card Contenido'),
                    ],
                  ),
                ),
              ),
              OutlinedButton.icon(
                // permitira agregar la actividad actual a una lista de actividades pendientes
                onPressed: () {},
                icon: Icon(Icons.add),
                label: Text('Agregar a la lista'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
