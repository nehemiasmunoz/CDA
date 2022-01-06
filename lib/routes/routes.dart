import 'package:centro_actividades/screen/activities/templates/basic_activity_template.dart';
import 'package:centro_actividades/screen/screens.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getAplicationRoutes() {
  return <String, WidgetBuilder>{
    'login': (BuildContext context) => LoginScreen(),
    'courses': (BuildContext context) => CoursesScreen(),
    'typeLearning': (BuildContext context) => TypeLearningScreen(),
    'activities': (BuildContext context) => ActivitiesScreen(),
    'basicActivity': (_) => BasicActivity(),
    'savedActivities': (_) => SavedActivitiesScreen(),
  };
}
