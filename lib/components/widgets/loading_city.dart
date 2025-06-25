import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingAnimated extends StatelessWidget {
  final double? imageWidth;
  final double? imageHeight;
  final String? title;
  final String? animationPath;
  const LoadingAnimated(
      {super.key,
      this.imageWidth,
      this.title,
      this.animationPath,
      this.imageHeight});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          animationPath ?? 'assets/animations/loading-city.json',
          width: imageWidth ?? getSize(context).width * 0.5,
          height: imageHeight ?? getSize(context).height * 0.3,
        ),
        if (title != null)
          Padding(
            padding: EdgeInsets.symmetric(vertical: $constants.insets.xxs),
            child: AutoSizeText(
              title!,
              style: getTextTheme(context).titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
      ],
    );
  }
}
