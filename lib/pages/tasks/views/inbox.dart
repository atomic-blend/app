import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/pages/tasks/filtered_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'inbox.g.dart';

@TypedGoRoute<InboxRoute>(path: '/inbox', name: "inbox")
class InboxRoute extends GoRouteData with _$InboxRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return FilteredTaskView(
      filter: (List<TaskEntity> tasks) {
        final List<TaskEntity> widgets = [];
        for (final task in tasks) {
          if (task.completed != true && task.folderId == null) {
            widgets.add(task);
          }
        }
        return widgets;
      },
    );
  }
}
