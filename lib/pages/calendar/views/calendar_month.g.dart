// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_month.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $calendarMonthRoute,
    ];

RouteBase get $calendarMonthRoute => GoRouteData.$route(
      path: '/calendar/month',
      name: 'calendar_month',
      factory: _$CalendarMonthRoute._fromState,
    );

mixin _$CalendarMonthRoute on GoRouteData {
  static CalendarMonthRoute _fromState(GoRouterState state) =>
      CalendarMonthRoute();

  @override
  String get location => GoRouteData.$location(
        '/calendar/month',
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
