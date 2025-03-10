import 'package:app/components/buttons/icon_text_button.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class AppSettings extends StatelessWidget {
  const AppSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: $constants.insets.xs,
          children: [
            const Icon(LineAwesome.mobile_solid),
            Text(context.t.settings.app_settings.title,
                style: getTextTheme(context).bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    )),
          ],
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: $constants.insets.sm, vertical: $constants.insets.sm),
        child: Column(
          children: [
            FutureBuilder<String?>(
              builder: (context, snapshot) {
                final selfHostedUrl = snapshot.data;
                final data = selfHostedUrl ??
                    context.t.settings.app_settings.selfHostedUrl.not_set;
                return IconTextButton(
                  icon: LineAwesome.link_solid,
                  text: context.t.settings.app_settings.selfHostedUrl.title,
                  data: data,
                  onTap: () {},
                );
              },
              future: null,
            )
          ],
        ),
      )),
    );
  }
}
