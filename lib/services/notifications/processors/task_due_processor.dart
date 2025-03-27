import 'dart:convert';

import 'package:app/i18n/strings.g.dart';
import 'package:app/main.dart';
import 'package:app/services/encryption.service.dart';
import 'package:app/services/user.service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class TaskDueProcessor {
  static processAndNotify(RemoteMessage message) async {
    // final locale = AppLocaleUtils.findDeviceLocale();
    final data = message.data;

    //get data from local storage or remote message
    final encryptedTitle = data['title'];
    if (userData == null) {
      return;
    }

    //initialize the encryption engine
    encryptionService =
        EncryptionService(userSalt: userData!['keySet']['salt']);

    // prepare notification body
    final title = await encryptionService?.decryptString(data: encryptedTitle);
    // final body = locale.translations.notifications.task_due_now;

    // setup notification client
    final localNotificationsPlugin = FlutterLocalNotificationsPlugin();

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

    // show notification
    await localNotificationsPlugin.show(
      DateTime.now().millisecondsSinceEpoch ~/ 1000,
      title,
      "body",
      notifDetails,
    );
  }
}
