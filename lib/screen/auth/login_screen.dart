import 'package:centro_actividades/providers/providers.dart';
import 'package:centro_actividades/screen/auth/components/rounded_container.dart';
import 'package:centro_actividades/services/services.dart';
import 'package:centro_actividades/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

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
                      child: FadeInImage(
                        image: AssetImage('assets/studyLogin.png'),
                        placeholder: AssetImage('assets/loading.gif'),
                      ),
                    ),
                    Text(
                      'Login',
                      style: kLabelStyle,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: size.height * 0.02),
                    ChangeNotifierProvider(
                      create: (context) => LoginFormProvider(),
                      child: _CustomForm(),
                    )
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
  late FocusNode passwordFocus;
  bool passwordVisibility = false;

  @override
  void initState() {
    super.initState();
    passwordFocus = FocusNode();
  }

  @override
  void dispose() {
    passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    final authService = Provider.of<AuthService>(context);
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: loginForm.formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onEditingComplete: () {
              if (loginForm.emailValid) requestFocus(context, passwordFocus);
            },
            onChanged: (value) => loginForm.email = value,
            textInputAction: TextInputAction.next,
            validator: (value) => loginForm.validateEmail(value),
            decoration: InputDecoration(
              hintText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10.0),
          TextFormField(
            focusNode: passwordFocus,
            validator: (value) => loginForm.validatePassword(value),
            onChanged: (value) => loginForm.password = value,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            maxLines: 1,
            minLines: 1,
            maxLength: 6,
            obscureText: passwordVisibility,
            decoration: InputDecoration(
              hintText: 'Contraseña',
              border: OutlineInputBorder(),
              suffixIcon: GestureDetector(
                onTap: () => setState(() {
                  passwordVisibility = !passwordVisibility;
                }),
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
              child: authService.isLoading
                  ? CircularProgressIndicator()
                  : Text(
                      'Ingresar'.toUpperCase(),
                      style: kLabelStyle.copyWith(
                        color: Colors.white,
                        fontSize: 17.0,
                      ),
                    ),
              onPressed: () {
                if (loginForm.isValidateForm()) {
                  authService.signInWithEmailAndPassword(
                      loginForm.email, loginForm.password);
                }
              },
            ),
          ),
          if (authService.errorMessage != '')
            Container(
              color: Colors.amberAccent,
              child: ListTile(
                title: Text(authService.errorMessage),
                leading: Icon(Icons.error),
                trailing: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => authService.setMessage(''),
                ),
              ),
            )
        ],
      ),
    );
  }
}

void requestFocus(BuildContext context, FocusNode focus) {
  FocusScope.of(context).requestFocus(focus);
}
