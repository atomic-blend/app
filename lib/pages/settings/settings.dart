import 'package:app/components/buttons/icon_text_button.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/services/firebase.service.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.t.settings.title,
            style: getTextTheme(context).headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                )),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: $constants.insets.sm, vertical: $constants.insets.xs),
        child: Column(
          children: [
            IconTextButton(
              text: context.t.settings.logout,
              icon: LineAwesome.sign_out_alt_solid,
              iconColor: Colors.red,
              textColor: Colors.red,
              onTap: () {
                FirebaseService.logout(context);
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
