import 'package:app/pages/tasks/filtered_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'completed.g.dart';

@TypedGoRoute<CompletedRoute>(path: '/task/completed', name: "completed")
class CompletedRoute extends GoRouteData with _$CompletedRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return FilteredTaskView(
                filter: (tasks) {
                  return tasks.where((task) => task.completed == true).toList();
                },
              );
  }
}
