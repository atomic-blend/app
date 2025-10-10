// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'today.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $todayRoute,
    ];

RouteBase get $todayRoute => GoRouteData.$route(
      path: '/today',
      name: 'today',
      factory: _$TodayRoute._fromState,
    );

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
