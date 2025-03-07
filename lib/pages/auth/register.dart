import 'package:app/components/buttons/primary_button.dart';
import 'package:app/components/forms/app_text_form_field.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
              SvgPicture.asset(
                'assets/images/sign_up.svg',
                width: getSize(context).width * 0.8,
              ),
              SizedBox(
                height: $constants.insets.lg,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    context.t.auth.register.title,
                    style: getTextTheme(context).headlineSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(
                    width: getSize(context).width * 0.9,
                    child: Text(
                      context.t.auth.register.description,
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
                  hintText: context.t.auth.register.email,
                ),
              ),
              SizedBox(
                height: $constants.insets.xs,
              ),
              SizedBox(
                width: getSize(context).width * 0.9,
                child: AppTextFormField(
                  controller: _passwordController,
                  hintText: context.t.auth.register.password,
                  obscureText: true,
                ),
              ),
              const Spacer(),
              PrimaryButton(
                width: getSize(context).width * 0.9,
                text: context.t.auth.register.register,
                onPressed: () async {
                  if (_emailController.text.isNotEmpty &&
                      _passwordController.text.isNotEmpty) {
                        //TODO: fix this
                    // await FirebaseService.register(context,
                    //     _emailController.text, _passwordController.text);
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
