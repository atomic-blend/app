import 'package:app/i18n/strings.g.dart';
import 'package:ab_shared/services/encryption.service.dart';
import 'package:ab_shared/utils/local_notifications.dart';
import 'package:app/utils/get_it.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class HabitReminderProcessor {
  static processAndNotify(RemoteMessage message) async {
    final locale = AppLocaleUtils.findDeviceLocale();
    final data = message.data;
    final encryptedCitation = data['citation'];

    //get data from local storage or remote message
    final encryptedTitle = data['title'];

    //initialize the encryption engine
    final encryptionService = getIt<EncryptionService>();

    // prepare notification body
    String? title =
        await encryptionService.decryptString(data: encryptedTitle);
    final emoji = data['emoji'];
    final citation =
        await encryptionService.decryptString(data: encryptedCitation);

    final body = citation != ""
        ? citation
        : locale.translations.notifications.habit_due_now;

    if (emoji != null && emoji != "") {
      title = "$emoji $title";
    }

    // setup notification client
    final localNotificationsPlugin = FlutterLocalNotificationsPlugin();

    final notifDetails = LocalNotificationUtil.getNotifDetails(
        "main_channel", "Habit Notifications");

    // show notification
    await localNotificationsPlugin.show(
      DateTime.now().millisecondsSinceEpoch ~/ 1000,
      title,
      body,
      notifDetails,
    );
  }
}
