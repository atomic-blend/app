// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completed.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $completedRoute,
    ];

RouteBase get $completedRoute => GoRouteData.$route(
      path: '/completed',
      name: 'completed',
      factory: _$CompletedRoute._fromState,
    );

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
