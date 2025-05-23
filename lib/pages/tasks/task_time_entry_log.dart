import 'package:app/blocs/tasks/tasks.bloc.dart';
import 'package:app/components/modals/delete_confirm_modal.dart';
import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/entities/time_entry/time_entry.entity.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/pages/tasks/add_time_entry.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:jiffy/jiffy.dart';

class TaskTimeEntryLog extends StatelessWidget {
  final TaskEntity task;

  const TaskTimeEntryLog({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return BlocListener<TasksBloc, TasksState>(
      listener: (context, state) {
        if (state is TaskRemoveTimeEntrySuccess) {
          Navigator.pop(context);
        }
      },
      child: BlocBuilder<TasksBloc, TasksState>(
        builder: (context, taskState) {
          final TaskEntity latestTask = taskState.tasks?.firstWhere(
            (task) => task.id == this.task.id,
            orElse: () => task,
          ) ?? task;
          return Padding(
            padding: EdgeInsets.all($constants.insets.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          padding: EdgeInsets.all($constants.insets.xxs),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: const Icon(
                            CupertinoIcons.xmark,
                            size: 18,
                          ),
                        )),
                    SizedBox(
                      width: $constants.insets.xs,
                    ),
                    Text(
                      context.t.tasks.time_spent,
                      style: getTextTheme(context).headlineLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        if (isDesktop(context)) {
                          showDialog(
                              context: context,
                              builder: (context) => Dialog(
                                    child: AddTimeEntry(
                                      task: latestTask,
                                    ),
                                  ));
                        } else {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) => SizedBox(
                                height: getSize(context).height * 0.4,
                                width: double.infinity,
                                child: AddTimeEntry(
                                  task: latestTask,
                                )),
                          );
                        }
                      },
                      child: Text(
                        context.t.actions.add,
                        style: getTextTheme(context).labelMedium!.copyWith(
                              color: getTheme(context).primary,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: $constants.insets.xs,
                ),
                if (latestTask.timeEntries == null || latestTask.timeEntries!.isEmpty)
                  Text(
                    context.t.tasks.no_time_entries,
                    style: getTextTheme(context)
                        .bodyMedium!
                        .copyWith(color: Colors.grey),
                  ),
                if (latestTask.timeEntries != null && latestTask.timeEntries!.isNotEmpty)
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        ...?latestTask.timeEntries?.map(
                            (timeEntry) => _buildTimeEntryCard(context, latestTask, timeEntry)),
                      ],
                    ),
                  )
              ],
            ),
          );
        }
      ),
    );
  }

  _buildTimeEntryCard(BuildContext context, TaskEntity task, TimeEntry timeEntry) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SizedBox(
            width: $constants.insets.xs,
          ),
          Theme(
            data: Theme.of(context).copyWith(
                outlinedButtonTheme: const OutlinedButtonThemeData(
              style: ButtonStyle(
                iconColor: WidgetStatePropertyAll(Colors.white),
                iconSize: WidgetStatePropertyAll(25),
              ),
            )),
            child: Expanded(
              child: GestureDetector(
                onTap: () {
                  if (!context.mounted) return;
                  showDialog(
                    context: context,
                    builder: (context) => DeleteConfirmModal(
                      title: context.t.habits.habit_detail.delete_entry,
                      description: context
                          .t.habits.habit_detail.delete_entry_description,
                      warning:
                          context.t.habits.habit_detail.delete_entry_warning,
                      onDelete: () {
                        if (!context.mounted) {
                          return;
                        }
                        context.read<TasksBloc>().add(
                              RemoveTimeEntryFromTask(
                                task: task,
                                timeEntry: timeEntry,
                              ),
                            );
                      
                      },
                    ),
                  );
                },
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    CupertinoIcons.trash,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: getTheme(context).surfaceContainer,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all($constants.insets.xs),
        child: Padding(
          padding: EdgeInsets.all($constants.insets.xs),
          child: Row(
            children: [
              const Icon(
                CupertinoIcons.clock,
              ),
              SizedBox(
                width: $constants.insets.md,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Manual Entry",
                    style: getTextTheme(context).labelLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(_getDurationBetweenDates(
                      timeEntry.startDate, timeEntry.endDate)),
                ],
              ),
              const Spacer(),
              Text(Jiffy.parseFromDateTime(timeEntry.startDate).yMMMEd),
            ],
          ),
        ),
      ),
    );
  }

  _getDurationBetweenDates(
    DateTime startDate,
    DateTime endDate,
  ) {
    final difference = endDate.difference(startDate);
    return "${difference.inHours}h ${difference.inMinutes.remainder(60)}m";
  }
}
