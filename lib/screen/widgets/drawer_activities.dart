import 'package:centro_actividades/services/services.dart';
import 'package:centro_actividades/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerActivities extends StatelessWidget {
  const DrawerActivities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authServices = Provider.of<AuthService>(context);
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(top: 10.0),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/user.png',
                  height: 100.0,
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Divider(
              color: kPrimaryColor,
            ),
            ListTile(
                leading: Icon(
                  Icons.list,
                  color: Colors.amber,
                ),
                title: Text('Actividades Pendientes'),
                onTap: () => Navigator.pushNamed(context, 'savedActivities')),
            Divider(
              color: kPrimaryColor,
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text('Cerrar sesion'),
              onTap: () => authServices.signOut(),
            ),
            Divider(
              color: kPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
