import 'package:centro_actividades/models/models.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CoursesServices extends ChangeNotifier {
  final String baseUrl = 'cda-centrodeactividades-default-rtdb.firebaseio.com';
  final List<CoursesModel> coursesList = [];
  bool isLoading = true;

  CoursesServices() {
    _getCourses();
  }

  _getCourses() async {
    final url = Uri.https(baseUrl, 'Courses.json');
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);
      jsonResponse.forEach((element) {
        final tempData = CoursesModel.fromMap(element);
        coursesList.add(tempData);
      });
      isLoading = false;
      notifyListeners();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
