import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/material.dart';

class ElevatedContainer extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;
  final Color? color;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  const ElevatedContainer(
      {super.key,
      this.child,
      this.width,
      this.height,
      this.padding,
      this.color,
      this.borderRadius,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
            color: color ?? getTheme(context).surfaceContainer,
            borderRadius:
                BorderRadius.circular(borderRadius ?? $constants.insets.sm),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                offset: const Offset(0, 4),
                blurRadius: 10,
              ),
            ]),
        child: child,
      ),
    );
  }
}
