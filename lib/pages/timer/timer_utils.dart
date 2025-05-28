import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/main.dart';
import 'package:app/utils/local_notifications.dart';

class TimerUtils {
  static Future<void> startPomodoroTimer(int durationInMinutes,
      {TaskEntity? task}) async {
    final startDate = DateTime.now();

    await prefs?.setString(
      'pomodoro_start_time',
      startDate.toIso8601String(),
    );
    await prefs?.setInt(
      'pomodoro_duration',
      durationInMinutes,
    );
    if (task != null) {
      await prefs?.setString(
        'pomodoro_task_id',
        task.id!,
      );
    }

    LocalNotificationUtil.schedulePomodoroNotification(
      "pomo-completed",
      "Pomodoro completed",
      0,
      startDate.add(
        Duration(minutes: durationInMinutes),
      ),
    );
  }

  static String? getPomodoroTaskId() {
    return prefs?.getString('pomodoro_task_id');
  }

  static Duration getPomodoroRemainingTime() {
    final startTimeString = prefs?.getString('pomodoro_start_time');
    final durationInMinutes = prefs?.getInt('pomodoro_duration') ?? 20;
    final pausedTimeString = prefs?.getString('pomodoro_paused_time');

    // If the timer is paused, calculate remaining time from the paused time
    if (pausedTimeString != null && startTimeString != null) {
      final pausedTime = DateTime.parse(pausedTimeString);
      final startTime = DateTime.parse(startTimeString);
      final elapsed = pausedTime.difference(startTime);
      return Duration(minutes: durationInMinutes) - elapsed;
    }

    if (startTimeString == null) {
      return Duration.zero;
    }

    final startTime = DateTime.parse(startTimeString);
    final elapsed = DateTime.now().difference(startTime);
    final totalDuration = Duration(minutes: durationInMinutes);

    return totalDuration - elapsed;
  }

  static Future<void> pausePomodoroTimer() async {
    // Logic to pause the pomodoro timer
    // This could involve saving the current state and stopping the notification
    final remainingTime = await getPomodoroRemainingTime();
    if (remainingTime > Duration.zero) {
      await LocalNotificationUtil.cancelNotification(0);
    }

    await prefs?.setString(
      'pomodoro_paused_time',
      DateTime.now().toIso8601String(),
    );
  }

  static Future<void> resumePomodoroTimer() async {
    await prefs?.remove('pomodoro_paused_time');
  }

  static Future<void> resetPomodoroTimer({bool? completed = false}) async {
    await prefs?.remove('pomodoro_start_time');
    await prefs?.remove('pomodoro_duration');
    await prefs?.remove('pomodoro_task_id');
    await prefs?.remove('pomodoro_paused_time');

    if (completed == false) {
      await LocalNotificationUtil.cancelNotification(0);
    }
  }

  static bool isPomodoroRunning() {
    final startTimeString = prefs?.getString('pomodoro_start_time');
    final pausedTimeString = prefs?.getString('pomodoro_paused_time');
    return startTimeString != null && pausedTimeString == null;
  }

  static bool isPomodoroPaused() {
    final pausedTimeString = prefs?.getString('pomodoro_paused_time');
    return pausedTimeString != null;
  }

  static Future<void> pomodoroComplete() async {
    // Logic to handle what happens when a pomodoro session is completed
    // For example, you might want to show a notification or log the completion
    await resetPomodoroTimer();
  }

  static Future<void> startStopwatch({TaskEntity? task}) async {
    final startDate = DateTime.now();

    await prefs?.setString(
      'stopwatch_start_time',
      startDate.toIso8601String(),
    );

    if (task != null) {
      await prefs?.setString(
        'stopwatch_task_id',
        task.id!,
      );
    }
  }

  static String? getStopwatchTaskId() {
    return prefs?.getString('stopwatch_task_id');
  }

  static Duration getStopwatchElapsedTime() {
    final startTimeString = prefs?.getString('stopwatch_start_time');

    if (startTimeString == null) {
      return Duration.zero;
    }

    final startTime = DateTime.parse(startTimeString);
    return DateTime.now().difference(startTime);
  }

  static Future<void> pauseStopwatch() async {
    // Logic to pause the stopwatch
    // This could involve saving the current state and stopping the notification
    final elapsedTime = await getStopwatchElapsedTime();
    if (elapsedTime > Duration.zero) {
      await LocalNotificationUtil.cancelNotification(0);
    }

    await prefs?.setString(
      'stopwatch_paused_time',
      DateTime.now().toIso8601String(),
    );
  }

  static Future<void> resumeStopwatch() async {
    await prefs?.remove('stopwatch_paused_time');
  }

  static Future<void> resetStopwatch() async {
    await prefs?.remove('stopwatch_start_time');
    await prefs?.remove('stopwatch_task_id');
    await prefs?.remove('stopwatch_paused_time');
  }

  static bool isStopwatchRunning() {
    final startTimeString = prefs?.getString('stopwatch_start_time');
    return startTimeString != null;
  }

  static bool isStopwatchPaused() {
    final pausedTimeString = prefs?.getString('stopwatch_paused_time');
    return pausedTimeString != null;
  }

  static Future<void> stopwatchComplete() async {
    // Logic to handle what happens when a stopwatch session is completed
    // For example, you might want to show a notification or log the completion
    await resetStopwatch();
  }
}
