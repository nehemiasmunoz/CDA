import 'dart:ui';
import 'package:centro_actividades/screen/activities/models/logic/basic_activity_brain.dart';
import 'package:centro_actividades/screen/widgets/widgets.dart';
import 'package:centro_actividades/utils/constant.dart';
import 'package:flutter/material.dart';

class ActivitiesScreen extends StatelessWidget {
  ActivitiesScreen({Key? key}) : super(key: key);

  BasicActivityBrain basicActivity = BasicActivityBrain();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final typeLearning = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Actividades tipo $typeLearning',
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
      body: ListView.builder(
        itemCount: basicActivity.getLength(),
        itemBuilder: (BuildContext context, index) {
          return _buildCard(
            size: size,
            index: index,
            data: basicActivity.getPreview(index),
          );
        },
      ),
      endDrawer: DrawerActivities(),
    );
  }
}

class _buildCard extends StatelessWidget {
  const _buildCard({
    Key? key,
    required this.size,
    required this.index,
    required this.data,
  }) : super(key: key);

  final Size size;
  final int index;
  final List data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(
          data[0],
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
            gradient: LinearGradient(
              colors: [kPrimaryColor, kPrimaryLightColor],
            ),
          ),
          padding: EdgeInsets.all(10.0),
          width: size.width * 1,
          height: size.height * 0.2,
          child: _buildContent(data: data),
        ),
      ),
    );
  }
}

class _buildContent extends StatelessWidget {
  const _buildContent({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data[0],
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          data[1],
          style: TextStyle(
            fontSize: 13.0,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
