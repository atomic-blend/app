import 'package:ab_shared/pages/account/account.dart';
import 'package:ab_shared/pages/settings/settings.dart';
import 'package:app/pages/tasks/overview.dart';
import 'package:app/pages/tasks/views/inbox.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:ab_shared/components/app/app_layout.dart';
import 'package:app/pages/home/home.dart';
import 'package:app/utils/nav_constants.dart';

part 'app_router.g.dart';

final GlobalKey<NavigatorState> appLayoutNavigatorKey =
    GlobalKey<NavigatorState>();

@TypedShellRoute<AppRouter>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<HomeRoute>(path: '/', name: "home"),
    TypedGoRoute<OverviewRoute>(path: '/overview', name: "overview"),
    TypedGoRoute<InboxRoute>(path: '/inbox', name: "inbox"),
    TypedGoRoute<AccountRoute>(path: '/account', name: "account"),
    TypedGoRoute<SettingsRoute>(path: '/settings', name: "settings"),
  ],
)
class AppRouter extends ShellRouteData {
  final getIt = GetIt.instance;
  AppRouter();

  static final GlobalKey<NavigatorState> $navigatorKey = appLayoutNavigatorKey;

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return AppLayout(
      key: state.pageKey,
      items: $navConstants.primaryMenuItems(
        context,
      ),
      homeRouteLocation: '/',
      child: navigator,
    );
  }
}
