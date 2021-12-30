import 'package:centro_actividades/models/models.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ActivitiesServices extends ChangeNotifier {
  // Conexion a url de bd
  final String baseUrl =
      'https://cda-centrodeactividades-default-rtdb.firebaseio.com/activities';
  final List<ActivityModel> activitiesList = [];
  bool isLoading = true;

  ActivitiesServices() {
    _getActivities();
  }

  _getActivities() async {
    //asignacion de la tabla cual necesito
    final url = Uri.https(baseUrl, 'activities.json');
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      jsonResponse.forEach((key, value) {
        final tempData = ActivityModel.fromMap(value);
        //Añado el id que viene como cabecera(key)
        tempData.id = key;
        // asigno los datos traidos en forma de lista para su uso
        activitiesList.add(tempData);
      });
      isLoading = false;
      // notificacion a pantallas que necesitan los datos
      notifyListeners();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
