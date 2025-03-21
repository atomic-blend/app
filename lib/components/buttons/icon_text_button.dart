import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/cupertino.dart';

class IconTextButton extends StatelessWidget {
  final IconData? icon;
  final Color? iconColor;
  final double? iconSize;
  final Color? textColor;
  final String text;
  final String? data;
  final VoidCallback? onTap;
  final bool? iconContainer;

  const IconTextButton({
    super.key,
    this.icon,
    this.iconColor,
    required this.text,
    this.textColor,
    this.onTap,
    this.data,
    this.iconSize,
    this.iconContainer,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          if (icon != null) ...[
            Container(
              padding: iconContainer == true
                  ? EdgeInsets.all($constants.insets.xs)
                  : EdgeInsets.zero,
              decoration: iconContainer == true
                  ? BoxDecoration(
                      color: iconColor!.withValues(alpha: .1),
                      borderRadius: BorderRadius.circular(8),
                    )
                  : const BoxDecoration(),
              child: Icon(
                icon,
                size: iconSize ?? 24,
                color: iconColor,
              ),
            ),
            SizedBox(width: $constants.insets.sm),
          ],
          Text(text,
              style:
                  getTextTheme(context).bodyMedium!.copyWith(color: textColor)),
          const Spacer(),
          if (data != null) Text(data!),
        ],
      ),
    );
  }
}
