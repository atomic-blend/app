import 'package:app/i18n/strings.g.dart';
import 'package:app/pages/auth/screens/reset_password_code.dart';
import 'package:app/pages/auth/screens/reset_password_intro.dart';
import 'package:app/pages/auth/screens/reset_password_new_password.dart';
import 'package:app/pages/auth/screens/reset_password_restore_data_choice.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  final String? email;
  const ResetPassword({super.key, this.email});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  int _currentStep = 0;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _emailCodeController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _restoreData = true;
  String? _mnemonicKey;

  @override
  void initState() {
    if (widget.email != null) {
      _emailController.text = widget.email!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.t.auth.reset_password.title,
          style: getTextTheme(context).bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: $constants.insets.md),
        child: Column(
          children: [
            if (_currentStep == 0)
              ResetPasswordIntro.ResetPasswordIntroduction(
                emailController: _emailController,
                onNextCallback: () {
                  setState(() {
                    _currentStep = 1;
                  });
                },
              ),
            if (_currentStep == 1)
              ResetPasswordCode(
                emailCodeController: _emailCodeController,
                onNextCallback: () {
                  setState(() {
                    _currentStep = 2;
                  });
                },
              ),
            if (_currentStep == 2)
              ResetPasswordRestoreDataChoice(
                restoreDataChoiceCallback: (reset, mnemonicKey) {
                  setState(() {
                    _restoreData = reset;
                    _mnemonicKey = mnemonicKey;
                    _currentStep = 3;
                  });
                },
              ),
            if (_currentStep == 3)
              ResetPasswordNewPwd(
                passwordController: _passwordController,
                onNextCallback: () {
                  setState(() {
                    _currentStep = 4;
                  });
                },
              ),
          ],
        ),
      ),
    );
  }
}

class ResetPasswordNewPassword {}
