import 'package:app/blocs/tasks/tasks.bloc.dart';
import 'package:app/components/buttons/task_item.dart';
import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EisenhowerMatrix extends StatelessWidget {
  const EisenhowerMatrix({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.t.eisenhower.title,
          style: getTextTheme(context).bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: SafeArea(
        child:
            BlocBuilder<TasksBloc, TasksState>(builder: (context, taskState) {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: $constants.insets.xs,
            ),
            child: Column(
              spacing: $constants.insets.xs,
              children: [
                Expanded(
                  child: Row(
                    spacing: $constants.insets.xs,
                    children: [
                      buildEisenhowerCard(
                          context: context,
                          tasks: taskState.tasks ?? [],
                          priority: 3,
                          title: "Urgent & Important",
                          filter: (task) {
                            return task
                                .where((element) => element.priority == 3);
                          }),
                      buildEisenhowerCard(
                          context: context,
                          tasks: taskState.tasks ?? [],
                          priority: 2,
                          title: "Not Urgent & Important",
                          filter: (task) {
                            return task
                                .where((element) => element.priority == 2);
                          }),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    spacing: $constants.insets.xs,
                    children: [
                      buildEisenhowerCard(
                          context: context,
                          tasks: taskState.tasks ?? [],
                          priority: 1,
                          title: "Urgent & Unimportant",
                          filter: (task) {
                            //TODO: add filter for overdue tasks
                            return task
                                .where((element) => element.priority == 1);
                          }),
                      buildEisenhowerCard(
                          context: context,
                          tasks: taskState.tasks ?? [],
                          priority: null,
                          title: "Not Urgent & Unimportant",
                          filter: (task) {
                            return task
                                .where((element) => element.priority == null);
                          }),
                    ],
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget buildEisenhowerCard({
    required BuildContext context,
    required List<TaskEntity> tasks,
    required String title,
    required int? priority,
    required Function(List<TaskEntity>) filter,
  }) {
    final filteredTasks = filter(tasks).toList();
    return Expanded(
      child: DragTarget<TaskEntity>(
        onWillAcceptWithDetails: (details) {
          return details.data.priority != priority;
        },
        onAcceptWithDetails: (details) {
          final task = details.data;
          context.read<TasksBloc>().add(
                EditTask(
                  task.copyWith(priority: priority),
                ),
              );
        },
        builder: (BuildContext context, List<TaskEntity?> candidateData,
            List<dynamic> rejectedData) {
          return Container(
            padding: EdgeInsets.all($constants.insets.xs),
            decoration: BoxDecoration(
              color: getTheme(context).surfaceContainer,
              borderRadius: BorderRadius.circular($constants.insets.sm),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: $constants.insets.xs,
                    ),
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        color: priority == null || priority == 0
                            ? Colors.grey
                            : priority == 1
                                ? Colors.blueAccent
                                : priority == 2
                                    ? Colors.deepOrangeAccent
                                    : Colors.red,
                        borderRadius:
                            BorderRadius.circular($constants.insets.sm),
                      ),
                      child: Icon(
                        CupertinoIcons.flag_fill,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: $constants.insets.xs,
                    ),
                    Flexible(
                      child: Text(
                        title,
                        style: getTextTheme(context).bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: $constants.insets.xs,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ...filteredTasks.map((task) {
                          return TaskItem(
                            task: task,
                            collapsed: true,
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
