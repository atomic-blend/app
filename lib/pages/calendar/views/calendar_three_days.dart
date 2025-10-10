import 'package:app/pages/calendar/calendar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

part 'calendar_three_days.g.dart';

@TypedGoRoute<CalendarThreeDaysRoute>(
    path: '/calendar/three-days', name: "calendar_three_days")
class CalendarThreeDaysRoute extends GoRouteData with _$CalendarThreeDaysRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Calendar(
      key: UniqueKey(),
      view: CalendarView.week,
      numberOfDays: 3,
    );
  }
}
