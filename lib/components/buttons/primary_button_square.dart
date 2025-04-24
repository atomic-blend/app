import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/material.dart';

class PrimaryButtonSquare extends StatelessWidget {
  const PrimaryButtonSquare(
      {super.key,
      this.onPressed,
      this.emoji,
      required this.text,
      this.backgroundColor,
      this.trailing,
      this.textColor,
      this.border,
      this.height,
      this.width,
      this.outlined});

  final VoidCallback? onPressed;
  final String? emoji;
  final Widget? trailing;
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final Border? border;
  final double? height;
  final double? width;
  final bool? outlined;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            border: outlined == true
                ? Border.all(
                    color: backgroundColor ?? getTheme(context).primary)
                : border,
            borderRadius: BorderRadius.circular($constants.corners.md),
          ),
          height: height ?? 50,
          width: width,
          child: TextButton(
            onPressed: onPressed,
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(outlined == true
                  ? null
                  : backgroundColor ?? getTheme(context).primary),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      $constants.corners.md), // This makes it completely square
                ),
              ),
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              if (emoji != null) ...[
                Text(
                  emoji!,
                  style: const TextStyle(fontSize: 23),
                ),
                SizedBox(
                  width: $constants.insets.xs,
                ),
              ],
              Center(
                child: Text(
                  text,
                  style: getTextTheme(context).bodyMedium!.copyWith(
                        color: outlined == true
                            ? backgroundColor ?? getTheme(context).primary
                            : textColor ?? Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                ),
              ),
            ]),
          ),
        ),
        if (trailing != null) ...[
          Positioned(
              top: 0, bottom: 0, right: $constants.insets.xs, child: trailing!),
        ]
      ],
    );
  }
}
