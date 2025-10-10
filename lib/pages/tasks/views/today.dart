import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/pages/tasks/filtered_view.dart';
import 'package:app/utils/extensions/date_time_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'today.g.dart';

@TypedGoRoute<TodayRoute>(path: '/task/today', name: "today")
class TodayRoute extends GoRouteData with _$TodayRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return FilteredTaskView(
      filter: (List<TaskEntity> tasks) {
        final List<TaskEntity> widgets = [];
        for (final task in tasks) {
          if (task.completed != true && task.endDate != null && task.endDate!.isToday()) {
            widgets.add(task);
          }
        }
        return widgets;
      },
    );
  }
}