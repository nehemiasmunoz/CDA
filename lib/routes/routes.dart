import 'package:centro_actividades/screen/screens.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getAplicationRoutes() {
  return <String, WidgetBuilder>{
    'login': (BuildContext context) => LoginScreen(),
    'assignments': (BuildContext context) => AssignmentsScreen(),
    'typeLearning': (BuildContext context) => TypeLearningScreen(),
    'activities': (BuildContext context) => ActivitiesScreen(),
  };
}
