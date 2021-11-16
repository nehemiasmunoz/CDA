import 'dart:convert';

import 'package:centro_actividades/screen/typeLearning/models/typeLearning_model.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class LearningServices extends ChangeNotifier {
  final String baseUrl = 'cda-centrodeactividades-default-rtdb.firebaseio.com';
  final List<LearningModel> learningList = [];
  bool isLoading = true;

  LearningServices() {
    _getLearnings();
  }

  _getLearnings() async {
    final url = Uri.https(baseUrl, 'learnings.json');
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      print(jsonResponse);
      // convirtiendo datos en una lista
      jsonResponse.forEach((key, value) {
        final tempData = LearningModel.fromMap(value);
        tempData.id = key;
        learningList.add(tempData);
      });
      // una vez tenemos los datos cambiamos el estado de carga a false
      isLoading = false;
      notifyListeners();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
