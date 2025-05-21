import 'package:app/blocs/tasks/tasks.bloc.dart';
import 'package:app/components/buttons/task_item.dart';
import 'package:app/components/widgets/elevated_container.dart';
import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../tasks/add_task_modal.dart';

class EisenhowerMatrix extends StatelessWidget {
  const EisenhowerMatrix({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isDesktop(context)
          ? null
          : AppBar(
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
            padding: EdgeInsets.only(
              left: $constants.insets.sm,
              right: $constants.insets.sm,
              bottom: isDesktop(context) ? $constants.insets.sm : 0,
            ),
            child: Column(
              spacing: isDesktop(context)
                  ? $constants.insets.sm
                  : $constants.insets.xs,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: $constants.insets.xs),
                    child: Row(
                      spacing: isDesktop(context)
                          ? $constants.insets.sm
                          : $constants.insets.xs,
                      children: [
                        buildEisenhowerCard(
                            context: context,
                            tasks: taskState.tasks ?? [],
                            priority: 3,
                            title: "Urgent & Important",
                            filter: (task) {
                              return task.where((element) =>
                                  element.priority == 3 &&
                                  element.completed != true);
                            }),
                        buildEisenhowerCard(
                            context: context,
                            tasks: taskState.tasks ?? [],
                            priority: 2,
                            title: "Not Urgent & Important",
                            filter: (task) {
                              return task.where((element) =>
                                  element.priority == 2 &&
                                  element.completed != true);
                            }),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    spacing: isDesktop(context)
                        ? $constants.insets.sm
                        : $constants.insets.xs,
                    children: [
                      buildEisenhowerCard(
                          context: context,
                          tasks: taskState.tasks ?? [],
                          priority: 1,
                          title: "Urgent & Unimportant",
                          filter: (task) {
                            //TODO: add filter for overdue tasks
                            return task.where((element) =>
                                element.priority == 1 &&
                                element.completed != true);
                          }),
                      buildEisenhowerCard(
                          context: context,
                          tasks: taskState.tasks ?? [],
                          priority: null,
                          title: "Not Urgent & Unimportant",
                          filter: (task) {
                            return task.where((element) =>
                                element.priority == null &&
                                element.completed != true);
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
                  task.copyWith(
                    priority: priority,
                    startDate: null,
                    endDate:
                        _updateDateTimeWithPriority(priority, task.endDate),
                  ),
                ),
              );
        },
        builder: (BuildContext context, List<TaskEntity?> candidateData,
            List<dynamic> rejectedData) {
          return ElevatedContainer(
            padding: EdgeInsets.symmetric(
                vertical: $constants.insets.xs,
                horizontal: $constants.insets.xs),
            child: Column(
              children: [
                Row(
                  children: [
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
                      child: const Icon(
                        CupertinoIcons.flag_fill,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: $constants.insets.xs,
                    ),
                    Expanded(
                      child: Text(
                        title,
                        style: getTextTheme(context).bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      width: $constants.insets.xs,
                    ),
                    GestureDetector(
                      onTap: () {
                        final date =
                            _updateDateTimeWithPriority(priority, null);
                        if (isDesktop(context)) {
                          showDialog(
                              context: context,
                              builder: (context) => Dialog(
                                      child: AddTaskModal(
                                    endDate: date,
                                    priority: priority,
                                  )));
                        } else {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (context) => AddTaskModal(
                                    endDate: date,
                                    priority: priority,
                                  ));
                        }
                      },
                      child: const Icon(
                        CupertinoIcons.plus,
                        size: 20,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: $constants.insets.xxs,
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      ...filteredTasks.map((task) {
                        return TaskItem(
                          task: task,
                          collapsed: true,
                          slideable: false,
                        );
                      }).toList(),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  DateTime _updateDateTimeWithPriority(int? priority, DateTime? date) {
    date ??= DateTime.now();
    switch (priority) {
      case 1:
        final today = DateTime.now();
        // same hour, today
        return date.copyWith(
            day: today.day, month: today.month, year: today.year);
      case 2:
        // start next week, same hour
        final now = DateTime.now();
        final daysUntilMonday = now.weekday == 1 ? 7 : (8 - now.weekday) % 7;
        final nextMonday = now.add(Duration(days: daysUntilMonday));
        return date.copyWith(
          day: nextMonday.day,
          month: nextMonday.month,
          year: nextMonday.year,
        );
      case 3:
        // same hour, today
        final today = DateTime.now();
        return date.copyWith(
            day: today.day, month: today.month, year: today.year);
      case null:
        // start next week, same hour
        final now = DateTime.now();
        final daysUntilMonday = now.weekday == 1 ? 7 : (8 - now.weekday) % 7;
        final nextMonday = now.add(Duration(days: daysUntilMonday));
        return date.copyWith(
          day: nextMonday.day,
          month: nextMonday.month,
          year: nextMonday.year,
        );
      default:
        return date;
    }
  }
}
