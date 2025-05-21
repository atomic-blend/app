import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/material.dart';

class ElevatedContainer extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  const ElevatedContainer(
      {super.key, this.child, this.width, this.height, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
          color: getTheme(context).surfaceContainer,
          borderRadius: BorderRadius.circular($constants.insets.sm),
          boxShadow: [
            BoxShadow(
              color: getTheme(context).shadow.withValues(alpha: 0.1),
              offset: const Offset(0, 0),
              blurRadius: 8,
              spreadRadius: 1,
            ),
          ]),
      child: child,
    );
  }
}
