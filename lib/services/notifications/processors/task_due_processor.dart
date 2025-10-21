import 'package:app/i18n/strings.g.dart';
import 'package:ab_shared/services/encryption.service.dart';
import 'package:ab_shared/utils/local_notifications.dart';
import 'package:app/utils/get_it.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class TaskDueProcessor {
  static processAndNotify(RemoteMessage message) async {
    final locale = AppLocaleUtils.findDeviceLocale();
    final data = message.data;

    //get data from local storage or remote message
    final encryptedTitle = data['title'];

    //initialize the encryption engine
    final encryptionService = getIt<EncryptionService>();
    
    // prepare notification body
    final title = await encryptionService.decryptString(data: encryptedTitle);
    final body = locale.translations.notifications.task_due_now;

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
