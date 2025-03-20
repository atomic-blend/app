import 'package:app/utils/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SideMenuItem extends StatelessWidget {
  final String title;
  final Widget body;
  bool? isSelected;
  final VoidCallback onTap;
  final Color color;
  final bool? iconContainer;
  final IconData icon;

  SideMenuItem({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    this.iconContainer,
    required this.body,
    required this.onTap,
    this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: $constants.insets.xs),
          Container(
              padding: iconContainer == true
                  ? EdgeInsets.all($constants.insets.xs)
                  : EdgeInsets.zero,
              decoration: iconContainer == true
                  ? BoxDecoration(
                      color: color.withValues(alpha: .1),
                      border: isSelected == true
                          ? Border.all(color: color, width: 1)
                          : null,
                      borderRadius:
                          BorderRadius.circular($constants.corners.md),
                    )
                  : const BoxDecoration(),
              child: Icon(icon, color: color)),
        ],
      ),
    );
  }
}
