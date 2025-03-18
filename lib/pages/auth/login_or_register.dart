import 'package:app/components/buttons/primary_button_round.dart';
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
  bool? _isRegister;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getSize(context).height * 0.8,
      child: _isLogin == true
          ? Login(
              cancelCallback: () {
                setState(() {
                  _isLogin = null;
                  _isRegister = null;
                });
              },
            )
          : _isRegister == true
              ? Register(
                  cancelCallback: () {
                    setState(() {
                      _isLogin = null;
                      _isRegister = null;
                    });
                  },
                )
              : Center(
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
                            style:
                                getTextTheme(context).headlineSmall!.copyWith(
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
                                  setState(() {
                                    _isLogin = true;
                                    _isRegister = false;
                                  });
                                },
                                child: Text(
                                    context.t.auth.login_or_register.login)),
                            PrimaryButtonRound(
                              width: getSize(context).width * 0.9,
                              text: context.t.auth.login_or_register.register,
                              onPressed: () {
                                setState(() {
                                  _isLogin = false;
                                  _isRegister = true;
                                });
                              },
                            ),
                            SizedBox(
                              height: $constants.insets.xs,
                            ),
                            RichText(
                              text: TextSpan(
                                  text: context.t.auth.not_logged_in.i_agree_to,
                                  style: getTextTheme(context)
                                      .labelSmall!
                                      .copyWith(fontWeight: FontWeight.normal),
                                  children: [
                                    const TextSpan(text: " "),
                                    TextSpan(
                                        text: context.t.auth.not_logged_in
                                            .terms_of_service,
                                        style: const TextStyle(
                                            decoration:
                                                TextDecoration.underline))
                                  ]),
                            )
                          ],
                        ),
                      SizedBox(
                        height: $constants.insets.lg,
                      ),
                    ],
                  ),
                ),
    );
  }
}
