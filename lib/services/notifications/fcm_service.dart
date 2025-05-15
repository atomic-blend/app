import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FcmService {
  final FlutterLocalNotificationsPlugin localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initFCM() async {
    // Request permission (iOS)
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    // Initialize local notifications
    const AndroidInitializationSettings androidInitSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // iOS Settings
    const DarwinInitializationSettings iosInitSettings =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      requestProvisionalPermission: false,
      requestCriticalPermission: false,
    );


    // Windows settings
    const WindowsInitializationSettings windowsInitializationSettings =
      WindowsInitializationSettings(
        appName: "Atomic Task",
        appUserModelId: "AtomicBlend.Task",
        guid: "7d39570f-4bf8-428f-95e5-d37ada5d96ba",
    );

    const InitializationSettings initSettings = InitializationSettings(
      android: androidInitSettings,
      iOS: iosInitSettings,
      macOS: iosInitSettings,
      windows: windowsInitializationSettings,
    );

    await localNotificationsPlugin.initialize(initSettings);
  }
}
