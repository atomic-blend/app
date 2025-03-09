import 'package:app/components/buttons/primary_button.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/pages/auth/login_or_register.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotLoggedInWidget extends StatelessWidget {
  const NotLoggedInWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: $constants.insets.lg,
        ),
        Text(
          context.t.auth.not_logged_in.welcome,
          style: getTextTheme(context)
              .headlineMedium!
              .copyWith(fontWeight: FontWeight.w500),
        ),
        SvgPicture.asset(
          'assets/images/secure_login.svg',
          width: getSize(context).width * 0.8,
        ),
        SizedBox(
          height: $constants.insets.lg,
        ),
        PrimaryButton(
          width: getSize(context).width * 0.9,
          text: context.t.auth.not_logged_in.get_started_now,
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) => const LoginOrRegister(),
                isScrollControlled: true);
          },
        ),
      ],
    );
  }
}
