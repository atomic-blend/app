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
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TaskTimer extends StatefulWidget {
  final TimerMode? mode;
  final TaskEntity? task;
  const TaskTimer({super.key, this.task, this.mode});

  @override
  State<TaskTimer> createState() => _TaskTimerState();
}

class _TaskTimerState extends State<TaskTimer> {
  TimerMode mode = TimerMode.pomodoro; // Use TimerMode enum instead of int
  double? _progress = 0.0;
  TaskEntity? _task;
  final TextEditingController _searchController = TextEditingController();

  bool _isPaused = false;
  bool _isRunning = false;
  Duration? _pomodoroDuration;
  Timer? _uiTimer;

  TimerMode get currentTimerMode => mode;

  @override
  void initState() {
    super.initState();
    if (widget.mode != null) {
      mode = widget.mode!;
    }
    _initializeTimerState();
    _startUITimer();
  }

  @override
  void dispose() {
    _uiTimer?.cancel();
    super.dispose();
  }

  Future<void> _initializeTimerState() async {
    final isPomPaused = await TimerUtils.isPomodoroPaused();
    final isStopPaused = await TimerUtils.isStopwatchPaused();
    final isPomRunning = TimerUtils.isPomodoroRunning();
    final isStopRunning = TimerUtils.isStopwatchRunning();

    setState(() {
      _isPaused = isPomPaused || isStopPaused;
      _isRunning = isPomRunning || isStopRunning;
    });
  }

  void _startUITimer() {
    _uiTimer?.cancel();
    _uiTimer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      await _updateTimerDisplay();
    });
  }

  void _stopUITimer() {
    _uiTimer?.cancel();
    _uiTimer = null;
  }

  Future<void> _updateTimerDisplay() async {
    if (!mounted) return;

    final duration = await TimerUtils.getTimerDuration(currentTimerMode);
    final isPaused = await TimerUtils.isTimerPaused(currentTimerMode);
    final isRunning = TimerUtils.isTimerRunning(currentTimerMode);

    setState(() {
      _isPaused = isPaused;
      _isRunning = isRunning;

      if (mode == TimerMode.pomodoro) {
        // Pomodoro
        if (!isRunning) {
          // Timer is stopped/reset - show full circle
          _progress = 1.0;
        } else {
          // Timer is running - duration is remaining time, so progress from 1 to 0
          _progress = _pomodoroDuration != null
              ? (duration.inSeconds / _pomodoroDuration!.inSeconds)
                  .clamp(0.0, 1.0)
              : 1.0;
        }
      } else {
        // Stopwatch
        if (!isRunning) {
          // Timer is stopped/reset - show empty circle
          _progress = 0.0;
        } else {
          // Timer is running - duration is elapsed time, so progress from 0 to 1
          _progress = _pomodoroDuration != null
              ? (duration.inSeconds / _pomodoroDuration!.inSeconds)
                  .clamp(0.0, 1.0)
              : 0.0;
        }
      }
    });

    // Stop UI timer if paused or not running
    if (isPaused || !isRunning) {
      _stopUITimer();
    }
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
          final taskId = TimerUtils.getPomodoroTaskId() ??
              TimerUtils.getStopwatchTaskId() ??
              widget.task?.id;
          if (taskId != null && _task == null) {
            _task = taskState.tasks
                ?.where(
                  (task) => task.id == taskId,
                )
                .firstOrNull;
          }

          return FutureBuilder<Duration>(
            future: TimerUtils.getTimerDuration(currentTimerMode),
            builder: (context, snapshot) {
              final currentDuration = snapshot.data ?? Duration.zero;

              return Column(
                children: [
                  SizedBox(
                    height: 30,
                    child: AnimatedToggleSwitch<TimerMode?>.rolling(
                      current: mode,
                      indicatorSize:
                          Size.fromWidth(getSize(context).width * 0.8 / 2),
                      values: const [TimerMode.pomodoro, TimerMode.stopwatch],
                      iconBuilder: (value, foreground) {
                        final index = value == TimerMode.pomodoro ? 0 : 1;
                        return Text(
                            context.t.timer.modes.values.elementAt(index),
                            style: getTextTheme(context).bodyMedium!.copyWith(
                                color: _isRunning
                                    ? getTextTheme(context)
                                        .bodyMedium!
                                        .color
                                        ?.withValues(alpha: 0.5)
                                    : null));
                      },
                      styleBuilder: (value) {
                        return ToggleStyle(
                          borderColor: Colors.transparent,
                          indicatorColor: value == mode
                              ? (_isRunning
                                  ? getTheme(context)
                                      .surface
                                      .withValues(alpha: 0.5)
                                  : getTheme(context).surface)
                              : getTheme(context).surfaceContainer,
                          backgroundColor: _isRunning
                              ? getTheme(context)
                                  .surfaceContainer
                                  .withValues(alpha: 0.5)
                              : getTheme(context).surfaceContainer,
                        );
                      },
                      onChanged: _isRunning
                          ? null
                          : (value) {
                              if (value == null) return;
                              setState(() {
                                mode = value;
                                _progress =
                                    mode == TimerMode.pomodoro ? 1.0 : 0.0;
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
                                          color: getTheme(context)
                                              .surfaceContainer,
                                          borderRadius: BorderRadius.circular(
                                              $constants.corners.md),
                                        ),
                                        padding: EdgeInsets.all(
                                            $constants.insets.xs),
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
                              style:
                                  getTextTheme(context).bodyLarge!.copyWith(),
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
                          _getCenterText(currentDuration),
                          style: getTextTheme(context).titleLarge!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        progressColor: getTheme(context).primary,
                      ),
                    ),
                  ),
                  const Spacer(),
                  if (mode == TimerMode.pomodoro) ...[
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
                          onTap: () async {
                            await TimerUtils.resetTimer(currentTimerMode,
                                completed: false);
                            _stopUITimer(); // Stop UI updates
                            await _updateTimerDisplay();
                          },
                        ),
                      if (_isPaused)
                        // stop button (only when paused)
                        ElevatedContainer(
                          padding: EdgeInsets.all($constants.insets.lg),
                          borderRadius: $constants.corners.full,
                          child: const Icon(
                            CupertinoIcons.square_fill,
                            size: 40,
                          ),
                          onTap: () async {
                            // Create time entry before stopping the timer
                            await TimerUtils.createTimeEntryForStoppedTimer(
                              currentTimerMode,
                              task: _task,
                            );
                            await TimerUtils.resetTimer(currentTimerMode);
                            _stopUITimer(); // Stop UI updates
                            await _updateTimerDisplay();
                          },
                        ),
                      if (_isRunning && !_isPaused)
                        // pause button (only when running and not paused)
                        ElevatedContainer(
                          padding: EdgeInsets.all($constants.insets.lg),
                          borderRadius: $constants.corners.full,
                          child: const Icon(
                            CupertinoIcons.pause,
                            size: 40,
                          ),
                          onTap: () async {
                            await TimerUtils.pauseTimer(currentTimerMode);
                            await _updateTimerDisplay();
                            // UI timer will be stopped in _updateTimerDisplay
                          },
                        ),
                      if (!_isRunning || _isPaused)
                        ElevatedContainer(
                          padding: EdgeInsets.all($constants.insets.lg),
                          borderRadius: $constants.corners.full,
                          child: const Icon(
                            CupertinoIcons.play_fill,
                            size: 40,
                          ),
                          onTap: () async {
                            if (_isPaused) {
                              // Resume timer
                              await TimerUtils.resumeTimer(currentTimerMode);
                              _startUITimer(); // Restart UI updates
                            } else {
                              // Start new timer
                              if (mode == TimerMode.stopwatch) {
                                await TimerUtils.startTimer(TimerMode.stopwatch,
                                    task: _task);
                              } else {
                                await TimerUtils.startTimer(
                                  TimerMode.pomodoro,
                                  durationInMinutes:
                                      _pomodoroDuration!.inMinutes,
                                  task: _task,
                                );
                              }
                              _startUITimer(); // Start UI updates
                            }
                            await _updateTimerDisplay();
                          },
                        ),
                    ],
                  ),
                  SizedBox(
                    height: getSize(context).height * 0.1,
                  )
                ],
              );
            },
          );
        });
      }),
    );
  }

  String _getCenterText(Duration currentDuration) {
    // If in pomodoro mode and no timer is running, show the pomodoro duration
    if (mode == TimerMode.pomodoro && !_isRunning) {
      return _durationToHMS(_pomodoroDuration ?? const Duration(minutes: 20));
    }
    // Otherwise show the current timer duration
    return _durationToHMS(currentDuration);
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
