import 'package:ab_shared/blocs/auth/auth.bloc.dart';
import 'package:ab_shared/components/ab_toast.dart';
import 'package:app/blocs/app/app.bloc.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/main.dart';
import 'package:ab_shared/components/app/app_layout.dart';
import 'package:app/pages/timer/timer_watcher.dart';
import 'package:ab_shared/utils/app_theme.dart';
import 'package:app/utils/nav_constants.dart';
import 'package:fleather/l10n/fleather_localizations.g.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:ab_shared/flavors.dart';
import 'package:flutter_side_menu/flutter_side_menu.dart';

final sideMenuController = SideMenuController();
final abToastController = ABToastController();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: const [
        FleatherLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: env!.debugShowCheckedModeBanner,
      title: F.title,
      home: _flavorBanner(
        child: BlocBuilder<AuthBloc, AuthState>(builder: (context, authState) {
          return BlocBuilder<AppCubit, AppState>(builder: (context, appState) {
            return TimerWatcher(
              child: AppLayout(
                primaryMenuItems: $navConstants.primaryMenuItems(context),
                authBloc: context.read<AuthBloc>(),
                appCubit: context.read<AppCubit>(),
                sideMenuController: sideMenuController,
                abToastController: abToastController,
                encryptionService: encryptionService,
                globalApiClient: globalApiClient,
                prefs: prefs,
                env: env,
                userKey: userKey,
                agePublicKey: agePublicKey,
                revenueCatService: revenueCatService,
              ),
            );
          });
        }),
        show: kDebugMode && env!.debugShowCheckedModeBanner,
      ),
    );
  }

  Widget _flavorBanner({
    required Widget child,
    bool show = true,
  }) =>
      show
          ? Banner(
              location: BannerLocation.topStart,
              message: F.name,
              color: Colors.green.withValues(alpha: 0.6),
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 12.0,
                  letterSpacing: 1.0),
              textDirection: TextDirection.ltr,
              child: child,
            )
          : Container(
              child: child,
            );
}
