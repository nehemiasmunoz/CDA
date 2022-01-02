import 'package:centro_actividades/models/models.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ActivitiesServices extends ChangeNotifier {
  String course = '';
  String learningstyle = '';
  // Conexion a url de bd
  final String baseUrl = 'cda-centrodeactividades-default-rtdb.firebaseio.com';
  final List<ActivityModel> activitiesList = [];
  bool isLoading = true;

  ActivitiesServices() {
    _getActivities();
  }

  _getActivities() async {
    //asignacion de la tabla cual necesito
    final url = Uri.https(baseUrl, 'Activities.json',
        {'orderBy': course}); //?orderBy="course"&equalTo="$course"'

    var response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);

      jsonResponse.forEach((key, value) {
        final tempData = ActivityModel.fromMap(value);
        tempData.id = key; //Añado el id que viene como cabecera(key)
        activitiesList.add(
            tempData); // asigno los datos traidos en forma de lista para su uso
      });
      // activitiesList.forEach((element) {
      //   if (element.learningstyle == learningstyle) {
      //     activitiesList
      //   }
      // });
      // for (var i = 0; i < tempData.learningstyle.length; i++) {
      //   if (tempData.learningstyle[i].name == learningstyle) {
      //     activitiesList.add(tempData);
      //   }
      // }
      isLoading = false;
      // notificacion a pantallas que necesitan los datos
      notifyListeners();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
