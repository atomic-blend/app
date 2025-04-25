import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';

class IconTextPill extends StatelessWidget {
  final String title;
  final IconData? icon;
  final double? height;
  final bool? outlined;
  final double? width;
  final double? iconSize;
  final Color? color;
  final VoidCallback? onDelete;
  const IconTextPill(
      {super.key,
      required this.title,
      this.icon,
      this.iconSize,
      this.height,
      this.width,
      this.color,
      this.onDelete,
      this.outlined});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ConstrainedBox(
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
              border: outlined == true
                  ? Border.all(
                      color: getTheme(context).primary,
                      width: 1,
                    )
                  : null,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: $constants.insets.sm,
              vertical: $constants.insets.xxs,
            ),
            child: Center(
              child: Row(
                children: [
                  AutoSizeText(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    title,
                    style: getTextTheme(context).bodyMedium!.copyWith(),
                  ),
                  if (onDelete != null) ...[
                    SizedBox(
                      width: $constants.insets.xs,
                    ),
                    GestureDetector(
                      onTap: onDelete,
                      child: Container(
                        decoration: BoxDecoration(
                          color: getTheme(context).error,
                          borderRadius:
                              BorderRadius.circular($constants.corners.md),
                        ),
                        padding: const EdgeInsets.all(2),
                        child: Icon(
                          CupertinoIcons.xmark,
                          color: getTheme(context).surface,
                          size: 12,
                        ),
                      ),
                    ),
                  ]
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
