import 'package:app/pages/auth/login_or_register.dart';
import 'package:app/pages/auth/welcome_screen.dart';
import 'package:flutter/material.dart';

class LoginOrRegisterModal extends StatefulWidget {
  const LoginOrRegisterModal({super.key});

  @override
  State<LoginOrRegisterModal> createState() => _LoginOrRegisterModalState();
}

class _LoginOrRegisterModalState extends State<LoginOrRegisterModal> {
  int _step = 0;
  @override
  Widget build(BuildContext context) {
    switch (_step) {
      case 0:
        return WelcomeScreen(
          nextStepCallback: () => setState(() => _step = 1),
        );
      case 1:
        return const LoginOrRegister(
        );
    }
    return Container();
  }
}
