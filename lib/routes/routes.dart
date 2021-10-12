import 'package:centro_actividades/screen/activities/activities_screen.dart';
import 'package:centro_actividades/screen/assignments/assignments_screen.dart';
import 'package:centro_actividades/screen/login/login_screen.dart';
import 'package:centro_actividades/screen/typeLearning/typeLearning_screen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getAplicationRoutes() {
  return <String, WidgetBuilder>{
    'login': (BuildContext context) => LoginScreen(),
    'assignments': (BuildContext context) => AssignmentsScreen(),
    'typeLearning': (BuildContext context) => TypeLearningScreen(),
    'activities': (BuildContext context) => ActivitiesScreen(),
  };
}
