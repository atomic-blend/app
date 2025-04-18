import 'package:app/components/buttons/icon_text_button.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/pages/account/change_pwd_modal.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Security extends StatelessWidget {
  const Security({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.t.account.security_and_privacy.title,
          style: getTextTheme(context).bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: $constants.insets.sm,
          vertical: $constants.insets.sm,
        ),
        child: Column(
          children: [
            IconTextButton(
              text:
                  context.t.account.security_and_privacy.change_password.title,
              icon: CupertinoIcons.padlock,
              iconContainer: true,
              iconSize: 20,
              iconColor: Colors.grey[700],
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => const ChangePwdModal(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
