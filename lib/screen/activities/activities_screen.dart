import 'package:centro_actividades/screen/activities/templates/basic_activity_template.dart';
import 'package:flutter/material.dart';

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Actividades'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.reorder),
          )
        ],
      ),
      body: BasicActivity(),
    );
  }
}
