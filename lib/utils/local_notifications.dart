import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationUtil {
  static NotificationDetails getNotifDetails(
      String androidChannelId, String androidChannelName) {
    // define notification details
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'main_channel',
      'Task Notifications',
      importance: Importance.high,
      priority: Priority.high,
    );

    const DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      interruptionLevel: InterruptionLevel.critical,
    );

    const NotificationDetails notifDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    return notifDetails;
  }

  // static method to schedule a pomodoro notification
  static Future<void> schedulePomodoroNotification(String androidChannelId,
      String androidChannelName, int id, DateTime scheduledTime) async {
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    final NotificationDetails notifDetails =
        getNotifDetails(androidChannelId, androidChannelName);

    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      'Pomodoro Complete!',
      'Time to take a break or start a new session.',
      tz.TZDateTime.from(scheduledTime, tz.local),
      notifDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  static Future<void> cancelNotification(int id) async {
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin.cancel(id);
  }
}
