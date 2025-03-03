import 'package:app/components/buttons/primary_button.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/material.dart';

class NotLoggedInIntro extends StatelessWidget {
  final bool? isTermsAccepted;
  final VoidCallback toggleTerms;
  final VoidCallback toggleLoginProcess;
  const NotLoggedInIntro(
      {super.key,
      this.isTermsAccepted,
      required this.toggleTerms,
      required this.toggleLoginProcess});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: getSize(context).height * 0.1,
          ),
          Container(
              width: getSize(context).width * 0.6,
              padding: EdgeInsets.all($constants.insets.lg),
              decoration: BoxDecoration(
                color: getTheme(context).surfaceContainer,
                borderRadius: const BorderRadius.all(Radius.circular(150)),
              ),
              child: Image.asset('assets/images/sante-mentale.png')),
          SizedBox(
            height: $constants.insets.lg,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                context.t.app_name,
                style: getTextTheme(context)
                    .headlineMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                context.t.auth.not_logged_in.welcome,
                style: getTextTheme(context).titleSmall,
              ),
            ],
          ),
          SizedBox(
            height: $constants.insets.lg,
          ),
          SizedBox(
            width: getSize(context).width * 0.9,
            child: Column(
              children: [
                Text(context.t.auth.not_logged_in.description),
                SizedBox(
                  height: $constants.insets.lg,
                ),
                Row(
                  children: [
                    const Text(
                      "🔐",
                      style: TextStyle(fontSize: 30),
                    ),
                    SizedBox(
                      width: $constants.insets.sm,
                    ),
                    Flexible(child: Text(context.t.auth.not_logged_in.e2ee)),
                  ],
                )
              ],
            ),
          ),
          const Spacer(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Checkbox(value: isTermsAccepted, onChanged: (_) => toggleTerms()),
              Text(context.t.auth.not_logged_in.i_agree_to),
              Text(context.t.auth.not_logged_in.terms_of_service,
                  style: getTextTheme(context).bodyMedium!.copyWith(
                      color: getTheme(context).primary,
                      decoration: TextDecoration.underline)),
            ],
          ),
          PrimaryButton(
            width: getSize(context).width * 0.9,
            text: context.t.auth.not_logged_in.get_started_now,
            onPressed: () {
              if (isTermsAccepted!) {
                toggleLoginProcess();
              }
            },
          ),
          SizedBox(
            height: $constants.insets.lg,
          ),
        ],
      ),
    );
  }
}
