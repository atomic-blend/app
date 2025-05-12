import 'package:app/blocs/auth/auth.bloc.dart';
import 'package:app/components/buttons/primary_button_round.dart';
import 'package:app/components/forms/app_text_form_field.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfileEdit extends StatefulWidget {
  const UserProfileEdit({super.key});

  @override
  State<UserProfileEdit> createState() => _UserProfileEditState();
}

class _UserProfileEditState extends State<UserProfileEdit> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    context.read<AuthBloc>().state.user?.email != null
        ? _emailController.text = context.read<AuthBloc>().state.user!.email!
        : _emailController.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (BuildContext context, AuthState state) {
        if (state is UserUpdateProfileSuccess) {
          Navigator.of(context).pop();
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(builder: (context, authState) {
        return Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  AppTextFormField(
                    controller: _emailController,
                    labelText: context.t.account.profile.email,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return context.t.account.profile.email_missing;
                      }

                      if (value == authState.user?.email) {
                        return context.t.account.profile.email_same;
                      }
                      return null;
                    },
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: $constants.insets.md),
                child: PrimaryButtonRound(
                    width: double.infinity,
                    text: context.t.actions.save,
                    onPressed: () {
                      if (_formKey.currentState?.validate() == false) {
                        return;
                      }

                      final user = authState.user;
                      user?.email = _emailController.text;
                      if (user == null) {
                        return;
                      }
                      context.read<AuthBloc>().add(
                            UpdateUserProfile(
                              user,
                            ),
                          );
                    }),
              ),
            ],
          ),
        );
      }),
    );
  }
}
