import 'package:app/pages/auth/login_or_register.dart';
import 'package:app/pages/auth/not_logged_in_intro.dart';
import 'package:flutter/material.dart';

class NotLoggedIn extends StatefulWidget {
  const NotLoggedIn({super.key});

  @override
  State<NotLoggedIn> createState() => _NotLoggedInState();
}

class _NotLoggedInState extends State<NotLoggedIn> {
  bool _isTermsAccepted = false;
  bool _startLoginProcess = false;
  
  @override
  Widget build(BuildContext context) {
    if (_isTermsAccepted && _startLoginProcess) {
      return const LoginOrRegister();
    } else {
      return NotLoggedInIntro(
        isTermsAccepted: _isTermsAccepted,
        toggleTerms: () {
          setState(() {
            _isTermsAccepted = !_isTermsAccepted;
          });
        },
        toggleLoginProcess: () {
          setState(() {
            _startLoginProcess = true;
          });
        },
      );
    }
  }
}
