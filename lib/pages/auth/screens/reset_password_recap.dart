import 'package:app/blocs/auth/auth.bloc.dart';
import 'package:app/components/buttons/primary_button_square.dart';
import 'package:app/components/forms/app_text_form_field.dart';
import 'package:app/entities/encryption/encryption_key.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/services/encryption.service.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class ResetPasswordRecap extends StatefulWidget {
  final String email;
  final String code;
  final String newPassword;
  final String? mnemonicKey;
  final bool restoreData;

  const ResetPasswordRecap(
      {super.key,
      required this.email,
      required this.code,
      this.mnemonicKey,
      required this.restoreData,
      required this.newPassword});

  @override
  State<ResetPasswordRecap> createState() => _ResetPasswordRecapState();
}

class _ResetPasswordRecapState extends State<ResetPasswordRecap>
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
          SizedBox(
            width: double.infinity,
            child: Column(
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
                  context.t.auth.reset_password.recap_subtitle,
                  style: getTextTheme(context).bodyMedium!.copyWith(
                        color: Colors.grey,
                      ),
                ),
                SizedBox(
                  height: $constants.insets.xs,
                ),
              ],
            ),
          ),
          SizedBox(
            height: $constants.insets.sm,
          ),
          Container(
            padding: EdgeInsets.all(
              $constants.insets.sm,
            ),
            decoration: BoxDecoration(
              color: getTheme(context).surfaceContainer,
              borderRadius: BorderRadius.circular($constants.insets.sm),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      context.t.auth.reset_password.email,
                      style: getTextTheme(context).bodyMedium,
                    ),
                    const Spacer(),
                    Text(
                      widget.email,
                      style: getTextTheme(context).bodyMedium,
                    ),
                  ],
                ),
                SizedBox(
                  height: $constants.insets.xs,
                ),
                Row(
                  children: [
                    Text(
                      context.t.auth.reset_password.confirmation_code,
                      style: getTextTheme(context).bodyMedium,
                    ),
                    const Spacer(),
                    Text(
                      widget.code
                          .replaceRange(0, widget.code.length - 4, "****"),
                      style: getTextTheme(context).bodyMedium,
                    ),
                  ],
                ),
                SizedBox(
                  height: $constants.insets.xs,
                ),
                Row(
                  children: [
                    Text(
                      context.t.auth.reset_password.new_password,
                      style: getTextTheme(context).bodyMedium,
                    ),
                    const Spacer(),
                    Text(
                      widget.newPassword.replaceRange(
                          0, widget.newPassword.length - 4, "****"),
                      style: getTextTheme(context).bodyMedium,
                    ),
                  ],
                ),
                SizedBox(
                  height: $constants.insets.xs,
                ),
                Row(
                  children: [
                    Text(
                      context
                          .t.auth.reset_password.do_you_have_your_mnemonic_key,
                      style: getTextTheme(context).bodyMedium,
                    ),
                    const Spacer(),
                    Text(
                      widget.restoreData
                          ? context.t.auth.reset_password.yes
                          : context.t.auth.reset_password.no,
                      style: getTextTheme(context).bodyMedium,
                    ),
                  ],
                ),
                SizedBox(
                  height: $constants.insets.sm,
                ),
                if (widget.restoreData)
                  Row(
                    children: [
                      Text(
                        context.t.auth.reset_password.mnemonic_key,
                        style: getTextTheme(context).bodyMedium,
                      ),
                      const Spacer(),
                      Text(
                        widget.mnemonicKey!.replaceRange(
                            0, widget.mnemonicKey!.length - 4, "****"),
                        style: getTextTheme(context).bodyMedium,
                      ),
                    ],
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
                    text: context.t.auth.reset_password.confirm_reset,
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

                      EncryptionKeyEntity? keySet;
                      if (widget.restoreData) {
                        //TODO: if restoreData is true, use mnemonicKey to decrypt the existing backup key, then generate a new keySet from an existing data key
                      } else {
                        // generate a new keySet from the new password
                        keySet = await EncryptionService.generateKeySet(
                          widget.newPassword,
                        );
                      }

                      if (keySet == null) {
                        return;
                      }
                      
                      //TODO: on catch success, display mnemonic + confirm mnemonic, then pop the page to return to login

                      context.read<AuthBloc>().add(
                            ConfirmResetPassword(
                              resetCode: widget.code,
                              resetData: !widget.restoreData,
                              newPassword: widget.newPassword,
                              userKey: keySet.userKey,
                              userSalt: keySet.salt,
                              backupKey: keySet.backupKey,
                              backupSalt: keySet.mnemonicSalt,
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
    );
  }
}
