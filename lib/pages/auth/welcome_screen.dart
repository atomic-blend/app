import 'package:app/components/buttons/primary_button_square.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/pages/auth/login_or_register.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatefulWidget {
  final VoidCallback? nextStepCallback;
  const WelcomeScreen({super.key, this.nextStepCallback});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    _animationController = AnimationController(
      vsync: this,
    );
    super.initState();
  }

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
                Animate(
                  effects: const [
                    FadeEffect(
                      duration: Duration(milliseconds: 1000),
                      delay: Duration(milliseconds: 0),
                    ),
                  ],
                  onPlay: (controller) => controller.forward(),
                  child: Transform.scale(
                    scale: 1.2,
                    child: Lottie.asset(
                      'assets/animations/graph.json',
                      width: getSize(context).width * 0.5,
                    ),
                  ),
                ),
                Animate(
                  controller: _animationController,
                  effects: const [
                    FadeEffect(
                      duration: Duration(milliseconds: 1000),
                      delay: Duration(milliseconds: 500),
                    )
                  ],
                  onPlay: (controller) => controller.forward(),
                  child: AutoSizeText(
                    maxLines: 1,
                    context.t.auth.not_logged_in.welcome,
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
                  effects: const [
                    FadeEffect(
                      duration: Duration(milliseconds: 1000),
                      delay: Duration(milliseconds: 1000),
                    )
                  ],
                  onPlay: (controller) => controller.forward(),
                  child: Text.rich(
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
                ),
              ],
            ),
          ),
          const Spacer(),
          const Divider(),
          Animate(
            controller: _animationController,
            effects: const [
              FadeEffect(
                duration: Duration(milliseconds: 1000),
                delay: Duration(milliseconds: 1500),
              )
            ],
            onPlay: (controller) => controller.forward(),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: $constants.insets.md),
              height: getSize(context).height * 0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Spacer(),
                  PrimaryButtonSquare(
                    text: context.t.actions.next,
                    backgroundColor: getTheme(context).primary,
                    onPressed: () async {
                      _animationController.reverseDuration = const Duration(
                        milliseconds: 700,
                      );
                      await _animationController.reverse(from: 1.0);
                      widget.nextStepCallback?.call();
                    },
                  )
                ],
              ),
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
