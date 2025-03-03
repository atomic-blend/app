import 'package:app/blocs/tasks/tasks.bloc.dart';
import 'package:app/components/buttons/task_item.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/services/sync.service.dart';
import 'package:app/utils/constants.dart';
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
        return Column(
          children: [
            if (taskState.tasks != null && taskState.tasks!.isNotEmpty)
              ...taskState.tasks!.map((task) {
                return TaskItem(task: task);
              }),
            if (taskState is TasksLoaded &&
                taskState.tasks != null &&
                taskState.tasks!.isEmpty)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: $constants.insets.sm),
                child: Text(context.t.tasks.no_tasks_for_now),
              ),
          ],
        );
      }),
    );
  }
}
