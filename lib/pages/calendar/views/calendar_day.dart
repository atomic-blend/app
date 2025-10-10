import 'package:app/pages/calendar/calendar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

part 'calendar_day.g.dart';

@TypedGoRoute<CalendarDayRoute>(path: '/calendar/day', name: "calendar_day")  
class CalendarDayRoute extends GoRouteData with _$CalendarDayRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Calendar(
      key: UniqueKey(),
      view: CalendarView.day,
    );
  }
}