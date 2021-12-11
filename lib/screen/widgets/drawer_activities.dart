import 'package:centro_actividades/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerActivities extends StatelessWidget {
  const DrawerActivities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authServices = Provider.of<AuthService>(context);
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.list),
            title: Text('Actividades Pendientes'),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Cerrar sesion'),
            onTap: () => authServices.signOut(),
          )
        ],
      ),
    );
  }
}
