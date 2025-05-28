import 'dart:async';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:app/blocs/app/app.bloc.dart';
import 'package:app/blocs/tasks/tasks.bloc.dart';
import 'package:app/components/buttons/task_item.dart';
import 'package:app/components/forms/search_bar.dart';
import 'package:app/components/widgets/elevated_container.dart';
import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/pages/timer/timer_utils.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:app/utils/toast_helper.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:pausable_timer/pausable_timer.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TaskTimer extends StatefulWidget {
  final TaskEntity? task;
  const TaskTimer({super.key, this.task});

  @override
  State<TaskTimer> createState() => _TaskTimerState();
}

class _TaskTimerState extends State<TaskTimer> {
  int mode = 0; // 0 for pomodoro, 1 for stopwatch
  double? _progress = 1.0;
  TaskEntity? _task;
  final TextEditingController _searchController = TextEditingController();

  bool _isPaused = false;
  bool _isRunning = false;
  Duration? _pomodoroDuration;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isPaused = TimerUtils.isPomodoroPaused() || TimerUtils.isStopwatchPaused();
    _isRunning =
        TimerUtils.isPomodoroRunning() || TimerUtils.isStopwatchRunning();
  }

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
      body: BlocBuilder<AppCubit, AppState>(builder: (context, appState) {
        if (appState.pomodoroDuration == null) {
          _pomodoroDuration = const Duration(minutes: 20);
        }
        if (appState.pomodoroDuration != null) {
          _pomodoroDuration = Duration(minutes: appState.pomodoroDuration!);
        }
        return BlocBuilder<TasksBloc, TasksState>(
            builder: (context, taskState) {
          final taskId =
              TimerUtils.getPomodoroTaskId() ?? TimerUtils.getStopwatchTaskId();
          if (taskId != null && _task == null) {
            _task = taskState.tasks
                ?.where(
                  (task) => task.id == taskId,
                )
                .firstOrNull;
          }
          switch (mode) {
            case 0:
              _progress = TimerUtils.getPomodoroRemainingTime() == Duration.zero
                  ? 1.0
                  : TimerUtils.getPomodoroRemainingTime().inSeconds /
                      _pomodoroDuration!.inSeconds;
              break;
            case 1:
              _progress = TimerUtils.getStopwatchElapsedTime().inSeconds /
                  (_pomodoroDuration?.inSeconds ?? 1);
              break;
          }
          return Column(
            children: [
              SizedBox(
                height: 30,
                child: AnimatedToggleSwitch<int?>.rolling(
                  current: mode,
                  indicatorSize:
                      Size.fromWidth(getSize(context).width * 0.8 / 2),
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
                      _progress = mode == 0 ? 1.0 : 0.0;
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
                                    padding:
                                        EdgeInsets.all($constants.insets.xs),
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
                      _durationToHMS(mode == 1
                          ? TimerUtils.getStopwatchElapsedTime()
                          : TimerUtils.getPomodoroRemainingTime() ==
                                  Duration.zero
                              ? _pomodoroDuration!
                              : TimerUtils.getPomodoroRemainingTime()),
                      style: getTextTheme(context).titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    progressColor: getTheme(context).primary,
                  ),
                ),
              ),
              const Spacer(),
              if (mode == 0) ...[
                SizedBox(
                  height: $constants.insets.md,
                ),
                CustomPopup(
                  content: Container(
                    padding: EdgeInsets.all($constants.insets.xs),
                    decoration: BoxDecoration(
                      color: getTheme(context).surfaceContainer,
                      borderRadius:
                          BorderRadius.circular($constants.corners.md),
                    ),
                    width: getSize(context).width * 0.6,
                    height: getSize(context).height * 0.2,
                    child: CupertinoTimerPicker(
                      mode: CupertinoTimerPickerMode.hm,
                      initialTimerDuration:
                          _pomodoroDuration ?? const Duration(minutes: 20),
                      onTimerDurationChanged: (Duration value) {
                        _updatePomoDuration(value);
                      },
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        CupertinoIcons.alarm_fill,
                        size: 20,
                      ),
                      SizedBox(
                        width: $constants.insets.xs,
                      ),
                      Text(
                        context.t.times.minutes(
                          n: _pomodoroDuration!.inMinutes,
                          nb: _pomodoroDuration!.inMinutes,
                        ),
                        style: getTextTheme(context).bodyLarge!.copyWith(),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: $constants.insets.md,
                ),
              ],
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (_isPaused)
                    // reset button
                    ElevatedContainer(
                      padding: EdgeInsets.all($constants.insets.lg),
                      borderRadius: $constants.corners.full,
                      child: const Icon(
                        CupertinoIcons.arrow_counterclockwise,
                        size: 40,
                      ),
                      onTap: () {
                        TimerUtils.resetPomodoroTimer(completed: false);
                      },
                    ),
                  if (_isRunning)
                    ElevatedContainer(
                      padding: EdgeInsets.all($constants.insets.lg),
                      borderRadius: $constants.corners.full,
                      child: const Icon(
                        CupertinoIcons.square_fill,
                        size: 40,
                      ),
                      onTap: () {},
                    ),
                  if (_isRunning && !_isPaused)
                    ElevatedContainer(
                      padding: EdgeInsets.all($constants.insets.lg),
                      borderRadius: $constants.corners.full,
                      child: const Icon(
                        CupertinoIcons.pause,
                        size: 40,
                      ),
                      onTap: () {
                        setState(() {
                          _isPaused = true;
                          _isRunning = false;
                        });
                        TimerUtils.pausePomodoroTimer();
                      },
                    ),
                  if (!TimerUtils.isPomodoroRunning())
                    ElevatedContainer(
                      padding: EdgeInsets.all($constants.insets.lg),
                      borderRadius: $constants.corners.full,
                      child: const Icon(
                        CupertinoIcons.play_fill,
                        size: 40,
                      ),
                      onTap: () {
                        if (_task == null) {
                          ToastHelper.showError(
                            context: context,
                            title: context.t.timer.select_task_to_start_timer,
                          );
                          return;
                        }

                        // stopwatch mode
                        if (!_isPaused) {
                          if (mode == 1) {
                            TimerUtils.startStopwatch(task: _task);
                          } else {
                            TimerUtils.startPomodoroTimer(
                              _pomodoroDuration!.inMinutes,
                              task: _task,
                            );
                            // pomodoro mode
                          }
                        } else {
                          if (mode == 1) {
                            TimerUtils.resumeStopwatch();
                          } else {
                            TimerUtils.resumePomodoroTimer();
                          }
                          setState(() {
                            _isPaused = false;
                            _isRunning = true;
                          });
                        }
                      },
                    ),
                ],
              ),
              SizedBox(
                height: getSize(context).height * 0.1,
              )
            ],
          );
        });
      }),
    );
  }

  _durationToHMS(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return '$twoDigitMinutes:$twoDigitSeconds';
  }

  _updatePomoDuration(Duration value) {
    setState(() {
      _pomodoroDuration = value;
    });
    context.read<AppCubit>().changePomodoroDuration(value: value.inMinutes);
  }
}
