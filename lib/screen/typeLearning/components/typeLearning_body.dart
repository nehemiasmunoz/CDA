import 'package:centro_actividades/models/models.dart';
import 'package:flutter/material.dart';
import 'package:centro_actividades/utils/icono_string.dart';

class TypeLearningBody extends StatelessWidget {
  TypeLearningBody({Key? key, required this.learnings}) : super(key: key);

  final List<LearningStyleModel> learnings;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: learnings.length,
      itemBuilder: (BuildContext context, index) {
        return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'activities',
                  arguments: learnings[index].name);
            },
            child: _buildCard(size, index, learnings[index]));
      },
    );
  }

  Container _buildCard(Size size, int index, LearningStyleModel learning) {
    return Container(
      constraints: BoxConstraints(minHeight: 100.0),
      height: size.height * 0.14,
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
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
      child: Row(
        children: [
          getIcon(learning.icon),
          Spacer(),
          Container(
            width: 200.0,
            child: Text(
              learning.name,
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
