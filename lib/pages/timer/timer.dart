import 'package:app/components/buttons/primary_button_square.dart';
import 'package:app/components/widgets/elevated_container.dart';
import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

// TODO: add a switch between pomodoro and stopwatch
// TODO: when the notification for pomodoro happen on the foreground, show an ui with the option to start a new pomodoro or reset the timer
// TODO: add a settings page to change the pomodoro duration and break duration
// TODO: when pomo is completed on foreground, call completePomodoro() from TimerUtils
// TODO: in TimerUtils, send the time entry to the backend when the pomodoro is completed in completePomodoro()
// TODO: in the overview tab, show the pomo status and the time spent on the current pomo if there's one running
// TODO: implement the background pomo notification handler when a notification is tapped from outside the app (pass params to determine the notification tapped + call completePomodoro() from TimerUtils)


class Timer extends StatefulWidget {
  final TaskEntity? task;
  const Timer({super.key, this.task});

  @override
  State<Timer> createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  final double? _progress = 0.0;

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
        leading: widget.task != null
            ? IconButton(
                icon: const Icon(CupertinoIcons.xmark),
                onPressed: () {
                  Navigator.pop(context, widget.task);
                },
              )
            : null,
      ),
      body: Column(
        children: [
          SizedBox(
            height: getSize(context).height * 0.4,
            width: getSize(context).width * 0.8,
            child: Center(
              child: CircularPercentIndicator(
                radius: 150.0,
                lineWidth: 12.0,
                animation: true,
                animateFromLastPercent: true,
                circularStrokeCap: CircularStrokeCap.round,
                backgroundColor: getTheme(context).surfaceContainer.darken(10),
                percent: _progress ?? 0.0,
                center: Text(
                  context.t.timer.no_timer_running,
                  style: getTextTheme(context).titleSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                progressColor: getTheme(context).primary,
              ),
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedContainer(
                padding: EdgeInsets.all($constants.insets.lg),
                borderRadius: $constants.corners.full,
                child: const Icon(
                  CupertinoIcons.arrow_counterclockwise,
                  size: 40,
                ),
                onTap: () {},
              ),
              ElevatedContainer(
                padding: EdgeInsets.all($constants.insets.lg),
                borderRadius: $constants.corners.full,
                child: const Icon(
                  CupertinoIcons.play_fill,
                  size: 40,
                ),
                onTap: () {},
              ),
            ],
          ),
          SizedBox(
            height: getSize(context).height * 0.15,
          )
        ],
      ),
    );
  }
}
