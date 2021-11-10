import 'package:centro_actividades/screen/assignments/models/logic/assignments_brain.dart';
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
      onTap: () {
        Navigator.pushNamed(
          context,
          'typeLearning',
          arguments: assignmentsBrain.getName(index),
        );
      },
      child: Container(
        height: size.height * 0.14,
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
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
        child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: Center(
            child: Text(
              assignmentsBrain.getName(index),
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
