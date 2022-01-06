import 'package:centro_actividades/screen/loading/loading_screen.dart';
import 'package:centro_actividades/screen/typeLearning/components/typeLearning_body.dart';
import 'package:centro_actividades/screen/widgets/widgets.dart';
import 'package:centro_actividades/services/services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TypeLearningScreen extends StatelessWidget {
  TypeLearningScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final learnings = Provider.of<LearningServices>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Tipos de Aprendizajes'),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: learnings.isLoading
          ? LoadingScreen()
          : SafeArea(
              bottom: false,
              child: TypeLearningBody(
                learnings: learnings.learningList,
              ),
            ),
      endDrawer: DrawerActivities(),
    );
  }
}
