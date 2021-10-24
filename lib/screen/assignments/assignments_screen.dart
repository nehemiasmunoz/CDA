import 'package:centro_actividades/screen/assignments/models/logic/assignments_brain.dart';
import 'package:centro_actividades/utils/constant.dart';
import 'package:flutter/material.dart';

class AssignmentsScreen extends StatelessWidget {
  AssignmentsScreen({Key? key}) : super(key: key);

  final AssignmentsBrain assignmentsBrain = AssignmentsBrain();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Asignaturas'),
      ),
      body: Container(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: assignmentsBrain.getLength(),
          itemBuilder: (_, index) {
            return _AssignmentCard(
                assignmentsBrain: assignmentsBrain, index: index);
          },
        ),
      ),
    );
  }
}

class _AssignmentCard extends StatelessWidget {
  const _AssignmentCard({
    Key? key,
    required this.assignmentsBrain,
    required this.index,
  }) : super(key: key);

  final AssignmentsBrain assignmentsBrain;
  final index;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            gradient:
                LinearGradient(colors: [kPrimaryLightColor, kPrimaryColor])),
        height: size.height * 0.15,
        width: size.width * 0.8,
        margin: EdgeInsets.symmetric(
          vertical: 1.0,
          horizontal: 5.0,
        ),
        padding: EdgeInsets.all(15.0),
        child: Center(
          child: Text(
            assignmentsBrain.getName(index),
            style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
