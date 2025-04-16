import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconTextPill extends StatelessWidget {
  final String title;
  final IconData? icon;
  final double? height;
  final double? width;
  final double? iconSize;
  final Color? color;
  const IconTextPill(
      {super.key,
      required this.title,
      this.icon,
      this.iconSize,
      this.height,
      this.width,
      this.color});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: getSize(context).width * 0.15,
      ),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? getTheme(context).surfaceContainerHigh,
          borderRadius: BorderRadius.circular(
            $constants.corners.full,
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: $constants.insets.sm,
          vertical: $constants.insets.xxs,
        ),
        child: Center(
          child: AutoSizeText(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            title,
            style: getTextTheme(context).bodyMedium!.copyWith(),
          ),
        ),
      ),
    );
  }
}
