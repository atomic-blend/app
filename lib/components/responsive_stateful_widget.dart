import 'package:app/utils/shortcuts.dart';
import 'package:flutter/material.dart';

abstract class ResponsiveStatefulWidget extends StatefulWidget {
  const ResponsiveStatefulWidget({super.key});

  @override
  ResponsiveState createState();
}

abstract class ResponsiveState<T extends ResponsiveStatefulWidget>
    extends State<T> {
  @override
  Widget build(BuildContext context) {
    if (isDesktop(context)) {
      return buildDesktop(context);
    } else {
      return buildMobile(context);
    }
  }

  Widget buildMobile(BuildContext context);

  Widget buildDesktop(BuildContext context);
}
