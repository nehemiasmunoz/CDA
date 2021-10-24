import 'package:centro_actividades/screen/auth/components/rounded_container.dart';
import 'package:centro_actividades/utils/constant.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Login',
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  RoundedContainer(child: createEmail()),
                  RoundedContainer(child: createPassword()),
                  RoundedContainer(
                    color: kPrimaryColor,
                    child: TextButton(
                      child: Text(
                        'Ingresar',
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'assignments');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class createEmail extends StatelessWidget {
  //const createEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        border: InputBorder.none,
        icon: Icon(
          Icons.person,
          color: kPrimaryColor,
        ),
        hintText: 'Email',
      ),
    );
  }
}

class createPassword extends StatefulWidget {
  // const createPassword({Key? key}) : super(key: key);

  @override
  _createPasswordState createState() => _createPasswordState();
}

class _createPasswordState extends State<createPassword> {
  bool visibility = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 1,
      obscureText: visibility,
      keyboardType: TextInputType.number,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        border: InputBorder.none,
        icon: Icon(
          Icons.lock,
          color: kPrimaryColor,
        ),
        hintText: 'Contraseña',
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              visibility = !visibility;
            });
          },
          child: Icon(
            visibility == false ? Icons.visibility : Icons.visibility_off,
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
