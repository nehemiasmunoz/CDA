import 'package:flutter/material.dart';

class DrawerActivities extends StatelessWidget {
  const DrawerActivities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.list),
            title: Text('Actividades Pendientes'),
          )
        ],
      ),
    );
  }
}
