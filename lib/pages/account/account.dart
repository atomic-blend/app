import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getSize(context).height * 0.87,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: $constants.insets.md,
                horizontal: $constants.insets.md),
            child: Row(
              children: [
                const Icon(CupertinoIcons.arrow_left),
                const Spacer(),
                Text(context.t.settings.logout)
              ],
            ),
          )
        ],
      ),
    );
  }
}
