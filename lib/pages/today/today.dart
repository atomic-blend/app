import 'package:app/blocs/tasks/tasks.bloc.dart';
import 'package:app/components/buttons/task_item.dart';
import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/services/sync.service.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/exntensions/date_time_extension.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  @override
  void initState() {
    SyncService.sync(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<TasksBloc, TasksState>(builder: (context, taskState) {
        final todayTasks = _todayTasks(taskState.tasks!);
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: $constants.insets.sm),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.t.times.today,
                style: getTextTheme(context).titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              if (todayTasks.isEmpty)
                Center(
                    child: Text(
                  context.t.today.nothing_to_do,
                  style: getTextTheme(context).labelSmall!,
                )),
              SizedBox(height: $constants.insets.xxs),
              Text(
                context.t.times.tomorrow,
                style: getTextTheme(context).titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Center(
                child: Text(
                  context.t.today.day_off,
                  style: getTextTheme(context).labelSmall!,
                ),
              ),
              SizedBox(height: $constants.insets.xxs),
              Text(
                context.t.times.this_week,
                style: getTextTheme(context).titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              if (taskState.tasks != null && taskState.tasks!.isNotEmpty)
                ...taskState.tasks!.map((task) {
                  return TaskItem(task: task);
                }),
              if (taskState is TasksLoaded &&
                  taskState.tasks != null &&
                  taskState.tasks!.isEmpty)
                Center(
                  child: Text(
                    context.t.today.week_off,
                    textAlign: TextAlign.center,
                    style: getTextTheme(context).labelSmall!,
                  ),
                ),
            ],
          ),
        );
      }),
    );
  }

  List<TaskItem> _todayTasks(List<TaskEntity> tasks) {
    final List<TaskItem> widgets = [];
    for (final task in tasks) {
      if (task.startDate != null && task.startDate!.isToday()) {
        widgets.add(TaskItem(task: task));
      }
    }
    return widgets;
  }
}
