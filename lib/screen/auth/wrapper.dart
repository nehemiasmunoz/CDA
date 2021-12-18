import 'package:centro_actividades/models/models.dart';
import 'package:centro_actividades/screen/screens.dart';
import 'package:centro_actividades/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<User?>(
      stream: authService.user,
      builder: (_, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          return user == null ? LoginScreen() : AssignmentsScreen();
        } else {
          return LoadingScreen();
        }
      },
    );
  }
}
