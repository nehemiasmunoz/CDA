import 'package:flutter/material.dart';

//TODO: Cambiar la ubicacion
class ActivityQuery with ChangeNotifier {
  String _courseData = '';
  String _learningstyle = '';

  String get course {
    return _courseData;
  }

  String get learning {
    return _learningstyle;
  }

  void changeCourse(value) {
    _courseData = value;
    notifyListeners();
  }

  void changeLearning(value) {
    _learningstyle = value;
    notifyListeners();
  }
}
