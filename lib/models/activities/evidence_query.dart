import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class EvidenceQuery with ChangeNotifier {
  String _evidenceType = '';
  String get evidence => _evidenceType;

  void changeEvidence(value) {
    _evidenceType = value;
    notifyListeners();
  }

  // ActivitiesServices callEvidenceServices(BuildContext context) {
  //   final activities = Provider.of<ActivitiesServices>(context);
  //   activities.course = _courseData;
  //   activities.learning = _learningstyle;
  //   return activities;
  // }
}
