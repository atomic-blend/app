import 'package:app/components/buttons/primary_button_round.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/pages/auth/login.dart';
import 'package:app/pages/auth/register.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:lottie/lottie.dart';

class LoginOrRegister extends StatefulWidget {
  final VoidCallback? nextStepCallback;
  final VoidCallback? backStepCallback;
  const LoginOrRegister({super.key, this.nextStepCallback, this.backStepCallback});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            width: double.infinity,
            height: getSize(context).height * 0.92,
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: $constants.insets.md),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: getSize(context).height * 0.08,
                      ),
                      Transform.scale(
                        scale: 1.3,
                        child: Lottie.asset(
                          'assets/animations/login.json',
                          width: getSize(context).width * 0.5,
                        ),
                      ),
                      AutoSizeText(
                        maxLines: 1,
                        context.t.auth.not_logged_in.time_to_set_things_up,
                        textAlign: TextAlign.center,
                        style: getTextTheme(context)
                            .displaySmall!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: $constants.insets.md,
                      ),
                      Text.rich(
                        textAlign: TextAlign.center,
                        TextSpan(
                            text: context.t.auth.not_logged_in.set_up_start,
                            style: getTextTheme(context).bodyMedium,
                            children: [
                              TextSpan(
                                  text:
                                      " ${context.t.auth.not_logged_in.e2e_app}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text:
                                      " ${context.t.auth.not_logged_in.set_up_middle}"),
                              TextSpan(
                                text:
                                    " ${context.t.auth.not_logged_in.set_up_end}",
                              ),
                              TextSpan(
                                  text:
                                      " ${context.t.auth.not_logged_in.set_up_end_bold}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                            ]),
                      )
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: $constants.insets.md),
                  child: Column(
                    children: [
                      PrimaryButtonRound(
                        text: context.t.auth.login_or_register.login,
                        textColor: getTheme(context).primary,
                        backgroundColor: getTheme(context).primaryContainer,
                        border: Border.all(
                            color: getTheme(context).primary, width: 2),
                      ),
                      SizedBox(height: $constants.insets.xs),
                      PrimaryButtonRound(
                        text: context.t.auth.login_or_register.register,
                        fontWeight: FontWeight.w800,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: getSize(context).height * 0.08,
                )
              ],
            )),
        Positioned(
          left: $constants.insets.sm,
          top: $constants.insets.md,
          child: GestureDetector(
            onTap: widget.backStepCallback,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  OctIcons.arrow_left,
                  size: 18,
                ),
                SizedBox(
                  width: $constants.insets.xxs,
                ),
                Text(
                  context.t.actions.back,
                  style: getTextTheme(context)
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
