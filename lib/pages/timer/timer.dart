import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:app/blocs/tasks/tasks.bloc.dart';
import 'package:app/components/buttons/primary_button_square.dart';
import 'package:app/components/buttons/task_item.dart';
import 'package:app/components/forms/search_bar.dart';
import 'package:app/components/widgets/elevated_container.dart';
import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:jiffy/jiffy.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

// DONE: add a switch between pomodoro and stopwatch
// TODO: add a task selector to choose the task to associate with
// TODO: when the notification for pomodoro happen on the foreground, show an ui with the option to start a new pomodoro or reset the timer
// TODO: add a selector to change the pomodoro duration or break duration
// TODO: when pomo is completed on foreground, call pomodoroComplete() from TimerUtils
// TODO: in TimerUtils, send the time entry to the backend when the pomodoro is completed in pomodoroComplete()
// TODO: in the overview tab, show the pomo status and the time spent on the current pomo if there's one running
// TODO: implement the background pomo notification handler when a notification is tapped from outside the app (pass params to determine the notification tapped + call pomodoroComplete() from TimerUtils)
// TODO: when the app starts, check if there's a pomo running and restore the timer.periodic with the pomo duration and check if the pomo is completed or not at each tick to run the pomodoroComplete() method
// TODO: add a duration selector to choose the pomo duration and store the duration in app cubit state
// TODO: test on desktop

class Timer extends StatefulWidget {
  final TaskEntity? task;
  const Timer({super.key, this.task});

  @override
  State<Timer> createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  int mode = 0; // 0 for pomodoro, 1 for stopwatch
  double? _progress = 0.0;
  TaskEntity? _task;
  final TextEditingController _searchController = TextEditingController();

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
      body: BlocBuilder<TasksBloc, TasksState>(builder: (context, taskState) {
        return Column(
          children: [
            SizedBox(
              height: 30,
              child: AnimatedToggleSwitch<int?>.rolling(
                current: mode,
                indicatorSize: Size.fromWidth(getSize(context).width * 0.8 / 2),
                values: const [0, 1],
                iconBuilder: (value, foreground) {
                  return Text(context.t.timer.modes.values.elementAt(value!),
                      style: getTextTheme(context).bodyMedium!.copyWith());
                },
                styleBuilder: (value) {
                  return ToggleStyle(
                    borderColor: Colors.transparent,
                    indicatorColor: value == mode
                        ? getTheme(context).surface
                        : getTheme(context).surfaceContainer,
                    backgroundColor: getTheme(context).surfaceContainer,
                  );
                },
                onChanged: (value) {
                  if (value == null) return;
                  setState(() {
                    mode = value;
                  });
                },
              ),
            ),
            SizedBox(
              height: $constants.insets.lg,
            ),
            if (taskState.tasks != null && taskState.tasks!.isNotEmpty)
              CustomPopup(
                backgroundColor: getTheme(context).surface,
                content: Container(
                  height: getSize(context).height * 0.4,
                  width: getSize(context).width * 0.8,
                  color: getTheme(context).surface,
                  padding: EdgeInsets.all($constants.insets.xxs),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      ABSearchBar(
                        controller: _searchController,
                        onSubmitted: (value) {},
                      ),
                      SizedBox(
                        height: $constants.insets.xs,
                      ),
                      ...?taskState.tasks
                          ?.where((task) => task.completed != true)
                          .map((task) => Padding(
                                padding: EdgeInsets.only(
                                  bottom: $constants.insets.xs,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: getTheme(context).surfaceContainer,
                                    borderRadius: BorderRadius.circular(
                                        $constants.corners.md),
                                  ),
                                  padding: EdgeInsets.all($constants.insets.xs),
                                  child: TaskItem(
                                    task: task,
                                    checkable: false,
                                    onTap: () {
                                      setState(() {
                                        _task = task;
                                      });
                                      Navigator.pop(context, task);
                                    },
                                  ),
                                ),
                              ))
                    ],
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (_task == null)
                      Text(
                        context.t.timer.select_task,
                        style: getTextTheme(context).bodyLarge!.copyWith(),
                      )
                    else
                      Text(
                        _task!.title,
                        style: getTextTheme(context).bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    SizedBox(
                      width: $constants.insets.xxs,
                    ),
                    const Icon(
                      CupertinoIcons.chevron_right,
                      size: 16,
                    )
                  ],
                ),
              ),
            SizedBox(
              height: $constants.insets.lg,
            ),
            SizedBox(
              width: getSize(context).width * 0.8,
              child: Center(
                child: CircularPercentIndicator(
                  radius: 150.0,
                  lineWidth: 12.0,
                  animation: true,
                  animateFromLastPercent: true,
                  circularStrokeCap: CircularStrokeCap.round,
                  backgroundColor:
                      getTheme(context).surfaceContainer.darken(10),
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
                  onTap: () {
                    // Reset the timer logic here
                    setState(() {
                      _progress = 0.0; // Reset progress
                      _task = null; // Reset task selection
                    });
                  },
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
        );
      }),
    );
  }
}
