import 'package:centro_actividades/screen/auth/components/rounded_container.dart';
import 'package:centro_actividades/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        //ocultar el teclado al tocar la pantalla
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                padding: EdgeInsets.symmetric(vertical: 35.0, horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 350.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/studyLogin.png'),
                        ),
                      ),
                    ),
                    Text(
                      'Login',
                      style: kLabelStyle,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: size.height * 0.02),
                    _CustomForm(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomForm extends StatefulWidget {
  @override
  State<_CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<_CustomForm> {
  String emailValue = '';
  int passwordValue = 0000;

  bool passwordVisibility = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            onSaved: (value) {},
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !value.contains('@') ||
                  value.length < 5) {
                return 'Por favor ingresa un email valido';
              }
            },
            cursorColor: kPrimaryColor,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10.0),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty || value.length < 4) {
                return 'Por favor completa este campo';
              }
            },
            cursorColor: kPrimaryColor,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            maxLines: 1,
            minLines: 1,
            maxLength: 4,
            obscureText: passwordVisibility,
            decoration: InputDecoration(
              hintText: 'Contraseña',
              border: OutlineInputBorder(),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    passwordVisibility = !passwordVisibility;
                  });
                },
                child: Icon(
                  passwordVisibility == false
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: kPrimaryColor,
                ),
              ),
            ),
          ),
          RoundedContainer(
            color: kPrimaryColor,
            child: TextButton(
              child: Text(
                'Ingresar'.toUpperCase(),
                style: kLabelStyle.copyWith(
                  color: Colors.white,
                  fontSize: 17.0,
                ),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                  Navigator.pushNamed(context, 'assignments');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
