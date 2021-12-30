import 'package:centro_actividades/providers/providers.dart';
// import 'package:centro_actividades/screen/auth/wrapper.dart';
import 'package:centro_actividades/services/services.dart';
import 'package:flutter/material.dart';
import 'package:centro_actividades/routes/routes.dart';
import 'package:centro_actividades/utils/constant.dart';

//firebase connection

import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CoursesServices()),
        ChangeNotifierProvider(create: (context) => AuthService()),
        ChangeNotifierProvider(create: (context) => LearningServices()),
        ChangeNotifierProvider(create: (context) => LoginFormProvider()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Centro de Actividades',
      initialRoute: 'courses',
      //home: Wrapper(),
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
