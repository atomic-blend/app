import 'package:app/blocs/auth/auth.bloc.dart';
import 'package:app/components/widgets/loading_city.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/pages/auth/screens/login.dart';
import 'package:app/pages/auth/screens/login_or_register.dart';
import 'package:app/pages/auth/screens/register_email.dart';
import 'package:app/pages/auth/screens/register_password.dart';
import 'package:app/pages/auth/screens/welcome_screen.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginOrRegisterModal extends StatefulWidget {
  final VoidCallback onAuthSuccess;
  const LoginOrRegisterModal({super.key, required this.onAuthSuccess});

  @override
  State<LoginOrRegisterModal> createState() => _LoginOrRegisterModalState();
}

class _LoginOrRegisterModalState extends State<LoginOrRegisterModal> {
  String? email;
  String? password;
  int _step = 0;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (BuildContext context, AuthState state) async {
        if (state is LoggedIn) {
          if (!context.mounted) return;
          widget.onAuthSuccess();
          Navigator.pop(context);
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(builder: (context, authState) {
        if (authState is Loading) {
          return LoadingAnimated(
            imageWidth: getSize(context).width * 0.6,
            title: context.t.loading.simple,
          );
        }
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
              onAuthSuccess: widget.onAuthSuccess,
              cancelCallback: () {
                setState(() {
                  _step = 1;
                });
              },
            );
          case 3:
            return RegisterEmail(
              email: email,
              nextStepCallback: (String newEmail) {
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
            return RegisterPassword(
              password: password,
              onAuthSuccess: widget.onAuthSuccess,
              onPasswordUpdate: (newPwd) {
                setState(() {
                  password = newPwd;
                });
              },
              email: email!,
              cancelCallback: () {
                setState(() {
                  _step = 3;
                });
              },
            );
        }
        return Container();
      }),
    );
  }
}
