import 'package:app/components/buttons/icon_text_button.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/pages/settings/settings.dart';
import 'package:app/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MoreApps extends StatefulWidget {
  const MoreApps({super.key});

  @override
  State<MoreApps> createState() => _MoreAppsState();
}

class _MoreAppsState extends State<MoreApps> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: $constants.insets.md),
        child: Column(
          children: [
            IconTextButton(
              text: context.t.settings.title,
              icon: CupertinoIcons.gear,
              iconSize: 20,
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Settings()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
