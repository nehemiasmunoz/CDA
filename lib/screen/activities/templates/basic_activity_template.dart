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
              Text('Activity title'),
              EvidenceTypeBar(),
              Card(
                child: Text('Card Contenido'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
