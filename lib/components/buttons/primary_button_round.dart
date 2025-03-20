import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/material.dart';

class PrimaryButtonRound extends StatelessWidget {
  const PrimaryButtonRound(
      {super.key,
      this.onPressed,
      this.leadingText,
      required this.text,
      this.backgroundColor,
      this.trailing,
      this.textColor,
      this.border,
      this.height,
      this.width,
      this.fontWeight,
      this.leading});

  final VoidCallback? onPressed;
  final String? leadingText;
  final Widget? leading;
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
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (leadingText != null) ...[
                    Text(
                      leadingText!,
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
                  if (trailing != null) ...[
                    SizedBox(
                      width: $constants.insets.xs,
                    ),
                    trailing!,
                  ]
                ]),
          ),
        ),
      ],
    );
  }
}
