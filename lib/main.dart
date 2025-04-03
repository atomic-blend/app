import 'dart:async';
import 'dart:convert';
import 'package:app/blocs/app/app.bloc.dart';
import 'package:app/blocs/auth/auth.bloc.dart';
import 'package:app/blocs/device_calendar/device_calendar.bloc.dart';
import 'package:app/blocs/tasks/tasks.bloc.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/services/notifications/background_notification_processor.dart';
import 'package:app/services/notifications/fcm_service.dart';
import 'package:app/services/notifications/processors/processors.dart';
import 'package:app/utils/env/env.dart';
import 'package:device_calendar/device_calendar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:jiffy/jiffy.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toastification/toastification.dart';
import 'app.dart';
import 'firebase_options.dart';

EnvModel? env;
SharedPreferences? prefs;
FcmService? fcmService;
Map<String, dynamic>? userData;
String? userKey;

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  env = await EnvModel.create();
  prefs = await SharedPreferences.getInstance();

  final rawUserData = prefs?.getString("user");
  userData = rawUserData != null ? json.decode(rawUserData) : null;
  userKey = prefs?.getString("key");

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  fcmService = FcmService();
  await fcmService!.initFCM();

  // Register background handler
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  // Foreground message handler
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    Processors.processAndNotify(message);
  });

  final deviceCalendarPlugin = DeviceCalendarPlugin();
  var permissionResult = await deviceCalendarPlugin.requestPermissions();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );

  await LocaleSettings.useDeviceLocale();
  Jiffy.setLocale(LocaleSettings.currentLocale.languageCode);

  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit()),
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => TasksBloc()),
        BlocProvider(create: (context) => DeviceCalendarBloc()),
      ],
      child: TranslationProvider(
          child: const ToastificationWrapper(child: App()))));
}
