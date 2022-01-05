import 'package:centro_actividades/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//TODO: Cambiar la ubicacion
class ActivityQuery with ChangeNotifier {
  String _courseData = '';
  String _learningstyle = '';

  String get course => _courseData;

  String get learning => _learningstyle;

  void changeCourse(value) {
    _courseData = value;
    notifyListeners();
  }

  void changeLearning(value) {
    _learningstyle = value;
    notifyListeners();
  }

  ActivitiesServices callActivityServices(BuildContext context) {
    final activities = Provider.of<ActivitiesServices>(context);
    activities.course = _courseData;
    activities.learning = _learningstyle;
    return activities;
  }
}
