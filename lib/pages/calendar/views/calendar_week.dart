import 'package:app/pages/calendar/calendar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

part 'calendar_week.g.dart';

@TypedGoRoute<CalendarWeekRoute>(path: '/calendar/week', name: "calendar_week")
class CalendarWeekRoute extends GoRouteData with _$CalendarWeekRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Calendar(
      key: UniqueKey(),
      view: CalendarView.week,
      numberOfDays: 7,
    );
  }
}
