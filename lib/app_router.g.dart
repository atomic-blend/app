// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $appRouter,
    ];

RouteBase get $appRouter => ShellRouteData.$route(
      navigatorKey: AppRouter.$navigatorKey,
      factory: $AppRouterExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: '/',
          name: 'home',
          factory: _$HomeRoute._fromState,
        ),
        GoRouteData.$route(
          path: '/overview',
          name: 'overview',
          factory: _$OverviewRoute._fromState,
        ),
        GoRouteData.$route(
          path: '/inbox',
          name: 'inbox',
          factory: _$InboxRoute._fromState,
        ),
        GoRouteData.$route(
          path: '/today',
          name: 'today',
          factory: _$TodayRoute._fromState,
        ),
        GoRouteData.$route(
          path: '/tags',
          name: 'tags',
          factory: _$TagsRoute._fromState,
        ),
        GoRouteData.$route(
          path: '/folders',
          name: 'folders',
          factory: _$FoldersRoute._fromState,
        ),
        GoRouteData.$route(
          path: '/completed',
          name: 'completed',
          factory: _$CompletedRoute._fromState,
        ),
        GoRouteData.$route(
          path: '/all-tasks',
          name: 'all_tasks',
          factory: _$AllTasksRoute._fromState,
        ),
        GoRouteData.$route(
          path: '/account',
          name: 'account',
          factory: _$AccountRoute._fromState,
        ),
        GoRouteData.$route(
          path: '/settings',
          name: 'settings',
          factory: _$SettingsRoute._fromState,
        ),
      ],
    );

extension $AppRouterExtension on AppRouter {
  static AppRouter _fromState(GoRouterState state) => AppRouter();
}

mixin _$HomeRoute on GoRouteData {
  static HomeRoute _fromState(GoRouterState state) => HomeRoute();

  @override
  String get location => GoRouteData.$location(
        '/',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$OverviewRoute on GoRouteData {
  static OverviewRoute _fromState(GoRouterState state) => OverviewRoute();

  @override
  String get location => GoRouteData.$location(
        '/overview',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$InboxRoute on GoRouteData {
  static InboxRoute _fromState(GoRouterState state) => InboxRoute();

  @override
  String get location => GoRouteData.$location(
        '/inbox',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$TodayRoute on GoRouteData {
  static TodayRoute _fromState(GoRouterState state) => TodayRoute();

  @override
  String get location => GoRouteData.$location(
        '/today',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$TagsRoute on GoRouteData {
  static TagsRoute _fromState(GoRouterState state) => TagsRoute();

  @override
  String get location => GoRouteData.$location(
        '/tags',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$FoldersRoute on GoRouteData {
  static FoldersRoute _fromState(GoRouterState state) => FoldersRoute();

  @override
  String get location => GoRouteData.$location(
        '/folders',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$CompletedRoute on GoRouteData {
  static CompletedRoute _fromState(GoRouterState state) => CompletedRoute();

  @override
  String get location => GoRouteData.$location(
        '/completed',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$AllTasksRoute on GoRouteData {
  static AllTasksRoute _fromState(GoRouterState state) => AllTasksRoute();

  @override
  String get location => GoRouteData.$location(
        '/all-tasks',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$AccountRoute on GoRouteData {
  static AccountRoute _fromState(GoRouterState state) => AccountRoute();

  @override
  String get location => GoRouteData.$location(
        '/account',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$SettingsRoute on GoRouteData {
  static SettingsRoute _fromState(GoRouterState state) => SettingsRoute(
        state.extra as SettingsParams?,
      );

  SettingsRoute get _self => this as SettingsRoute;

  @override
  String get location => GoRouteData.$location(
        '/settings',
      );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}
