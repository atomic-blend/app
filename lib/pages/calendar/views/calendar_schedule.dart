import 'package:app/pages/calendar/calendar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

part 'calendar_schedule.g.dart';

@TypedGoRoute<CalendarScheduleRoute>(
    path: '/calendar/schedule', name: "calendar_schedule")
class CalendarScheduleRoute extends GoRouteData with _$CalendarScheduleRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Calendar(
      key: UniqueKey(),
      view: CalendarView.schedule,
    );
  }
}
