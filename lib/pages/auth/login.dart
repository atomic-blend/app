import 'package:app/blocs/auth/auth.bloc.dart';
import 'package:app/components/buttons/primary_button_round.dart';
import 'package:app/components/forms/app_text_form_field.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:icons_plus/icons_plus.dart';

class Login extends StatefulWidget {
  const Login({super.key, this.cancelCallback});
  final VoidCallback? cancelCallback;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (BuildContext context, AuthState state) {
        if (state is LoggedIn) {
          if (!context.mounted) return;
          Navigator.pop(context);
        }
      },
      child: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: getSize(context).height * 0.1,
                child: Row(
                  children: [
                    SizedBox(
                      width: $constants.insets.sm,
                    ),
                    GestureDetector(
                        onTap: widget.cancelCallback,
                        child: const Icon(LineAwesome.arrow_left_solid)),
                    SizedBox(
                      width: $constants.insets.xxs,
                    ),
                    Text(
                      context.t.navigation.back,
                      style: getTextTheme(context).bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    )
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/images/sign_up.svg',
                    width: getSize(context).width * 0.7,
                  ),
                  SizedBox(
                    height: $constants.insets.lg,
                  ),
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
                height: $constants.insets.lg,
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
              PrimaryButtonRound(
                width: getSize(context).width * 0.9,
                text: context.t.auth.login.login,
                onPressed: () async {
                  if (_emailController.text.isNotEmpty &&
                      _passwordController.text.isNotEmpty) {
                    context.read<AuthBloc>().add(LoginEvent(
                          email: _emailController.text,
                          password: _passwordController.text,
                        ));
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
