import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../i18n/strings.g.dart';

class UnderConstruction extends StatelessWidget {
  final CONSTRUCTION_ANIMATIONS = [
    {
      "path": 'assets/animations/man-working-back.json',
      "width": 0.6,
    },
    {
      "path": 'assets/animations/man-working-floor.json',
      "width": 0.8,
    },
    {
      "path": 'assets/animations/robot-arm.json',
      "width": 0.6,
    },
  ];
  UnderConstruction({super.key});

  @override
  Widget build(BuildContext context) {
    final randomIndex =
        (DateTime.now().millisecondsSinceEpoch / 1000).toInt() % 3;
    final animationPath = CONSTRUCTION_ANIMATIONS[randomIndex];
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: $constants.insets.lg,
        ),
        child: Column(
          children: [
            SizedBox(
              height: $constants.insets.md,
            ),
            Transform.scale(
              scale: 1.3,
              child: Lottie.asset(
                animationPath["path"] as String,
                width:
                    getSize(context).width * (animationPath["width"] as double),
              ),
            ),
            AutoSizeText(
              maxLines: 1,
              context.t.under_construction.title,
              style: getTextTheme(context).titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(
              height: $constants.insets.xs,
            ),
            AutoSizeText(
              context.t.under_construction.description,
              textAlign: TextAlign.center,
              style: getTextTheme(context).bodyMedium!.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
