import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey();

  String email = '';
  String password = '';
  bool isLoading = true;
  bool emailValid = false;

  bool isValidateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  validateEmail(value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      emailValid = false;
      return 'Ingrese un Email Valido';
    } else {
      emailValid = true;
    }
  }

  validatePassword(value) {
    if (value == null || value.isEmpty || value.length < 4) {
      return 'Por favor completa este campo';
    }
  }
}
