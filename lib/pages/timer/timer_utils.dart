import 'dart:convert';
import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/entities/time_entry/time_entry.entity.dart';
import 'package:app/services/time_entry_service.dart';
import 'package:app/main.dart';
import 'package:app/utils/local_notifications.dart';

enum TimerMode { pomodoro, stopwatch }

class PausePeriod {
  final DateTime pauseStart;
  final DateTime? pauseEnd; // null if currently paused

  PausePeriod({required this.pauseStart, this.pauseEnd});

  Duration get duration {
    if (pauseEnd == null) {
      // Currently paused, calculate duration up to now
      return DateTime.now().difference(pauseStart);
    }
    return pauseEnd!.difference(pauseStart);
  }

  Map<String, dynamic> toJson() => {
        'pauseStart': pauseStart.toIso8601String(),
        'pauseEnd': pauseEnd?.toIso8601String(),
      };

  factory PausePeriod.fromJson(Map<String, dynamic> json) => PausePeriod(
        pauseStart: DateTime.parse(json['pauseStart']),
        pauseEnd:
            json['pauseEnd'] != null ? DateTime.parse(json['pauseEnd']) : null,
      );
}

class TimerUtils {
  // Helper methods for pause periods
  static List<PausePeriod> _getPausePeriods(TimerMode mode) {
    final key = '${mode.name}_pause_periods';
    final pauseDataString = prefs?.getString(key);
    if (pauseDataString == null) return [];

    try {
      final List<dynamic> pauseData = jsonDecode(pauseDataString);
      return pauseData.map((data) => PausePeriod.fromJson(data)).toList();
    } catch (e) {
      return [];
    }
  }

  static Future<void> _savePausePeriods(
      TimerMode mode, List<PausePeriod> periods) async {
    final key = '${mode.name}_pause_periods';
    final pauseData = periods.map((period) => period.toJson()).toList();
    await prefs?.setString(key, jsonEncode(pauseData));
  }

  static Duration _getTotalPausedDuration(List<PausePeriod> pausePeriods) {
    Duration totalPaused = Duration.zero;
    for (final period in pausePeriods) {
      totalPaused += period.duration;
    }
    return totalPaused;
  }

  static TimerMode getMode() {
    final pomodoroStartTime = prefs?.getString('pomodoro_start_time');
    final stopwatchStartTime = prefs?.getString('stopwatch_start_time');
    if (pomodoroStartTime != null) {
      return TimerMode.pomodoro;
    } else if (stopwatchStartTime != null) {
      return TimerMode.stopwatch;
    }
    throw Exception('No active timer found');
  }

  static Duration _getElapsedTimeExcludingCurrentPause(
      DateTime startTime, List<PausePeriod> pausePeriods) {
    // Find the last pause period (should be the current one)
    final currentPauseIndex =
        pausePeriods.indexWhere((period) => period.pauseEnd == null);
    if (currentPauseIndex == -1) {
      return DateTime.now().difference(startTime);
    }

    final currentPause = pausePeriods[currentPauseIndex];
    return currentPause.pauseStart.difference(startTime);
  }

  // Unified timer methods
  static Future<void> startTimer(TimerMode mode,
      {int? durationInMinutes, TaskEntity? task, bool? pomoBreak}) async {
    final startDate = DateTime.now();

    await prefs?.setString(
      '${mode.name}_start_time',
      startDate.toIso8601String(),
    );
    await prefs?.remove('${mode.name}_pause_periods');

    if (task != null) {
      await prefs?.setString(
        '${mode.name}_task_id',
        task.id!,
      );
    }

    if (mode == TimerMode.pomodoro && durationInMinutes != null) {
      await prefs?.setInt(
        'pomodoro_duration',
        durationInMinutes,
      );

      if (pomoBreak != null) {
        await prefs?.setBool("pomodoro_break", pomoBreak);
      }

      LocalNotificationUtil.schedulePomodoroNotification(
        "pomo-completed",
        "Pomodoro completed",
        0,
        startDate.add(Duration(minutes: durationInMinutes)),
      );
    }
  }

  static String? getTaskId(TimerMode mode) {
    return prefs?.getString('${mode.name}_task_id');
  }

  static int getPomodoroDuration() {
    return prefs?.getInt('pomodoro_duration') ?? 20;
  }

  static DateTime? getStartDate() {
    final startTimeString = prefs?.getString('pomodoro_start_time');
    if (startTimeString != null) {
      return DateTime.parse(startTimeString);
    }
    return null;
  }

  static Duration getTimerDuration(TimerMode mode) {
    final startTimeString = prefs?.getString('${mode.name}_start_time');

    if (startTimeString == null) {
      return Duration.zero;
    }

    final startTime = DateTime.parse(startTimeString);

    // Check if timer is completed
    final endTimeString = prefs?.getString('${mode.name}_end_time');
    if (endTimeString != null) {
      // Timer is completed
      if (mode == TimerMode.pomodoro) {
        // For completed pomodoro, always return the configured duration
        final durationInMinutes = prefs?.getInt('pomodoro_duration') ?? 20;
        return Duration(minutes: durationInMinutes);
      } else {
        // For completed stopwatch, return actual elapsed time
        final endTime = DateTime.parse(endTimeString);
        final pausePeriods = _getPausePeriods(mode);
        final totalPausedDuration = _getTotalPausedDuration(pausePeriods);
        final totalDuration =
            endTime.difference(startTime) - totalPausedDuration;
        return totalDuration.isNegative ? Duration.zero : totalDuration;
      }
    }

    // Get pause periods
    final pausePeriods = _getPausePeriods(mode);

    // Check if timer is paused
    final isCurrentlyPaused = isTimerPaused(mode);

    // Calculate elapsed time up to pause point if paused, or current time if running
    final elapsed = isCurrentlyPaused
        ? _getElapsedTimeExcludingCurrentPause(startTime, pausePeriods)
        : DateTime.now().difference(startTime);

    // Calculate total paused duration (excluding current pause if timer is paused)
    final totalPausedDuration = _getTotalPausedDuration(isCurrentlyPaused
        ? pausePeriods.where((p) => p.pauseEnd != null).toList()
        : pausePeriods);

    // Calculate effective elapsed time (time spent without pauses)
    final effectiveElapsed = elapsed - totalPausedDuration;

    if (mode == TimerMode.pomodoro) {
      final durationInMinutes = prefs?.getInt('pomodoro_duration') ?? 20;
      final totalDuration = Duration(minutes: durationInMinutes);
      return totalDuration - effectiveElapsed;
    } else {
      // Stopwatch returns elapsed time
      return effectiveElapsed.isNegative ? Duration.zero : effectiveElapsed;
    }
  }

  static Future<void> pauseTimer(TimerMode mode) async {
    // Check if already paused
    if (isTimerPaused(mode)) return;

    if (mode == TimerMode.pomodoro) {
      final remainingTime = getTimerDuration(mode);
      if (remainingTime > Duration.zero) {
        await LocalNotificationUtil.cancelNotification(0);
      }
    }

    // Add new pause period
    final pausePeriods = _getPausePeriods(mode);
    pausePeriods.add(PausePeriod(pauseStart: DateTime.now()));
    await _savePausePeriods(mode, pausePeriods);
  }

  static Future<void> resumeTimer(TimerMode mode) async {
    // Check if currently paused
    if (!isTimerPaused(mode)) return;

    final pausePeriods = _getPausePeriods(mode);

    // Find the current pause period and end it
    final currentPauseIndex =
        pausePeriods.indexWhere((period) => period.pauseEnd == null);
    if (currentPauseIndex != -1) {
      final currentPause = pausePeriods[currentPauseIndex];
      pausePeriods[currentPauseIndex] = PausePeriod(
        pauseStart: currentPause.pauseStart,
        pauseEnd: DateTime.now(),
      );
      await _savePausePeriods(mode, pausePeriods);
    }

    // Reschedule notification for pomodoro
    if (mode == TimerMode.pomodoro) {
      final remainingTime = getTimerDuration(mode);
      if (remainingTime > Duration.zero) {
        LocalNotificationUtil.schedulePomodoroNotification(
          "pomo-completed",
          "Pomodoro completed",
          0,
          DateTime.now().add(remainingTime),
        );
      }
    }
  }

  static Future<void> resetTimer(TimerMode mode,
      {bool? completed = false}) async {
    // If completing, save the end time before clearing
    if (completed == true) {
      await prefs?.setString(
        '${mode.name}_end_time',
        DateTime.now().toIso8601String(),
      );
    } else {
      // If not completing (resetting), remove the end time
      await prefs?.remove('${mode.name}_end_time');
    }

    await prefs?.remove('${mode.name}_start_time');
    await prefs?.remove('${mode.name}_task_id');
    await prefs?.remove('${mode.name}_pause_periods');

    if (mode == TimerMode.pomodoro) {
      await prefs?.remove('pomodoro_duration');
      if (completed == false) {
        await LocalNotificationUtil.cancelNotification(0);
      }
    }
  }

  static Future<void> markTimerCompleted(TimerMode mode) async {
    await prefs?.setString(
      '${mode.name}_end_time',
      DateTime.now().toIso8601String(),
    );
  }

  static bool isTimerRunning(TimerMode mode) {
    final startTimeString = prefs?.getString('${mode.name}_start_time');
    return startTimeString != null;
  }

  static bool isTimerPaused(TimerMode mode) {
    final pausePeriods = _getPausePeriods(mode);
    return pausePeriods.any((period) => period.pauseEnd == null);
  }

  static Future<void> completeTimer(TimerMode mode, {TaskEntity? task}) async {
    await resetTimer(mode, completed: true);
  }

  // Legacy methods for backward compatibility
  static Future<void> startPomodoroTimer(int durationInMinutes,
      {TaskEntity? task}) async {
    await startTimer(TimerMode.pomodoro,
        durationInMinutes: durationInMinutes, task: task);
  }

  static String? getPomodoroTaskId() {
    return getTaskId(TimerMode.pomodoro);
  }

  static bool? isPomodoroBreak() {
    return prefs?.getBool("pomodoro_break") ?? false;
  }

  static Future<Duration> getPomodoroRemainingTime() async {
    return getTimerDuration(TimerMode.pomodoro);
  }

  static Future<void> pausePomodoroTimer() async {
    await pauseTimer(TimerMode.pomodoro);
  }

  static Future<void> resumePomodoroTimer() async {
    await resumeTimer(TimerMode.pomodoro);
  }

  static Future<void> resetPomodoroTimer({bool? completed = false}) async {
    await resetTimer(TimerMode.pomodoro, completed: completed);
  }

  static bool isPomodoroRunning() {
    return isTimerRunning(TimerMode.pomodoro);
  }

  static Future<bool> isPomodoroPaused() async {
    return isTimerPaused(TimerMode.pomodoro);
  }

  static Future<void> pomodoroComplete() async {
    await completeTimer(TimerMode.pomodoro);
  }

  static Future<void> startStopwatch({TaskEntity? task}) async {
    await startTimer(TimerMode.stopwatch, task: task);
  }

  static String? getStopwatchTaskId() {
    return getTaskId(TimerMode.stopwatch);
  }

  static Future<Duration> getStopwatchElapsedTime() async {
    return getTimerDuration(TimerMode.stopwatch);
  }

  static Future<void> pauseStopwatch() async {
    await pauseTimer(TimerMode.stopwatch);
  }

  static Future<void> resumeStopwatch() async {
    await resumeTimer(TimerMode.stopwatch);
  }

  static Future<void> resetStopwatch() async {
    await resetTimer(TimerMode.stopwatch);
  }

  static bool isStopwatchRunning() {
    return isTimerRunning(TimerMode.stopwatch);
  }

  static Future<bool> isStopwatchPaused() async {
    return isTimerPaused(TimerMode.stopwatch);
  }

  static Future<void> stopwatchComplete() async {
    await completeTimer(TimerMode.stopwatch);
  }

  // Method to create time entry
  static Future<bool> createTimeEntry(TimerMode mode,
      {TaskEntity? task}) async {
    final startTimeString = prefs?.getString('${mode.name}_start_time');

    if (startTimeString == null) {
      // If start date is null, we can't create a time entry
      return false;
    }

    final startTime = DateTime.parse(startTimeString);
    final endDate = DateTime.now();
    final duration = getTimerDuration(mode);
    final pomoBreak = isPomodoroBreak();

    final timeEntry = TimeEntry(
      startDate: startTime,
      endDate: endDate,
      taskId: task?.id,
      pomodoro: mode == TimerMode.pomodoro,
      pomoBreak: pomoBreak,
      timer: mode == TimerMode.stopwatch,
      duration: duration.inSeconds,
    );

    try {
      final timeEntryService = TimeEntryService();
      await timeEntryService.createTimeEntry(timeEntry: timeEntry);
      return true;
    } on Exception catch (_) {
      return false;
    }
  }
}
