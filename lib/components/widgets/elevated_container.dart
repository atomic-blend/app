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
  final Border? border;
  const ElevatedContainer(
      {super.key,
      this.child,
      this.width,
      this.height,
      this.padding,
      this.color,
      this.borderRadius,
      this.onTap,
      this.border});

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
            border: border,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                offset: const Offset(0, 2),
                blurRadius: 8,
                spreadRadius: 0,
              ),
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                offset: const Offset(0, 8),
                blurRadius: 16,
                spreadRadius: -4,
              ),
            ]),
        child: child,
      ),
    );
  }
}
