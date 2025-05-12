import 'package:app/components/buttons/primary_button_round.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/main.dart';
import 'package:app/utils/api_client.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:lottie/lottie.dart';

import '../../settings/modals/edit_self_hosted_url_modal.dart';

class LoginOrRegister extends StatefulWidget {
  final VoidCallback? loginCallback;
  final VoidCallback? registerCallback;
  final VoidCallback? backStepCallback;
  const LoginOrRegister(
      {super.key,
      this.loginCallback,
      this.backStepCallback,
      this.registerCallback});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _lottieController;
  final _animationDuration = const Duration(milliseconds: 300);

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
    );
    _lottieController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
      lowerBound: 0.2,
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _lottieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var selfHostedUrl = ApiClient.getSelfHostedRestApiUrl();
    return Stack(
      children: [
        SizedBox(
            width: double.infinity,
            height: isDesktop(context) ? null : getSize(context).height * 0.92,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
                        Animate(
                          controller: _animationController,
                          effects: [
                            FadeEffect(
                              duration: _animationDuration,
                              delay: const Duration(milliseconds: 0),
                            ),
                          ],
                          onPlay: (controller) => controller.forward(),
                          child: Transform.scale(
                            scale: 1.3,
                            child: Lottie.asset(
                              controller: _lottieController,
                              onLoaded: (p0) => _lottieController.loop(),
                              'assets/animations/login.json',
                              width: isDesktop(context)
                                  ? getSize(context).width * 0.2
                                  : getSize(context).width * 0.5,
                            ),
                          ),
                        ),
                        Animate(
                          controller: _animationController,
                          effects: [
                            FadeEffect(
                              duration: _animationDuration,
                              delay: const Duration(milliseconds: 0),
                            ),
                          ],
                          onPlay: (controller) => controller.forward(),
                          child: AutoSizeText(
                            maxLines: 1,
                            context.t.auth.not_logged_in.time_to_set_things_up,
                            textAlign: TextAlign.center,
                            style: getTextTheme(context)
                                .displaySmall!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: $constants.insets.md,
                        ),
                        Animate(
                          controller: _animationController,
                          onPlay: (controller) => controller.forward(),
                          effects: [
                            FadeEffect(
                              duration: _animationDuration,
                              delay: const Duration(milliseconds: 300),
                            ),
                          ],
                          child: Text.rich(
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
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: isDesktop(context)
                        ? $constants.insets.lg
                        : getSize(context).height * 0.23,
                  ),
                  GestureDetector(
                    onTap: () async {
                      String? selfHostedUrl =
                          prefs?.getString("self_hosted_rest_api_url");
                      if (selfHostedUrl == null || selfHostedUrl.isEmpty) {
                        selfHostedUrl = env?.restApiUrl;
                      }
                      await showDialog(
                          context: context,
                          builder: (context) => EditSelfHostedUrlModal(
                                selfHostedUrl: selfHostedUrl,
                              ));
                    },
                    child: Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                          text: context.t.auth.login_or_register.connecting_to,
                          children: [
                            TextSpan(
                                text:
                                    selfHostedUrl != null && selfHostedUrl != ""
                                        ? Uri.parse(ApiClient
                                                .getSelfHostedRestApiUrl()!)
                                            .host
                                        : context.t.app_name_saas,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                )),
                          ]),
                      style: getTextTheme(context).bodyMedium!.copyWith(
                            color: Colors.grey,
                          ),
                    ),
                  ),
                  const Divider(),
                  Animate(
                    controller: _animationController,
                    effects: [
                      FadeEffect(
                        duration: _animationDuration,
                        delay: const Duration(milliseconds: 500),
                      ),
                    ],
                    onPlay: (controller) => controller.forward(),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: $constants.insets.md),
                      child: isDesktop(context)
                          ? Row(
                              children: _buildButtons(context, selfHostedUrl),
                            )
                          : Column(
                              children: _buildButtons(context, selfHostedUrl),
                            ),
                    ),
                  ),
                  SizedBox(
                    height: isDesktop(context)
                        ? $constants.insets.sm
                        : getSize(context).height * 0.08,
                  )
                ],
              ),
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

  List<Widget> _buildButtons(BuildContext context, String? selfHostedUrl) {
    return [
      SizedBox(
        height: $constants.insets.xxs,
      ),
      PrimaryButtonRound(
        width: isDesktop(context)
            ? getSize(context).width * 0.15
            : double.infinity,
        text: context.t.auth.login_or_register.login,
        textColor: getTheme(context).primary,
        backgroundColor: getTheme(context).primaryContainer,
        border: Border.all(color: getTheme(context).primary, width: 2),
        onPressed: () {
          _animationController.reverseDuration =
              const Duration(milliseconds: 500);
          _animationController.reverse();
          widget.loginCallback?.call();
        },
      ),
      if (!isDesktop(context)) SizedBox(height: $constants.insets.xs),
      if (isDesktop(context)) const Spacer(),
      PrimaryButtonRound(
        width: isDesktop(context)
            ? getSize(context).width * 0.15
            : double.infinity,
        text: context.t.auth.login_or_register.register,
        fontWeight: FontWeight.w800,
        onPressed: () {
          _animationController.reverseDuration =
              const Duration(milliseconds: 500);
          _animationController.reverse();
          widget.registerCallback?.call();
        },
      )
    ];
  }
}
