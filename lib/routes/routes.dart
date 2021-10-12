import 'package:flutter/material.dart';
import 'package:centro_actividades/pages/activities/activities_page.dart';
import 'package:centro_actividades/pages/assignments/assignments_page.dart';
import 'package:centro_actividades/pages/typeLearning/typeLearning_page.dart';
import 'package:centro_actividades/pages/login/login_page.dart';

Map<String, WidgetBuilder> getAplicationRoutes() {
  return <String, WidgetBuilder>{
    'login': (BuildContext context) => LoginPage(),
    'assignments': (BuildContext context) => AssignmentsPage(),
    'typeLearning': (BuildContext context) => TypeLearningPage(),
    'activities': (BuildContext context) => ActivitiesPage(),
  };
}
