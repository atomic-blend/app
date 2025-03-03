import 'package:app/components/buttons/primary_button.dart';
import 'package:app/components/forms/app_text_form_field.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/services/firebase.service.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: getSize(context).height * 0.1,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    context.t.auth.login.title,
                    style: getTextTheme(context).headlineSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(
                    width: getSize(context).width * 0.9,
                    child: Text(
                      context.t.auth.login.description,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: $constants.insets.xxl,
              ),
              SizedBox(
                width: getSize(context).width * 0.9,
                child: AppTextFormField(
                  controller: _emailController,
                  hintText: context.t.auth.login.email,
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              SizedBox(
                height: $constants.insets.xs,
              ),
              SizedBox(
                width: getSize(context).width * 0.9,
                child: AppTextFormField(
                  controller: _passwordController,
                  hintText: context.t.auth.login.password,
                  obscureText: true,
                ),
              ),
              const Spacer(),
              PrimaryButton(
                width: getSize(context).width * 0.9,
                text: context.t.auth.login.login,
                onPressed: () async {
                  if (_emailController.text.isNotEmpty &&
                      _passwordController.text.isNotEmpty) {
                    await FirebaseService.login(context, _emailController.text,
                        _passwordController.text);
                    if (!context.mounted) return;
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
