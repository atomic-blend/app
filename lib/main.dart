import 'dart:async';
import 'dart:io';

import 'package:ab_shared/services/encryption.service.dart';
import 'package:ab_shared/services/fcm_service.dart';
import 'package:ab_shared/utils/api_client.dart';
import 'package:ab_shared/utils/env/env.dart';
import 'package:app/blocs/device_calendar/device_calendar.bloc.dart';
import 'package:app/blocs/folder/folder.bloc.dart';
import 'package:app/blocs/habit/habit.bloc.dart';
import 'package:app/blocs/tag/tag.bloc.dart';
import 'package:app/blocs/tasks/tasks.bloc.dart';
import 'package:app/blocs/time_entries/time_entry.bloc.dart';
import 'package:app/services/sync.service.dart';
import 'package:flutter_age/flutter_age.dart';
import 'package:app/blocs/app/app.bloc.dart';
import 'package:ab_shared/blocs/auth/auth.bloc.dart';
import 'package:ab_shared/i18n/strings.g.dart' as ab_shared_translations;
import 'package:app/i18n/strings.g.dart';
import 'package:app/services/notifications/background_notification_processor.dart';
import 'package:app/services/notifications/processors/processors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:jiffy/jiffy.dart';
import 'package:macos_window_utils/window_manipulator.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app/utils/get_it.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:toastification/toastification.dart';

import 'app.dart';
import 'firebase_options.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupGetIt();

  await SentryFlutter.init((options) {
    String? dsn = const String.fromEnvironment(
      'SENTRY_DSN',
    );

    options.dsn = dsn;
    options.environment = getIt<EnvModel>().env;

    // Adds request headers and IP for users,
    // visit: https://docs.sentry.io/platforms/dart/data-management/data-collected/ for more info
    options.sendDefaultPii = true;
  }, appRunner: () async {
    tz.initializeTimeZones();

    await LocaleSettings.useDeviceLocale();

    await FlutterAge.init();

    if (!kIsWeb && Platform.isMacOS) {
      await WindowManipulator.initialize();
      WindowManipulator.makeTitlebarTransparent();
      WindowManipulator.enableFullSizeContentView();
    }

    if (kIsWeb || !Platform.isLinux) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      FcmService().initFCM(
        "Atomic Task",
        "fr.atomic-blend.app",
        "fr.atomic-blend.app",
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

    runApp(SentryWidget(
      child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => AppCubit()),
            BlocProvider(create: (context) => TasksBloc()),
            BlocProvider(create: (context) => DeviceCalendarBloc()),
            BlocProvider(create: (context) => HabitBloc()),
            BlocProvider(create: (context) => TagBloc()),
            BlocProvider(create: (context) => FolderBloc()),
            BlocProvider(create: (context) => TimeEntryBloc()),
            BlocProvider(
                create: (context) => AuthBloc(
                      onLogout: () {
                        getIt<SharedPreferences>().clear();
                        getIt<ApiClient>().setIdToken(null);
                        Sentry.configureScope(
                          (scope) => scope.setUser(SentryUser(id: null)),
                        );
                        getIt.unregister<EncryptionService>();
                        SyncService.logout(context);
                      },
                      onLogin: (e) {
                        getIt.registerSingleton<EncryptionService>(e);
                      },
                    )),
          ],
          child: ab_shared_translations.TranslationProvider(
            child:
                TranslationProvider(child: ToastificationWrapper(child: App())),
          )),
    ));
  });
}
