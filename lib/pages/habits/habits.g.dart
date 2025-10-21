// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habits.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $habitsRoute,
    ];

RouteBase get $habitsRoute => GoRouteData.$route(
      path: '/habits',
      name: 'habits',
      factory: _$HabitsRoute._fromState,
    );

mixin _$HabitsRoute on GoRouteData {
  static HabitsRoute _fromState(GoRouterState state) => HabitsRoute();

  @override
  String get location => GoRouteData.$location(
        '/habits',
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
