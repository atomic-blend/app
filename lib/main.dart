import 'dart:async';
import 'package:app/blocs/app/app.bloc.dart';
import 'package:app/blocs/auth/auth.bloc.dart';
import 'package:app/blocs/tasks/tasks.bloc.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/env/env.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toastification/toastification.dart';
import 'app.dart';
import 'firebase_options.dart';

EnvModel? env;
SharedPreferences? prefs;

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  env = await EnvModel.create();
  prefs = await SharedPreferences.getInstance();

  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );

  LocaleSettings.useDeviceLocale();

  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit()),
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => TasksBloc()),
      ],
      child: TranslationProvider(
          child: const ToastificationWrapper(child: App()))));
}
