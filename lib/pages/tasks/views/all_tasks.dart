import 'package:app/pages/tasks/filtered_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'all_tasks.g.dart';

@TypedGoRoute<AllTasksRoute>(path: '/all-tasks', name: "all_tasks")
class AllTasksRoute extends GoRouteData with _$AllTasksRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return FilteredTaskView(
      filter: (tasks) {
        return tasks.where((task) => task.completed != true).toList();
      },
    );
  }
}
