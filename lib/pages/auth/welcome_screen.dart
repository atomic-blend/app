import 'package:app/components/buttons/primary_button_square.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/pages/auth/login_or_register.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatelessWidget {
  final VoidCallback? nextStepCallback;
  const WelcomeScreen({super.key, this.nextStepCallback});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getSize(context).height * 0.92,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: $constants.insets.md),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: $constants.insets.lg,
                ),
                Transform.scale(
                  scale: 1.2,
                  child: Lottie.asset(
                    'assets/animations/graph.json',
                    width: getSize(context).width * 0.5,
                  ),
                ),
                AutoSizeText(
                  maxLines: 1,
                  context.t.auth.not_logged_in.welcome,
                  textAlign: TextAlign.center,
                  style: getTextTheme(context)
                      .displaySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: $constants.insets.md,
                ),
                Text.rich(
                  TextSpan(
                      text: context.t.auth.not_logged_in.description_start,
                      children: [
                        TextSpan(
                            text: " ${context.t.auth.not_logged_in.e2e_app}",
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                " ${context.t.auth.not_logged_in.description_middle}"),
                        TextSpan(
                            text:
                                " ${context.t.auth.not_logged_in.description_middle_bold}",
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                "\n\n${context.t.auth.not_logged_in.description_end}"),
                      ]),
                  textAlign: TextAlign.center,
                  style: getTextTheme(context).bodyMedium,
                ),
              ],
            ),
          ),
          const Spacer(),
          const Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: $constants.insets.md),
            height: getSize(context).height * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // TextButton(
                //   onPressed: () {},
                //   child: Text(context.t.actions.cancel,
                //       style: getTextTheme(context).titleSmall!),
                // ),
                Spacer(),
                PrimaryButtonSquare(
                  text: context.t.actions.next,
                  backgroundColor: getTheme(context).primary,
                  onPressed: nextStepCallback,
                )
              ],
            ),
          ),
          SizedBox(
            height: $constants.insets.md,
          ),
        ],
      ),
    );
  }
}
