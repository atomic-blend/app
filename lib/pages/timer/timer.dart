import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/material.dart';

class Timer extends StatefulWidget {
  const Timer({super.key});

  @override
  State<Timer> createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.t.timer.title,
          style: getTextTheme(context).headlineSmall!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: Center(
        child: Text(context.t.timer.no_timer_running),
      ),
    );
  }
}
