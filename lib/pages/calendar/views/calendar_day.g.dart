// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_day.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $calendarDayRoute,
    ];

RouteBase get $calendarDayRoute => GoRouteData.$route(
      path: '/calendar/day',
      name: 'calendar_day',
      factory: _$CalendarDayRoute._fromState,
    );

mixin _$CalendarDayRoute on GoRouteData {
  static CalendarDayRoute _fromState(GoRouterState state) => CalendarDayRoute();

  @override
  String get location => GoRouteData.$location(
        '/calendar/day',
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
