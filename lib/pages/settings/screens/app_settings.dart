import 'package:app/components/buttons/icon_text_button.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/main.dart';
import 'package:app/pages/settings/modals/edit_self_hosted_url_modal.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class AppSettings extends StatefulWidget {
  const AppSettings({super.key});

  @override
  State<AppSettings> createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
  String? selfHostedUrl;

  @override
  void initState() {
    getSelfHostedUrl();
    super.initState();
  }

  getSelfHostedUrl() {
    setState(() {
      selfHostedUrl = prefs?.getString("self_hosted_rest_api_url");
    });
  }

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
            IconTextButton(
              icon: LineAwesome.link_solid,
              text: context.t.settings.app_settings.selfHostedUrl.title,
              data: selfHostedUrl == "" || selfHostedUrl == null
                  ? context.t.settings.app_settings.selfHostedUrl.not_set
                  : selfHostedUrl,
              onTap: () async {
                await showDialog(
                    context: context,
                    builder: (context) => EditSelfHostedUrlModal(
                          selfHostedUrl:
                              prefs?.getString("self_hosted_rest_api_url"),
                        ));
                getSelfHostedUrl();
              },
            )
          ],
        ),
      )),
    );
  }
}
