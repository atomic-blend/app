// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_schedule.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $calendarScheduleRoute,
    ];

RouteBase get $calendarScheduleRoute => GoRouteData.$route(
      path: '/calendar/schedule',
      name: 'calendar_schedule',
      factory: _$CalendarScheduleRoute._fromState,
    );

mixin _$CalendarScheduleRoute on GoRouteData {
  static CalendarScheduleRoute _fromState(GoRouterState state) =>
      CalendarScheduleRoute();

  @override
  String get location => GoRouteData.$location(
        '/calendar/schedule',
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
