import 'package:centro_actividades/models/activities/activity_query.dart';
import 'package:centro_actividades/models/models.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ActivitiesServices extends ChangeNotifier {
  // Conexion a url de bd
  final String baseUrl = 'cda-centrodeactividades-default-rtdb.firebaseio.com';
  final List<ActivityModel> activitiesList = [];
  bool isLoading = true;
  final activityQuery = ActivityQuery();

  ActivitiesServices() {
    _getActivities();
  }
  _getActivities() async {
    //asignacion de la tabla cual necesito
    final url = Uri.https(
      baseUrl,
      'Activities.json',
    ); //?orderBy="course"&equalTo="$course"'
    var response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      jsonResponse.forEach((element) {
        final tempData = ActivityModel.fromMap(element);
        activitiesList.add(tempData);
      });
      print(activitiesList);
      isLoading = false;
      // notificacion a pantallas que necesitan los datos
      notifyListeners();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
