import 'package:app/blocs/auth/auth.bloc.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, authState) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: $constants.insets.sm),
        child: Column(
          children: [
            AutoSizeText(
              maxLines: 1,
              context.t.home.whats_for_today,
              style: getTextTheme(context).titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            )
          ],
        ),
      );
    });
  }
}
