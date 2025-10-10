// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_three_days.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $calendarThreeDaysRoute,
    ];

RouteBase get $calendarThreeDaysRoute => GoRouteData.$route(
      path: '/calendar/three-days',
      name: 'calendar_three_days',
      factory: _$CalendarThreeDaysRoute._fromState,
    );

mixin _$CalendarThreeDaysRoute on GoRouteData {
  static CalendarThreeDaysRoute _fromState(GoRouterState state) =>
      CalendarThreeDaysRoute();

  @override
  String get location => GoRouteData.$location(
        '/calendar/three-days',
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
