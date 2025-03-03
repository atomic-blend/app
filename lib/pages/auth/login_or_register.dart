import 'package:app/components/buttons/primary_button.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/pages/auth/login.dart';
import 'package:app/pages/auth/register.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool? _isLogin;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: getSize(context).height * 0.1,
          ),
          SvgPicture.asset(
            'assets/images/secure_login.svg',
            width: getSize(context).width * 0.8,
          ),
          SizedBox(
            height: $constants.insets.lg,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                context.t.auth.login_or_register.title,
                style: getTextTheme(context).headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                context.t.auth.login_or_register.login_or_register,
                style: getTextTheme(context).titleMedium,
              ),
            ],
          ),
          const Spacer(),
          if (_isLogin == null)
            Column(
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()));
                    },
                    child: Text(context.t.auth.login_or_register.login)),
                PrimaryButton(
                  width: getSize(context).width * 0.9,
                  text: context.t.auth.login_or_register.register,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Register()));
                  },
                ),
              ],
            ),
          SizedBox(
            height: $constants.insets.lg,
          ),
        ],
      ),
    );
  }
}
