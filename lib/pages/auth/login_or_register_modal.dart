import 'package:app/pages/auth/login.dart';
import 'package:app/pages/auth/login_or_register.dart';
import 'package:app/pages/auth/register_email.dart';
import 'package:app/pages/auth/register_password.dart';
import 'package:app/pages/auth/welcome_screen.dart';
import 'package:flutter/material.dart';

class LoginOrRegisterModal extends StatefulWidget {
  const LoginOrRegisterModal({super.key});

  @override
  State<LoginOrRegisterModal> createState() => _LoginOrRegisterModalState();
}

class _LoginOrRegisterModalState extends State<LoginOrRegisterModal> {
  String? email;
  int _step = 0;
  @override
  Widget build(BuildContext context) {
    switch (_step) {
      case 0:
        return WelcomeScreen(
          nextStepCallback: () => setState(() => _step = 1),
        );
      case 1:
        return LoginOrRegister(
          backStepCallback: () => setState(() => _step = 0),
          loginCallback: () => setState(() => _step = 2),
          registerCallback: () => setState(() => _step = 3),
        );
      case 2:
        return Login(
          cancelCallback: () {
            setState(() {
              _step = 1;
            });
          },
        );
      case 3:
        return RegisterEmail(
          nextStepCallback: (String newEmail){
            setState(() {
              email = newEmail;
              _step = 4;
            });
          },
          cancelCallback: () {
            setState(() {
              _step = 1;
            });
          },
        );
      case 4:
        return RegisterPassword(email: email!);
    }
    return Container();
  }
}
