import 'package:ab_shared/pages/account/account.dart';
import 'package:ab_shared/pages/settings/settings.dart';
import 'package:app/pages/tasks/folders.dart';
import 'package:app/pages/tasks/overview.dart';
import 'package:app/pages/tasks/tags.dart';
import 'package:app/pages/tasks/views/all_tasks.dart';
import 'package:app/pages/tasks/views/completed.dart';
import 'package:app/pages/tasks/views/inbox.dart';
import 'package:app/pages/tasks/views/today.dart';
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
    TypedGoRoute<TodayRoute>(path: '/today', name: "today"),
    TypedGoRoute<TagsRoute>(path: '/tags', name: "tags"),
    TypedGoRoute<FoldersRoute>(path: '/folders', name: "folders"),
    TypedGoRoute<CompletedRoute>(path: '/completed', name: "completed"),
    TypedGoRoute<AllTasksRoute>(path: '/all-tasks', name: "all_tasks"),
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
