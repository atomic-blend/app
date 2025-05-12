import 'package:app/blocs/auth/auth.bloc.dart';
import 'package:app/components/buttons/primary_button_square.dart';
import 'package:app/components/forms/app_text_form_field.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';

class RegisterPassword extends StatefulWidget {
  const RegisterPassword(
      {super.key,
      this.cancelCallback,
      required this.email,
      required this.onAuthSuccess,
      this.onPasswordUpdate,
      this.password});
  final String email;
  final String? password;
  final VoidCallback? cancelCallback;
  final Function(String)? onPasswordUpdate;
  final VoidCallback onAuthSuccess;

  @override
  State<RegisterPassword> createState() => _RegisterPasswordState();
}

class _RegisterPasswordState extends State<RegisterPassword>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final _animationDuration = const Duration(milliseconds: 250);
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  initState() {
    _passwordController.text = widget.password ?? '';
    _animationController = AnimationController(
      vsync: this,
    );
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: getSize(context).height * 0.92,
          child: Column(
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
                  padding:
                      EdgeInsets.symmetric(horizontal: $constants.insets.md),
                  child: Form(
                    key: _formKey,
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
                          context.t.auth.register.password,
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
                            context.t.auth.register.email_description,
                          ),
                        ),
                        SizedBox(
                          width: getSize(context).width * 0.9,
                          child: Text(
                            "\n${context.t.auth.register.we_never_sell}",
                            style: getTextTheme(context).bodyMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        SizedBox(
                          height: $constants.insets.xs,
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
                          child: SizedBox(
                            width: getSize(context).width * 0.9,
                            child: AppTextFormField(
                              controller: _passwordController,
                              hintText: context.t.auth.register.password_hint,
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return context
                                      .t.auth.reset_password.password_missing;
                                }
                                if (value.length < 8) {
                                  return context
                                      .t.auth.reset_password.password_too_short;
                                }
                                return null;
                              },
                              onChange: () {
                                if (widget.onPasswordUpdate != null) {
                                  widget.onPasswordUpdate!(
                                      _passwordController.text);
                                }
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: $constants.insets.xs,
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
                          child: SizedBox(
                            width: getSize(context).width * 0.9,
                            child: AppTextFormField(
                              controller: _passwordConfirmationController,
                              validator: (value) {
                                if (value != _passwordController.text) {
                                  return context
                                      .t.auth.register.password_mismatch;
                                }
                                return null;
                              },
                              hintText:
                                  context.t.auth.register.confirmation_hint,
                              obscureText: true,
                              onChange: () {
                                if (widget.onPasswordUpdate != null) {
                                  widget.onPasswordUpdate!(
                                      _passwordController.text);
                                }
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: $constants.insets.sm,
              ),
              const Spacer(),
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
                  padding:
                      EdgeInsets.symmetric(horizontal: $constants.insets.md),
                  height: getSize(context).height * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Spacer(),
                      PrimaryButtonSquare(
                        text: context.t.actions.next,
                        backgroundColor: getTheme(context).primary,
                        onPressed: () async {
                          if (_passwordController.text.isEmpty) {
                            return;
                          }
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }
                          _animationController.reverseDuration = const Duration(
                            milliseconds: 500,
                          );
                          await _animationController.reverse(from: 1.0);

                          if (widget.email.isNotEmpty &&
                              _passwordController.text.isNotEmpty) {
                            if (!context.mounted) return;
                            context.read<AuthBloc>().add(RegisterEvent(
                                  email: widget.email,
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
    );
  }
}
