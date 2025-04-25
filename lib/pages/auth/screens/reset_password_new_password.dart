import 'package:app/components/buttons/primary_button_square.dart';
import 'package:app/components/forms/app_text_form_field.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ResetPasswordNewPwd extends StatefulWidget {
  final TextEditingController passwordController;
  final VoidCallback? onNextCallback;
  const ResetPasswordNewPwd(
      {super.key, required this.passwordController, this.onNextCallback});

  @override
  State<ResetPasswordNewPwd> createState() => _ResetPasswordNewPwdState();
}

class _ResetPasswordNewPwdState extends State<ResetPasswordNewPwd>
    with TickerProviderStateMixin {
  final TextEditingController _confirmationController = TextEditingController();
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
    return SizedBox(
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
            child: Image.asset(
              'assets/images/authentication.png',
              fit: BoxFit.cover,
              width: getSize(context).width * 0.6,
            ),
          ),
          SizedBox(
            height: $constants.insets.sm,
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  context.t.auth.reset_password.select_your_new_password,
                  style: getTextTheme(context).titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(
                  height: $constants.insets.xs,
                ),
                Text(
                  context.t.auth.reset_password
                      .select_your_new_password_description,
                  style: getTextTheme(context).bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: $constants.insets.sm,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                AppTextFormField(
                  controller: widget.passwordController,
                  labelText: context.t.auth.reset_password.new_password,
                  labelDescription:
                      context.t.auth.reset_password.new_password_description,
                  hintText: context.t.auth.reset_password.new_password_hint,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return context
                          .t.auth.reset_password.new_password_required;
                    }
                    return null;
                  },
                  obscureText: true,
                ),
                SizedBox(
                  height: $constants.insets.sm,
                ),
                AppTextFormField(
                  controller: _confirmationController,
                  labelText: context.t.auth.reset_password.confirm_new_password,
                  labelDescription: context
                      .t.auth.reset_password.confirm_new_password_description,
                  hintText: context.t.auth.reset_password.new_password_hint,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return context
                          .t.auth.reset_password.confirm_new_password_required;
                    }
                    if (value != widget.passwordController.text) {
                      return context.t.auth.reset_password.password_mismatch;
                    }
                    return null;
                  },
                  obscureText: true,
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
                      widget.onNextCallback?.call();
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
