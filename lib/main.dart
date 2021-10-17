import 'package:centro_actividades/routes/routes.dart';
import 'package:centro_actividades/utils/constant.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Centro de Actividades',
      initialRoute: 'login',
      routes: getAplicationRoutes(),
      theme: ThemeData.light().copyWith(
        primaryColor: kPrimaryColor,
        appBarTheme: AppBarTheme(
          color: kPrimaryColor,
          elevation: 0,
          centerTitle: true,
        ),
      ),
    );
  }
}
