import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconTextCard extends StatelessWidget {
  final String title;
  final String? value;
  final double? width;
  final Color? color;
  final IconData icon;
  final double? iconSize;
  const IconTextCard(
      {super.key,
      required this.title,
      this.value,
      required this.icon,
      this.iconSize,
      this.width,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: color ?? getTheme(context).surfaceContainerHigh,
        borderRadius: BorderRadius.circular(
          $constants.corners.sm,
        ),
      ),
      padding: EdgeInsets.all($constants.insets.sm),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: iconSize ?? 20,
              ),
              SizedBox(
                width: $constants.insets.sm,
              ),
              Text(
                title,
                style: getTextTheme(context).bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              )
            ],
          ),
          if (value != null) ...[
            SizedBox(
              height: $constants.insets.sm,
            ),
            AutoSizeText(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              value!,
              style: getTextTheme(context).bodyMedium!.copyWith(),
            ),
          ]
        ],
      ),
    );
  }
}
