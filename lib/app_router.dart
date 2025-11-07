import 'package:ab_shared/pages/account/account.dart';
import 'package:ab_shared/pages/settings/settings.dart';
import 'package:app/pages/calendar/views/calendar_day.dart';
import 'package:app/pages/calendar/views/calendar_month.dart';
import 'package:app/pages/calendar/views/calendar_schedule.dart';
import 'package:app/pages/calendar/views/calendar_three_days.dart';
import 'package:app/pages/calendar/views/calendar_week.dart';
import 'package:app/pages/eiseinhower/eisenhower.dart';
import 'package:app/pages/habits/habits.dart';
import 'package:app/pages/search/search.dart';
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
    TypedGoRoute<OverviewRoute>(path: '/task/overview', name: "overview"),
    TypedGoRoute<InboxRoute>(path: '/task/inbox', name: "inbox"),
    TypedGoRoute<TodayRoute>(path: '/task/today', name: "today"),
    TypedGoRoute<CompletedRoute>(path: '/task/completed', name: "completed"),
    TypedGoRoute<AllTasksRoute>(path: '/task/all-tasks', name: "all_tasks"),
    TypedGoRoute<TagsRoute>(path: '/tags', name: "tags"),
    TypedGoRoute<FoldersRoute>(path: '/folders', name: "folders"),
    TypedGoRoute<CalendarWeekRoute>(
        path: '/calendar/week', name: "calendar_week"),
    TypedGoRoute<CalendarScheduleRoute>(
        path: '/calendar/schedule', name: "calendar_schedule"),
    TypedGoRoute<CalendarThreeDaysRoute>(
        path: '/calendar/three-days', name: "calendar_three_days"),
    TypedGoRoute<CalendarMonthRoute>(
        path: '/calendar/month', name: "calendar_month"),
    TypedGoRoute<CalendarDayRoute>(path: '/calendar/day', name: "calendar_day"),
    TypedGoRoute<SearchRoute>(path: '/search', name: "search"),
    TypedGoRoute<HabitsRoute>(path: '/habits', name: "habits"),
    TypedGoRoute<EisenhowerRoute>(path: '/task/eisenhower', name: "eisenhower"),
    TypedGoRoute<AccountRoute>(path: '/account', name: "account"),
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
