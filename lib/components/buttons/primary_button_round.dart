import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/material.dart';

class PrimaryButtonRound extends StatelessWidget {
  const PrimaryButtonRound(
      {super.key,
      this.onPressed,
      this.emoji,
      required this.text,
      this.backgroundColor,
      this.trailing,
      this.textColor,
      this.border,
      this.height,
      this.width, this.fontWeight});

  final VoidCallback? onPressed;
  final String? emoji;
  final FontWeight? fontWeight;
  final Widget? trailing;
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final Border? border;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            border: border,
            borderRadius: BorderRadius.circular($constants.corners.full),
          ),
          height: height ?? 50,
          width: width,
          child: TextButton(
            onPressed: onPressed,
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                  backgroundColor ?? getTheme(context).primary),
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
                        color: textColor ?? Colors.white,
                        fontWeight: fontWeight,
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
