import 'package:app/utils/shortcuts.dart';
import 'package:flutter/material.dart';

class ResponsiveStatelessWidget extends StatelessWidget {
  const ResponsiveStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    if (isDesktop(context)) {
      return buildDesktop(context);
    } else {
      return buildMobile(context);
    }
  }

  Widget buildMobile(BuildContext context) {
    return const Placeholder();
  }

  Widget buildDesktop(BuildContext context) {
    return const Placeholder();
  }
}