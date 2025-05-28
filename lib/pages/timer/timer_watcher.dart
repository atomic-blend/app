import 'dart:async';

import 'package:app/blocs/tasks/tasks.bloc.dart';
import 'package:app/components/widgets/elevated_container.dart';
import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/pages/timer/timer_utils.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerWatcher extends StatefulWidget {
  final Widget child;

  const TimerWatcher({
    super.key,
    required this.child,
  });

  @override
  State<TimerWatcher> createState() => _TimerWatcherState();
}

class _TimerWatcherState extends State<TimerWatcher> {
  Timer? _watcherTimer;
  bool _pomodoroWasRunning = false;
  bool _hasShownPomodoroCompletion = false;

  @override
  void initState() {
    super.initState();
    _startWatching();
  }

  @override
  void dispose() {
    _watcherTimer?.cancel();
    super.dispose();
  }

  void _startWatching() {
    _watcherTimer?.cancel();
    _watcherTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      _checkTimerStates();
    });
  }

  Future<void> _checkTimerStates() async {
    if (!mounted) return;

    await _checkPomodoroCompletion();
    await _checkStopwatchState();
  }

  Future<void> _checkPomodoroCompletion() async {
    final isRunning = TimerUtils.isPomodoroRunning();
    final remainingTime = await TimerUtils.getPomodoroRemainingTime();

    // Check if pomodoro just completed
    if (_pomodoroWasRunning &&
        isRunning &&
        remainingTime <= Duration.zero &&
        !_hasShownPomodoroCompletion) {
      _hasShownPomodoroCompletion = true;
      await _showTimerCompletedDialog(TimerMode.pomodoro);
    }

    // Reset completion flag when timer is reset/stopped
    if (!isRunning) {
      _hasShownPomodoroCompletion = false;
    }

    _pomodoroWasRunning = isRunning;
  }

  Future<void> _checkStopwatchState() async {
    // For stopwatch, we don't auto-complete, just track state
    // This method can be used for future stopwatch completion features
  }

  Future<void> _showTimerCompletedDialog(TimerMode mode) async {
    if (!mounted) return;

    final taskId = mode == TimerMode.pomodoro
        ? TimerUtils.getPomodoroTaskId()
        : TimerUtils.getStopwatchTaskId();

    TaskEntity? task;
    if (taskId != null) {
      final tasksState = context.read<TasksBloc>().state;
      task = tasksState.tasks?.where((t) => t.id == taskId).firstOrNull;
    }

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
        return AlertDialog(
          title: Row(
            children: [
              Icon(
                mode == TimerMode.pomodoro
                    ? CupertinoIcons.alarm_fill
                    : CupertinoIcons.stopwatch_fill,
                color: getTheme(context).primary,
              ),
              SizedBox(width: $constants.insets.xs),
              Text(
                mode == TimerMode.pomodoro
                    ? context.t.timer.modes['pomodoro']! + ' ' + 'Completed!'
                    : context.t.timer.modes['stopwatch']! + ' ' + 'Completed!',
                style: getTextTheme(context).headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (task != null) ...[
                Text(
                  'Task: ${task.title}',
                  style: getTextTheme(context).bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                SizedBox(height: $constants.insets.sm),
              ],
              Text(
                mode == TimerMode.pomodoro
                    ? 'Your pomodoro session has completed! Time for a break.'
                    : 'Your stopwatch session has been completed.',
                style: getTextTheme(context).bodyMedium,
              ),
              SizedBox(height: $constants.insets.md),
              if (mode == TimerMode.pomodoro)
                Text(
                  'Duration: ${TimerUtils.getPomodoroDuration()} minutes',
                  style: getTextTheme(context).bodySmall?.copyWith(
                        color: getTheme(context).onSurface.withOpacity(0.7),
                      ),
                ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(context.t.actions.cancel),
            ),
            ElevatedButton(
              onPressed: () async {
                await TimerUtils.resetTimer(mode, completed: true);
                if (mounted) {
                  Navigator.of(context).pop();
                }
              },
              child: Text(context.t.timer.reset),
            ),
          ],
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
        return Container(
          decoration: BoxDecoration(
            color: getTheme(context).surface,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular($constants.corners.lg),
              topRight: Radius.circular($constants.corners.lg),
            ),
          ),
          padding: EdgeInsets.all($constants.insets.lg),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Drag handle
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: getTheme(context).onSurface.withOpacity(0.3),
                    borderRadius: BorderRadius.circular($constants.corners.xs),
                  ),
                ),
                SizedBox(height: $constants.insets.lg),

                // Icon and title
                Container(
                  padding: EdgeInsets.all($constants.insets.lg),
                  decoration: BoxDecoration(
                    color: getTheme(context).primary.withOpacity(0.1),
                    borderRadius:
                        BorderRadius.circular($constants.corners.full),
                  ),
                  child: Icon(
                    mode == TimerMode.pomodoro
                        ? CupertinoIcons.alarm_fill
                        : CupertinoIcons.stopwatch_fill,
                    size: 48,
                    color: getTheme(context).primary,
                  ),
                ),

                SizedBox(height: $constants.insets.lg),

                Text(
                  mode == TimerMode.pomodoro
                      ? context.t.timer.modes['pomodoro']! + ' Completed!'
                      : context.t.timer.modes['stopwatch']! + ' Completed!',
                  style: getTextTheme(context).headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: $constants.insets.md),

                if (task != null) ...[
                  ElevatedContainer(
                    padding: EdgeInsets.all($constants.insets.md),
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.checkmark_circle_fill,
                          color: getTheme(context).primary,
                          size: 20,
                        ),
                        SizedBox(width: $constants.insets.sm),
                        Expanded(
                          child: Text(
                            task.title,
                            style: getTextTheme(context).bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: $constants.insets.md),
                ],

                Text(
                  mode == TimerMode.pomodoro
                      ? 'Your pomodoro session has completed! Time for a break.'
                      : 'Your stopwatch session has been completed.',
                  style: getTextTheme(context).bodyMedium,
                  textAlign: TextAlign.center,
                ),

                if (mode == TimerMode.pomodoro) ...[
                  SizedBox(height: $constants.insets.sm),
                  Text(
                    'Duration: ${TimerUtils.getPomodoroDuration()} minutes',
                    style: getTextTheme(context).bodySmall?.copyWith(
                          color: getTheme(context).onSurface.withOpacity(0.7),
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],

                SizedBox(height: $constants.insets.xl),

                // Actions
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            vertical: $constants.insets.md,
                          ),
                        ),
                        child: Text(context.t.actions.cancel),
                      ),
                    ),
                    SizedBox(width: $constants.insets.md),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          await TimerUtils.resetTimer(mode, completed: true);
                          if (mounted) {
                            Navigator.of(context).pop();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            vertical: $constants.insets.md,
                          ),
                        ),
                        child: Text(context.t.timer.reset),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: $constants.insets.md),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
