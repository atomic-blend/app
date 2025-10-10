// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eisenhower.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $eisenhowerRoute,
    ];

RouteBase get $eisenhowerRoute => GoRouteData.$route(
      path: '/eisenhower',
      name: 'eisenhower',
      factory: _$EisenhowerRoute._fromState,
    );

mixin _$EisenhowerRoute on GoRouteData {
  static EisenhowerRoute _fromState(GoRouterState state) => EisenhowerRoute();

  @override
  String get location => GoRouteData.$location(
        '/eisenhower',
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
