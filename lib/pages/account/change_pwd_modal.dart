import 'package:app/blocs/auth/auth.bloc.dart';
import 'package:app/components/buttons/primary_button_square.dart';
import 'package:app/components/forms/app_text_form_field.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/services/encryption.service.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePwdModal extends StatefulWidget {
  const ChangePwdModal({super.key});

  @override
  State<ChangePwdModal> createState() => _ChangePwdModalState();
}

class _ChangePwdModalState extends State<ChangePwdModal> {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, authState) {
      return SizedBox(
        height: getSize(context).height * 0.5,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: $constants.insets.sm,
            vertical: $constants.insets.sm,
          ),
          child: Stack(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Center(
                      child: AutoSizeText(
                        context.t.account.security_and_privacy.change_password
                            .title,
                        style: getTextTheme(context).titleMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(
                      height: $constants.insets.sm,
                    ),
                    AutoSizeText(
                      context.t.account.security_and_privacy.change_password
                          .warning_changing_pws_will_log_you_out,
                      style: getTextTheme(context).bodyMedium!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: getTheme(context).error,
                          ),
                    ),
                    SizedBox(
                      height: $constants.insets.sm,
                    ),
                    AppTextFormField(
                      controller: _oldPasswordController,
                      labelText: context.t.account.security_and_privacy
                          .change_password.old_password,
                      hintText: context.t.account.security_and_privacy
                          .change_password.password_hint,
                      validator: (newValue) {
                        if (newValue == null || newValue.isEmpty) {
                          return context.t.account.security_and_privacy
                              .change_password.old_password_required;
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: $constants.insets.xs,
                    ),
                    AppTextFormField(
                      controller: _newPasswordController,
                      labelText: context.t.account.security_and_privacy
                          .change_password.new_password,
                      hintText: context.t.account.security_and_privacy
                          .change_password.password_hint,
                      validator: (newValue) {
                        if (newValue == null || newValue.isEmpty) {
                          return context.t.account.security_and_privacy
                              .change_password.new_password_required;
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: $constants.insets.xs,
                    ),
                    AppTextFormField(
                      controller: _confirmPasswordController,
                      labelText: context.t.account.security_and_privacy
                          .change_password.confirm_password,
                      hintText: context.t.account.security_and_privacy
                          .change_password.password_hint,
                      validator: (newValue) {
                        if (newValue == null || newValue.isEmpty) {
                          return context.t.account.security_and_privacy
                              .change_password.confirm_password_required;
                        }
                        if (newValue != _newPasswordController.text) {
                          return context.t.account.security_and_privacy
                              .change_password.password_mismatch;
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: $constants.insets.xs,
                    ),
                    const Spacer(),
                    PrimaryButtonSquare(
                      text: context.t.actions.save,
                      onPressed: () async {
                        if (!_formKey.currentState!.validate()) {
                          return;
                        }

                        try {
                          final refreshedKey =
                              await EncryptionService.refreshUserDataKey(
                            authState.user!.keySet,
                            _oldPasswordController.text,
                            _newPasswordController.text,
                          );

                          if (!context.mounted) return;
                          context.read<AuthBloc>().add(ChangePassword(
                                _oldPasswordController.text,
                                _newPasswordController.text,
                                refreshedKey["rawUserKey"]!,
                                refreshedKey["newEncryptedDataKey"]!,
                                refreshedKey["newUserSalt"]!,
                              ));
                        } on Exception catch (e) {
                          if (kDebugMode) {
                            print(e);
                          }
                        }
                      },
                    ),
                    SizedBox(
                      height: $constants.insets.md,
                    ),
                  ],
                ),
              ),
              Positioned(
                left: $constants.insets.xxs,
                top: $constants.insets.xxs,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    CupertinoIcons.back,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
