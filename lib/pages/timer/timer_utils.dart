import 'package:app/main.dart';

class TimerUtils {
  static Future<void> startPomodoroTimer(
      int durationInMinutes) async {
        final startDate = DateTime.now();

        await prefs?.setString(
          'pomodoro_start_time',
          startDate.toIso8601String(),
        );
        await prefs?.setInt(
          'pomodoro_duration',
          durationInMinutes,
        );

        //TODO: schedule a notification for when the pomodoro ends
  }

  static Future<Duration> getPomodoroRemainingTime() async {
    final startTimeString = prefs?.getString('pomodoro_start_time');
    final durationInMinutes = prefs?.getInt('pomodoro_duration') ?? 25;

    if (startTimeString == null) {
      return Duration.zero;
    }

    final startTime = DateTime.parse(startTimeString);
    final elapsed = DateTime.now().difference(startTime);
    final totalDuration = Duration(minutes: durationInMinutes);

    return totalDuration - elapsed;
  }

  static Future<void> resetPomodoroTimer() async {
    await prefs?.remove('pomodoro_start_time');
    await prefs?.remove('pomodoro_duration');
  }

  static Future<bool> isPomodoroRunning() async {
    final startTimeString = prefs?.getString('pomodoro_start_time');
    return startTimeString != null;
  }

  static Future<void> pomodoroComplete() async {
    // Logic to handle what happens when a pomodoro session is completed
    // For example, you might want to show a notification or log the completion
    //TODO: 
    await resetPomodoroTimer();
  }

  static Future<void> startStopwatch() async {
    final startDate = DateTime.now();

    await prefs?.setString(
      'stopwatch_start_time',
      startDate.toIso8601String(),
    );
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
