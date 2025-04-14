import 'package:app/blocs/auth/auth.bloc.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfileInfos extends StatelessWidget {
  const UserProfileInfos({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, authState) {
      return Column(
        children: [
          _generateItem(
              context, context.t.account.profile.email, authState.user?.email),
        ],
      );
    });
  }

  _generateItem(BuildContext context, String title, String? value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: getTextTheme(context).titleSmall!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        SizedBox(
          height: $constants.insets.sm,
        ),
        Text(
          value ?? context.t.account.profile.undefined,
          style: getTextTheme(context).bodyMedium!.copyWith(
                fontWeight: FontWeight.w400,
              ),
        ),
      ],
    );
  }
}
