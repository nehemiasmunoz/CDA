import 'package:centro_actividades/screen/assignments/models/assigments_model.dart';
import 'package:centro_actividades/screen/screens.dart';
import 'package:centro_actividades/screen/widgets/widgets.dart';
import 'package:centro_actividades/services/assignments_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AssignmentsScreen extends StatelessWidget {
  AssignmentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final assignments = Provider.of<AssignmentsServices>(context);

    if (assignments.isLoading) return LoadingScreen();

    return Scaffold(
      appBar: AppBar(
        title: Text('Asignaturas'),
      ),
      body: Container(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: assignments.assignmetsList.length,
          itemBuilder: (_, index) {
            return _AssignmentCard(
              assigment: assignments.assignmetsList[index],
            );
          },
        ),
      ),
      endDrawer: DrawerActivities(),
    );
  }
}

class _AssignmentCard extends StatelessWidget {
  final AssignmentModel assigment;

  const _AssignmentCard({Key? key, required this.assigment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          'typeLearning',
          arguments: assigment.name,
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
              assigment.name,
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
