import 'package:app/i18n/strings.g.dart';
import 'package:app/main.dart';
import 'package:app/services/encryption.service.dart';
import 'package:app/services/user.service.dart';
import 'package:app/utils/extensions/date_time_extension.dart';
import 'package:app/utils/local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class TaskReminderProcessor {
  static processAndNotify(RemoteMessage message) async {
    final locale = AppLocaleUtils.findDeviceLocale();
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
    final dueDateString = data['due_date'];
    if (dueDateString == null) {
      return;
    }
    final dueDate = DateTime.parse(dueDateString);
    final now = DateTime.now();
    final body = locale.translations.notifications.task_starting_in(time: dueDate.diffString(locale, now));

    // setup notification client
    final localNotificationsPlugin = FlutterLocalNotificationsPlugin();

    final notifDetails = LocalNotificationUtil.getNotifDetails("main_channel", "Task Notifications");

    // show notification
    await localNotificationsPlugin.show(
      DateTime.now().millisecondsSinceEpoch ~/ 1000,
      title,
      body,
      notifDetails,
    );
  }
}
