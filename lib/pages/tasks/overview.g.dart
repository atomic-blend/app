// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overview.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $overviewRoute,
    ];

RouteBase get $overviewRoute => GoRouteData.$route(
      path: '/task/overview',
      name: 'overview',
      factory: _$OverviewRoute._fromState,
    );

mixin _$OverviewRoute on GoRouteData {
  static OverviewRoute _fromState(GoRouterState state) => OverviewRoute();

  @override
  String get location => GoRouteData.$location(
        '/task/overview',
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
