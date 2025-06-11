import 'dart:async';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:app/blocs/app/app.bloc.dart';
import 'package:app/blocs/tasks/tasks.bloc.dart';
import 'package:app/blocs/time_entries/time_entry.bloc.dart';
import 'package:app/components/widgets/elevated_container.dart';
import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/pages/timer/completed_timer.dart';
import 'package:app/pages/timer/task_selector.dart';
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
  TimerMode _mode = TimerMode.pomodoro; // Use TimerMode enum instead of int
  double? _progress = 0.0;
  TaskEntity? _task;

  bool _isPaused = false;
  bool _isRunning = false;
  Duration? _pomodoroDuration;
  Duration? _pomodoroBreakDuration;
  Timer? _uiTimer;

  TimerMode get currentTimerMode => _mode;

  @override
  void initState() {
    super.initState();
    if (widget.mode != null) {
      _mode = widget.mode!;
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
    final mode = TimerUtils.getMode();
    setState(() {
      _mode = mode;
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

    final duration = TimerUtils.getTimerDuration(currentTimerMode);
    final isPaused = TimerUtils.isTimerPaused(currentTimerMode);
    final isRunning = TimerUtils.isTimerRunning(currentTimerMode);

    setState(() {
      _isPaused = isPaused;
      _isRunning = isRunning;

      if (_mode == TimerMode.pomodoro) {
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

  Future<void> _showCompletedTimerModal(
      TimerMode mode, TaskEntity? task) async {
    if (!mounted) return;

    if (isDesktop(context)) {
      await _showDesktopDialog(mode, task);
    } else {
      await _showMobileBottomSheet(mode, task);
    }
  }

  Future<void> _showDesktopDialog(TimerMode mode, TaskEntity? task) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CompletedTimer(
          mode: mode,
          task: task,
        );
      },
    );
  }

  Future<void> _showMobileBottomSheet(TimerMode mode, TaskEntity? task) async {
    return showModalBottomSheet<void>(
      context: context,
      isDismissible: false,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return CompletedTimer(
          mode: mode,
          task: task,
        );
      },
    );
  }

  Future<void> _showTaskSelector() async {
    if (isDesktop(context)) {
      showDialog(
          context: context,
          builder: (context) => Dialog(
                child: TaskSelector(
                  onTaskSelected: (task) {
                    setState(() {
                      _task = task;
                    });
                  },
                ),
              ));
    } else {
      showModalBottomSheet(
        context: context,
        isDismissible: true,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return TaskSelector(
            onTaskSelected: (task) {
              setState(() {
                _task = task;
              });
            },
          );
        },
      );
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
        if (appState.pomodoroBreakDuration == null) {
          _pomodoroBreakDuration = const Duration(minutes: 5);
        }
        if (appState.pomodoroBreakDuration != null) {
          _pomodoroBreakDuration =
              Duration(minutes: appState.pomodoroBreakDuration!);
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
          final currentDuration = TimerUtils.getTimerDuration(currentTimerMode);

          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 30,
                  width: isDesktop(context)
                      ? getSize(context).width * 0.5
                      : getSize(context).width * 0.9,
                  child: AnimatedToggleSwitch<TimerMode?>.rolling(
                    current: _mode,
                    indicatorSize:
                        Size.fromWidth(getSize(context).width * 0.8 / 2),
                    values: const [TimerMode.pomodoro, TimerMode.stopwatch],
                    iconBuilder: (value, foreground) {
                      final index = value == TimerMode.pomodoro ? 0 : 1;
                      return Text(context.t.timer.modes.values.elementAt(index),
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
                        indicatorColor: value == _mode
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
                              _mode = value;
                              _progress =
                                  _mode == TimerMode.pomodoro ? 1.0 : 0.0;
                            });
                          },
                  ),
                ),
                SizedBox(
                  height: $constants.insets.lg,
                ),
                if (taskState.tasks != null && taskState.tasks!.isNotEmpty)
                  GestureDetector(
                    onTap: () {
                      _showTaskSelector();
                    },
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
                  height: isDesktop(context)
                      ? $constants.insets.sm
                      : $constants.insets.lg,
                ),
                SizedBox(
                  width: getSize(context).width * 0.8,
                  child: Center(
                    child: CircularPercentIndicator(
                      radius: isDesktop(context) ? 100 : 150.0,
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
                if (_mode == TimerMode.pomodoro) ...[
                  SizedBox(
                    height: $constants.insets.md,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                            initialTimerDuration: _pomodoroDuration ??
                                const Duration(minutes: 20),
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
                              style:
                                  getTextTheme(context).bodyLarge!.copyWith(),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: $constants.insets.md,
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
                            initialTimerDuration: _pomodoroBreakDuration ??
                                const Duration(minutes: 20),
                            onTimerDurationChanged: (Duration value) {
                              _updatePomodoroBreakDuration(value);
                            },
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              CupertinoIcons.pause_fill,
                              size: 20,
                            ),
                            SizedBox(
                              width: $constants.insets.xs,
                            ),
                            Text(
                              context.t.times.minutes(
                                n: _pomodoroBreakDuration!.inMinutes,
                                nb: _pomodoroBreakDuration!.inMinutes,
                              ),
                              style:
                                  getTextTheme(context).bodyLarge!.copyWith(),
                            )
                          ],
                        ),
                      ),
                    ],
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
                          final success = await TimerUtils.createTimeEntry(
                            currentTimerMode,
                            task: _task,
                          );

                          if (!context.mounted) return;
                          context
                              .read<TimeEntryBloc>()
                              .add(const LoadTimeEntries());

                          // Show completed modal for stopwatch only if time entry was created successfully
                          if (success &&
                              currentTimerMode == TimerMode.stopwatch) {
                            await _showCompletedTimerModal(
                                currentTimerMode, _task);
                          }

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
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
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
                                if (_mode == TimerMode.stopwatch) {
                                  await TimerUtils.startTimer(
                                      TimerMode.stopwatch,
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
                          SizedBox(
                            height: $constants.insets.xs,
                          ),
                          Text(
                            _mode == TimerMode.stopwatch
                                ? context.t.timer.start_stopwatch
                                : context.t.timer.start_pomodoro,
                            style: getTextTheme(context).bodyMedium!.copyWith(),
                          ),
                        ],
                      ),
                    if (!_isRunning &&
                        !_isPaused &&
                        _mode == TimerMode.pomodoro)
                      // start pomo break button (only when not running and not paused)
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ElevatedContainer(
                            padding: EdgeInsets.all($constants.insets.lg),
                            borderRadius: $constants.corners.full,
                            child: const Icon(
                              CupertinoIcons.zzz,
                              size: 40,
                            ),
                            onTap: () async {
                              // Start pomodoro break
                              await TimerUtils.startTimer(
                                TimerMode.pomodoro,
                                durationInMinutes:
                                    _pomodoroBreakDuration!.inMinutes,
                                task: _task,
                                pomoBreak: true,
                              );
                              _startUITimer(); // Start UI updates
                              await _updateTimerDisplay();
                            },
                          ),
                          SizedBox(
                            height: $constants.insets.xs,
                          ),
                          Text(
                            context.t.timer.start_break,
                            style: getTextTheme(context).bodyMedium!.copyWith(),
                          ),
                        ],
                      ),
                  ],
                ),
                SizedBox(
                  height: isDesktop(context)
                      ? $constants.insets.md
                      : getSize(context).height * 0.08,
                )
              ],
            ),
          );
        });
      }),
    );
  }

  String _getCenterText(Duration currentDuration) {
    // If in pomodoro mode and no timer is running, show the pomodoro duration
    if (_mode == TimerMode.pomodoro && !_isRunning) {
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

  _updatePomodoroBreakDuration(Duration value) {
    setState(() {
      _pomodoroBreakDuration = value;
    });
    context
        .read<AppCubit>()
        .changePomodoroBreakDuration(value: value.inMinutes);
  }
}
