import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:ab_shared/services/encryption.service.dart';
import 'package:app/blocs/app/app.bloc.dart';
import 'package:app/blocs/auth/auth.bloc.dart';
import 'package:app/blocs/device_calendar/device_calendar.bloc.dart';
import 'package:app/blocs/folder/folder.bloc.dart';
import 'package:app/blocs/habit/habit.bloc.dart';
import 'package:app/blocs/tag/tag.bloc.dart';
import 'package:app/blocs/tasks/tasks.bloc.dart';
import 'package:app/blocs/time_entries/time_entry.bloc.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/services/notifications/background_notification_processor.dart';
import 'package:ab_shared/services/fcm_service.dart';
import 'package:app/services/notifications/processors/processors.dart';
import 'package:ab_shared/services/revenue_cat_service.dart';
import 'package:app/services/widget_service/background_processor.dart';
import 'package:app/utils/env/env.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_age/flutter_age.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_widget/home_widget.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:jiffy/jiffy.dart';
import 'package:macos_window_utils/window_manipulator.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:toastification/toastification.dart';

import 'app.dart';
import 'firebase_options.dart';

EnvModel? env;
SharedPreferences? prefs;
FcmService? fcmService;
Map<String, dynamic>? userData;
String? userKey;
String? agePublicKey;
const String appGroupId = "group.atomicblend.tasks";
EncryptionService? encryptionService;
RevenueCatService? revenueCatService;

FutureOr<void> main() async {
  await SentryFlutter.init((options) {
    String? dsn = const String.fromEnvironment(
      'SENTRY_DSN',
    );

    options.dsn = dsn;
    options.environment = env?.env;

    // Adds request headers and IP for users,
    // visit: https://docs.sentry.io/platforms/dart/data-management/data-collected/ for more info
    options.sendDefaultPii = true;
  }, appRunner: () async {
    env = await EnvModel.create();
    prefs = await SharedPreferences.getInstance();

    await FlutterAge.init();

    if (!kIsWeb && !kIsWasm) {
      HomeWidget.setAppGroupId(appGroupId);
      HomeWidget.registerInteractivityCallback(backgroundCallback);
    }

    tz.initializeTimeZones();

    if (!kIsWeb && Platform.isMacOS) {
      await WindowManipulator.initialize();
      WindowManipulator.makeTitlebarTransparent();
      WindowManipulator.enableFullSizeContentView();
    }

    if (isPaymentSupported()) {
      revenueCatService = RevenueCatService(
        googleRevenueCatApiKey: env!.googleRevenueCatApiKey,
        appleRevenueCatApiKey: env!.appleRevenueCatApiKey,
      );
      await revenueCatService!.initPlatformState();
    }

    final rawUserData = prefs?.getString("user");
    userData = rawUserData != null ? json.decode(rawUserData) : null;
    userKey = prefs?.getString("key");
    agePublicKey = prefs?.getString("age_public_key");

    // Only create encryption service if user data exists
    if (userData != null && userData!['keySet'] != null) {
      encryptionService = EncryptionService(
        userSalt: userData?['keySet']['salt'],
        prefs: prefs!,
        userKey: userKey,
        agePublicKey: agePublicKey,
      );
    }   
      
    if (kIsWeb || !Platform.isLinux) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      fcmService = FcmService();
      fcmService!.initFCM(
        "Atomic Task",
        "AtomicBlend.Task",
        "7d39570f-4bf8-428f-95e5-d37ada5d96ba",
      );

      // Register background handler
      FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

      // Foreground message handler
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        Processors.processAndNotify(message);
      });
    }

    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb || kIsWasm
          ? HydratedStorageDirectory.web
          : HydratedStorageDirectory((await getTemporaryDirectory()).path),
    );

    await LocaleSettings.useDeviceLocale();
    Jiffy.setLocale(LocaleSettings.currentLocale.languageCode);

    runApp(ResponsiveSizer(builder: (context, orientation, screenType) {
      return SentryWidget(
        child: MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => AppCubit()),
              BlocProvider(create: (context) => AuthBloc()),
              BlocProvider(create: (context) => TasksBloc()),
              BlocProvider(create: (context) => DeviceCalendarBloc()),
              BlocProvider(create: (context) => HabitBloc()),
              BlocProvider(create: (context) => TagBloc()),
              BlocProvider(create: (context) => FolderBloc()),
              BlocProvider(create: (context) => TimeEntryBloc()),
            ],
            child: TranslationProvider(
                child: const ToastificationWrapper(child: App()))),
      );
    }));
  });
}
