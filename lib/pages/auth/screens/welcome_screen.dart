import 'package:app/components/buttons/primary_button_square.dart';
import 'package:app/i18n/strings.g.dart';
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
  final _animationDuration = const Duration(milliseconds: 250);

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: isDesktop(context) ? null : getSize(context).height * 0.92,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
                    effects: [
                      FadeEffect(
                        duration: _animationDuration,
                        delay: const Duration(milliseconds: 0),
                      ),
                    ],
                    onPlay: (controller) => controller.forward(),
                    child: Transform.scale(
                      scale: 1.2,
                      child: Lottie.asset(
                        'assets/animations/graph.json',
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
                    effects: [
                      FadeEffect(
                        duration: _animationDuration,
                        delay: const Duration(milliseconds: 300),
                      )
                    ],
                    onPlay: (controller) => controller.forward(),
                    child: Text.rich(
                      TextSpan(
                          text: context.t.auth.not_logged_in.description_start,
                          children: [
                            TextSpan(
                                text:
                                    " ${context.t.auth.not_logged_in.e2e_app}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    " ${context.t.auth.not_logged_in.description_middle}"),
                            TextSpan(
                                text:
                                    " ${context.t.auth.not_logged_in.description_middle_bold}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
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
            SizedBox(
              height: isDesktop(context)
                  ? $constants.insets.lg
                  : getSize(context).height * 0.23,
            ),
            const Divider(),
            Animate(
              controller: _animationController,
              effects: [
                FadeEffect(
                  duration: _animationDuration,
                  delay: const Duration(milliseconds: 500),
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
      ),
    );
  }
}
