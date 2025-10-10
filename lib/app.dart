import 'package:ab_shared/flavors.dart';
import 'package:ab_shared/pages/auth/screens/auth_routes.dart' as auth_routes;
import 'package:ab_shared/utils/env/env.dart';
import 'package:app/pages/timer/timer_watcher.dart';
import 'package:go_router/go_router.dart';
import 'package:app/app_router.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:ab_shared/utils/app_theme.dart';
import 'package:fleather/l10n/fleather_localizations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:app/utils/get_it.dart';

class App extends StatelessWidget {
  App({super.key});

  @override
  Widget build(BuildContext context) {
    if (!getIt.isRegistered<GoRouter>()) {
      getIt.registerSingleton<GoRouter>(_router);
    }
    return TimerWatcher(
      child: MaterialApp.router(
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.system,
        locale: TranslationProvider.of(context).flutterLocale,
        // use provider
        supportedLocales: AppLocaleUtils.supportedLocales,
        localizationsDelegates: const [
          FleatherLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        debugShowCheckedModeBanner: getIt<EnvModel>().debugShowCheckedModeBanner,
        title: F.title,
        routerConfig: _router,
      ),
    );
  }

  final GoRouter _router = GoRouter(
    routes: [
      ...$appRoutes,
      ...auth_routes.$appRoutes,
    ],
    initialLocation: '/',
    navigatorKey: getIt<GlobalKey<NavigatorState>>(
      instanceName: 'rootNavigatorKey',
    ),
  );
}
