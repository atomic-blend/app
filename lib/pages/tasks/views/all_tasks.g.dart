// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_tasks.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $allTasksRoute,
    ];

RouteBase get $allTasksRoute => GoRouteData.$route(
      path: '/task/all-tasks',
      name: 'all_tasks',
      factory: _$AllTasksRoute._fromState,
    );

mixin _$AllTasksRoute on GoRouteData {
  static AllTasksRoute _fromState(GoRouterState state) => AllTasksRoute();

  @override
  String get location => GoRouteData.$location(
        '/task/all-tasks',
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
