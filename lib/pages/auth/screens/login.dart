import 'package:app/blocs/auth/auth.bloc.dart';
import 'package:app/components/buttons/primary_button_square.dart';
import 'package:app/components/forms/app_text_form_field.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/pages/auth/screens/reset_password.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';

class Login extends StatefulWidget {
  final VoidCallback onAuthSuccess;
  const Login(
      {super.key,
      this.cancelCallback,
      required this.onAuthSuccess,
      this.errorMessage});
  final VoidCallback? cancelCallback;
  final String? errorMessage;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final _animationDuration = const Duration(milliseconds: 250);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (BuildContext context, AuthState state) async {
        if (state is LoggedIn) {
          _animationController.reverseDuration = const Duration(
            milliseconds: 500,
          );
          await _animationController.reverse(from: 1.0);
          if (!context.mounted) return;
        }
      },
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: getSize(context).height * 0.92,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: getSize(context).height * 0.08,
                  ),
                  Animate(
                    controller: _animationController,
                    effects: [
                      FadeEffect(
                        duration: _animationDuration,
                        delay: const Duration(milliseconds: 0),
                      )
                    ],
                    onPlay: (controller) => controller.forward(),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: $constants.insets.md),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Center(
                            child: Image.asset(
                              'assets/images/authentication.png',
                              fit: BoxFit.cover,
                              width: isDesktop(context)
                                  ? getSize(context).width * 0.2
                                  : getSize(context).width * 0.5,
                            ),
                          ),
                          AutoSizeText(
                            maxLines: 1,
                            context.t.auth.login.title,
                            style: getTextTheme(context).displaySmall!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          SizedBox(
                            height: $constants.insets.xs,
                          ),
                          SizedBox(
                            width: getSize(context).width * 0.9,
                            child: Text(
                              context.t.auth.login.description,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: $constants.insets.sm,
                  ),
                  Animate(
                    controller: _animationController,
                    effects: [
                      FadeEffect(
                        duration: _animationDuration,
                        delay: const Duration(milliseconds: 300),
                      )
                    ],
                    onPlay: (controller) => controller.forward(),
                    child: Column(
                      children: [
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
                            hintText: context.t.auth.register.password_hint,
                            obscureText: true,
                          ),
                        ),
                        if (widget.errorMessage != null) ...[
                          SizedBox(
                            height: $constants.insets.xs,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: $constants.insets.lg),
                            child: SizedBox(
                              width: getSize(context).width * 0.9,
                              child: Text(
                                context.t.errors[widget.errorMessage] ??
                                    context.t.errors["unknown_error"]!,
                                style: getTextTheme(context)
                                    .labelSmall!
                                    .copyWith(color: Colors.red),
                              ),
                            ),
                          ),
                        ]
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getSize(context).height * 0.23,
                  ),
                  const Divider(),
                  Animate(
                    controller: _animationController,
                    effects: [
                      FadeEffect(
                        duration: _animationDuration,
                        delay: const Duration(milliseconds: 500),
                      )
                    ],
                    onPlay: (controller) => controller.forward(),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: $constants.insets.md),
                      height: getSize(context).height * 0.1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ResetPassword(
                                    email: _emailController.text,
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              context.t.auth.reset_password.title,
                              style: getTextTheme(context).bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: getTheme(context).primary,
                                  ),
                            ),
                          ),
                          const Spacer(),
                          PrimaryButtonSquare(
                            text: context.t.auth.login.login,
                            backgroundColor: getTheme(context).primary,
                            onPressed: () async {
                              if (_emailController.text.isNotEmpty &&
                                  _passwordController.text.isNotEmpty) {
                                if (!context.mounted) return;
                                context.read<AuthBloc>().add(LoginEvent(
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                    ));
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: $constants.insets.lg,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: $constants.insets.sm,
            top: $constants.insets.md,
            child: GestureDetector(
              onTap: widget.cancelCallback,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    OctIcons.arrow_left,
                    size: 18,
                  ),
                  SizedBox(
                    width: $constants.insets.xxs,
                  ),
                  Text(
                    context.t.actions.back,
                    style: getTextTheme(context)
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
