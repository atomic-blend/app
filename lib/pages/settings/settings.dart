import 'package:app/blocs/auth/auth.bloc.dart';
import 'package:app/components/buttons/icon_text_button.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/pages/settings/screens/app_settings.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: $constants.insets.xs,
          children: [
            const Icon(CupertinoIcons.gear),
            Text(context.t.settings.title,
                style: getTextTheme(context).bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    )),
          ],
        ),
      ),
      body: BlocBuilder<AuthBloc, AuthState>(builder: (contex, authState) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: $constants.insets.sm, vertical: $constants.insets.xs),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: $constants.insets.sm),
                child: IconTextButton(
                  text: context.t.settings.app_settings.title,
                  icon: CupertinoIcons.device_phone_portrait,
                  iconSize: 20,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const AppSettings();
                    }));
                  },
                ),
              ),
              if (authState is LoggedIn)
                IconTextButton(
                  text: context.t.settings.logout,
                  icon: CupertinoIcons.multiply_circle_fill,
                  iconSize: 20,
                  iconColor: Colors.red,
                  textColor: Colors.red,
                  onTap: () {
                    context.read<AuthBloc>().add(const Logout());
                    Navigator.pop(context);
                  },
                ),
            ],
          ),
        );
      }),
    );
  }
}
