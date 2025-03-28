import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationUtil {
  static NotificationDetails getNotifDetails(String androidChannelId, String androidChannelName) {
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
}
