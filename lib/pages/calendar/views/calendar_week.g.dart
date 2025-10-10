// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_week.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $calendarWeekRoute,
    ];

RouteBase get $calendarWeekRoute => GoRouteData.$route(
      path: '/calendar/week',
      name: 'calendar_week',
      factory: _$CalendarWeekRoute._fromState,
    );

mixin _$CalendarWeekRoute on GoRouteData {
  static CalendarWeekRoute _fromState(GoRouterState state) =>
      CalendarWeekRoute();

  @override
  String get location => GoRouteData.$location(
        '/calendar/week',
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
