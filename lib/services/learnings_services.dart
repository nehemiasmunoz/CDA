import 'dart:convert';
import 'package:centro_actividades/models/models.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class LearningServices extends ChangeNotifier {
  final String baseUrl = 'cda-centrodeactividades-default-rtdb.firebaseio.com';
  final List<LearningStyleModel> learningList = [];
  bool isLoading = true;

  LearningServices() {
    _getLearnings();
  }

  _getLearnings() async {
    final url = Uri.https(baseUrl, 'Learningstyle.json');
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);
      // convirtiendo datos en una lista
      jsonResponse.forEach((element) {
        final tempData = LearningStyleModel.fromMap(element);
        learningList.add(tempData);
      });
      print('learnings $learningList');
      // una vez tenemos los datos cambiamos el estado de carga a false
      isLoading = false;
      notifyListeners();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
