import 'package:app/components/buttons/primary_button_round.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/pages/auth/login.dart';
import 'package:app/pages/auth/register.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                ],
              ),
            )
          ],
        ));
  }
}
