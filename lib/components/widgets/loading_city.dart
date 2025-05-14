import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingAnimated extends StatelessWidget {
  final double? imageWidth;
  final String? title;
  final String? animationPath;
  const LoadingAnimated(
      {super.key, this.imageWidth, this.title, this.animationPath});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: isDesktop(context) ? null : getSize(context).height * 0.92,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: getSize(context).height * 0.15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
              animationPath ?? 'assets/animations/loading-city.json',
              width: imageWidth ?? getSize(context).width * 0.5,
            ),
            if (title != null)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: $constants.insets.md),
                child: AutoSizeText(
                  title!,
                  style: getTextTheme(context).titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
