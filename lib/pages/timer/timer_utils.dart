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

  static Future<Duration> getPomodoroRemainingTime() async {
    final startTimeString = prefs?.getString('pomodoro_start_time');
    final durationInMinutes = prefs?.getInt('pomodoro_duration') ?? 20;

    if (startTimeString == null) {
      return Duration.zero;
    }

    final startTime = DateTime.parse(startTimeString);
    final elapsed = DateTime.now().difference(startTime);
    final totalDuration = Duration(minutes: durationInMinutes);

    return totalDuration - elapsed;
  }

  static Future<void> resetPomodoroTimer({bool? completed = false}) async {
    await prefs?.remove('pomodoro_start_time');
    await prefs?.remove('pomodoro_duration');
    await prefs?.remove('pomodoro_task_id');

    if (completed == false) {
      await LocalNotificationUtil.cancelNotification(0);
    }
  }

  static Future<bool> isPomodoroRunning() async {
    final startTimeString = prefs?.getString('pomodoro_start_time');
    return startTimeString != null;
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

  static Future<Duration> getStopwatchElapsedTime() async {
    final startTimeString = prefs?.getString('stopwatch_start_time');

    if (startTimeString == null) {
      return Duration.zero;
    }

    final startTime = DateTime.parse(startTimeString);
    return DateTime.now().difference(startTime);
  }

  static Future<void> resetStopwatch() async {
    await prefs?.remove('stopwatch_start_time');
    await prefs?.remove('stopwatch_task_id');
  }

  static Future<bool> isStopwatchRunning() async {
    final startTimeString = prefs?.getString('stopwatch_start_time');
    return startTimeString != null;
  }

  static Future<void> stopwatchComplete() async {
    // Logic to handle what happens when a stopwatch session is completed
    // For example, you might want to show a notification or log the completion
    await resetStopwatch();
  }
}
