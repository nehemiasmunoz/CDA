import 'package:centro_actividades/screen/assignments/models/assigments_model.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AssignmentsServices extends ChangeNotifier {
  final String baseUrl = 'cda-centrodeactividades-default-rtdb.firebaseio.com';
  final List<AssignmentModel> assignmetsList = [];
  bool isLoading = true;

  AssignmentsServices() {
    _getAssignments();
  }

  _getAssignments() async {
    final url = Uri.https(baseUrl, 'assignments.json');
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      jsonResponse.forEach((key, value) {
        final tempData = AssignmentModel.fromMap(value);
        tempData.id = key;
        assignmetsList.add(tempData);
      });
      isLoading = false;
      notifyListeners();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
