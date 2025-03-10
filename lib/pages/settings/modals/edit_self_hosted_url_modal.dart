import 'package:app/components/buttons/primary_button.dart';
import 'package:app/components/forms/app_text_form_field.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/api_client.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/material.dart';

class EditSelfHostedUrlModal extends StatefulWidget {
  final String? selfHostedUrl;
  const EditSelfHostedUrlModal({super.key, this.selfHostedUrl});

  @override
  State<EditSelfHostedUrlModal> createState() => _EditSelfHostedUrlModalState();
}

class _EditSelfHostedUrlModalState extends State<EditSelfHostedUrlModal> {
  final _selfHostedUrlController = TextEditingController();

  @override
  void initState() {
    _selfHostedUrlController.text = widget.selfHostedUrl ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: getTheme(context).surface,
      child: Padding(
        padding: EdgeInsets.all($constants.insets.md),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              context.t.settings.app_settings.selfHostedUrl.title,
              style: getTextTheme(context).titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: $constants.insets.xs),
            Text(context.t.settings.app_settings.selfHostedUrl.description),
            SizedBox(height: $constants.insets.sm),
            AppTextFormField(
              controller: _selfHostedUrlController,
              hintText:
                  context.t.settings.app_settings.selfHostedUrl.placeholder,
            ),
            SizedBox(height: $constants.insets.md),
            Row(
              children: [
                Expanded(
                    child: PrimaryButton(
                        border: Border.all(color: getTheme(context).primary),
                        textColor: getTheme(context).primary,
                        backgroundColor: getTheme(context).surface,
                        text: context.t.actions.cancel,
                        onPressed: () {
                          Navigator.pop(context);
                        })),
                SizedBox(width: $constants.insets.sm),
                Expanded(
                    child: PrimaryButton(
                        text: context.t.actions.save,
                        onPressed: () async{
                          bool result = await ApiClient.setSelfHostedRestApiUrl(_selfHostedUrlController.text);
                          if(result){
                            Navigator.pop(context);
                          }
                        })),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
