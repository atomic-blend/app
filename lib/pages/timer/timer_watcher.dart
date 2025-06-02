import 'dart:async';

import 'package:app/blocs/tasks/tasks.bloc.dart';
import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/pages/timer/completed_timer.dart';
import 'package:app/pages/timer/timer_utils.dart';
import 'package:app/utils/shortcuts.dart';
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
    _watcherTimer = Timer.periodic(const Duration(milliseconds: 50), (_) {
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

    // First, mark the timer as completed by setting the end time
    await TimerUtils.markTimerCompleted(mode);

    if (!mounted) return;
    if (isDesktop(context)) {
      _showDesktopDialog(mode, task);
    } else {
      _showMobileBottomSheet(mode, task);
    }

    // Add time entry to task after marking completion
    if (task != null) {
      // If task is found, add time entry to it
      await TimerUtils.createTimeEntry(mode, task: task);
    } else {
      await TimerUtils.createTimeEntry(mode);
    }

    // Reset the timer (this will clear the start time and other data)
    await TimerUtils.resetTimer(mode, completed: false);
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

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
