import 'dart:ui';

import 'package:centro_actividades/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:centro_actividades/screen/activities/preview_activity_model.dart';

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
      body: ListView.builder(
        itemCount: PreviewActivityModel.samples.length,
        itemBuilder: (BuildContext context, index) {
          return _buildCard(size: size, index: index);
        },
      ),
    );
  }
}

class _buildCard extends StatelessWidget {
  const _buildCard({
    Key? key,
    required this.size,
    required this.index,
  }) : super(key: key);

  final Size size;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(
          PreviewActivityModel.samples[index].name,
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              gradient:
                  LinearGradient(colors: [kPrimaryColor, kPrimaryLightColor])),
          padding: EdgeInsets.all(10.0),
          width: size.width * 1,
          height: size.height * 0.2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                //TODO: remplazar con nombre de la actividad
                PreviewActivityModel.samples[index].name,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                //TODO: remplazar con descripcion de la actividad
                PreviewActivityModel.samples[index].description,
                style: TextStyle(
                  fontSize: 13.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
