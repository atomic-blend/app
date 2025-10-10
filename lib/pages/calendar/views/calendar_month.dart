import 'package:app/pages/calendar/calendar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

part 'calendar_month.g.dart';

@TypedGoRoute<CalendarMonthRoute>(path: '/calendar/month', name: "calendar_month")  
class CalendarMonthRoute extends GoRouteData with _$CalendarMonthRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Calendar(
      key: UniqueKey(),
      view: CalendarView.month,
    );
  }
}