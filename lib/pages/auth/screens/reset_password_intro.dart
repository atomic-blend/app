import 'package:app/blocs/auth/auth.bloc.dart';
import 'package:app/components/buttons/primary_button_square.dart';
import 'package:app/components/forms/app_text_form_field.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class ResetPasswordIntro extends StatefulWidget {
  final TextEditingController emailController;
  final VoidCallback? onNextCallback;
  const ResetPasswordIntro.ResetPasswordIntroduction(
      {super.key, required this.emailController, this.onNextCallback});

  @override
  State<ResetPasswordIntro> createState() => _ResetPasswordIntroState();
}

class _ResetPasswordIntroState extends State<ResetPasswordIntro>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _lottieController;
  final _animationDuration = const Duration(milliseconds: 250);
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
    );
    _lottieController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
      lowerBound: 0.2,
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _lottieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (BuildContext context, AuthState authState) {
        if (authState is StartResetPasswordSuccess) {
          widget.onNextCallback?.call();
        }
      },
      child: SizedBox(
        width: double.infinity,
        height: getSize(context).height * 0.86,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: getSize(context).height * 0.1,
            ),
            Animate(
              controller: _animationController,
              effects: [
                FadeEffect(
                  duration: _animationDuration,
                  delay: const Duration(milliseconds: 0),
                ),
              ],
              onPlay: (controller) => controller.forward(),
              child: Transform.scale(
                scale: 1.3,
                child: Lottie.asset(
                  controller: _lottieController,
                  onLoaded: (p0) => _lottieController.loop(),
                  'assets/animations/pwd_lost.json',
                  width: getSize(context).width * 0.5,
                ),
              ),
            ),
            SizedBox(
              height: $constants.insets.sm,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.t.auth.reset_password.title,
                  style: getTextTheme(context).titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  context.t.auth.reset_password.subtitle,
                  style: getTextTheme(context).bodyMedium!.copyWith(
                        color: Colors.grey,
                      ),
                ),
                SizedBox(
                  height: $constants.insets.xs,
                ),
                Text(context.t.auth.reset_password.warning),
                SizedBox(
                  height: $constants.insets.sm,
                ),
                Text(
                  context.t.auth.reset_password.no_mnemonic_data_loss,
                  style: getTextTheme(context).bodySmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: getTheme(context).error,
                      ),
                ),
              ],
            ),
            SizedBox(
              height: $constants.insets.sm,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  AppTextFormField(
                    controller: widget.emailController,
                    labelText: context.t.auth.reset_password.email,
                    labelDescription:
                        context.t.auth.reset_password.email_description,
                    hintText: context.t.auth.reset_password.email_hint,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return context.t.auth.reset_password.email_required;
                      }
                      return null;
                    },
                  ),
                ],
              ),
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
                padding: EdgeInsets.symmetric(horizontal: $constants.insets.md),
                height: getSize(context).height * 0.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Spacer(),
                    PrimaryButtonSquare(
                      text: context.t.actions.next,
                      backgroundColor: getTheme(context).primary,
                      onPressed: () async {
                        if (!_formKey.currentState!.validate()) {
                          return;
                        }
                        _animationController.reverseDuration =
                            const Duration(milliseconds: 500);
                        _animationController.reverse();
                        if (!context.mounted) {
                          return;
                        }
                        context.read<AuthBloc>().add(
                              StartResetPassword(
                                widget.emailController.text,
                              ),
                            );
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
