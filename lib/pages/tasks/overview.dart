import 'dart:async';

import 'package:app/blocs/tasks/tasks.bloc.dart';
import 'package:app/components/buttons/task_item.dart';
import 'package:app/components/forms/search_bar.dart';
import 'package:app/components/widgets/elevated_container.dart';
import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/pages/tasks/add_task_modal.dart';
import 'package:app/pages/timer/timer_info.dart';
import 'package:app/pages/timer/timer_utils.dart';
import 'package:app/services/sync.service.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/exntensions/date_time_extension.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OverviewTasks extends StatefulWidget {
  const OverviewTasks({super.key});

  @override
  State<OverviewTasks> createState() => _OverviewTasksState();
}

class _OverviewTasksState extends State<OverviewTasks> {
  final TextEditingController _searchController = TextEditingController();
  List<TaskEntity> _filteredTasks = <TaskEntity>[];

  @override
  void initState() {
    SyncService.sync(context);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<TasksBloc, TasksState>(builder: (context, taskState) {
        final todayTasks = _todayTasks(taskState.tasks ?? []);
        final tomorrowTasks = _tomorrowTasks(taskState.tasks ?? []);
        final thisWeekTasks = _thisWeekTasks(taskState.tasks ?? []);
        return Padding(
          padding: isDesktop(context)
              ? EdgeInsets.only(
                  right: $constants.insets.sm,
                  left: $constants.insets.xs,
                  bottom: $constants.insets.sm,
                )
              : EdgeInsets.only(
                  right: $constants.insets.sm,
                  left: $constants.insets.sm,
                  bottom: $constants.insets.sm,
                ),
          child: RefreshIndicator(
            onRefresh: () {
              SyncService.sync(context);
              return Future.delayed(const Duration(seconds: 1));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (TimerUtils.isPomodoroRunning() ||
                    TimerUtils.isStopwatchRunning()) ...[
                  const TimerInfo(),
                  SizedBox(height: $constants.insets.xs),
                ],
                ElevatedContainer(
                  child: ABSearchBar(
                    controller: _searchController,
                    onChanged: (value) {
                      _searchTasks(value);
                    },
                    onClear: () {
                      _searchController.clear();
                      _filteredTasks = [];
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(height: $constants.insets.xs),
                if (_filteredTasks.isNotEmpty) ...[
                  Text(
                    context.t.search.results(
                      n: _filteredTasks.length,
                    ),
                    style: getTextTheme(context).bodyMedium!.copyWith(
                          color: getTheme(context).onSurface.lighten(50),
                        ),
                  ),
                  SizedBox(height: $constants.insets.xs),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        spacing: $constants.insets.xs,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: _filteredTasks
                            .map(
                              (task) => ElevatedContainer(
                                padding: EdgeInsets.symmetric(
                                  horizontal: $constants.insets.sm,
                                  vertical: $constants.insets.xs,
                                ),
                                child: TaskItem(task: task),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ],
                if (_filteredTasks.isEmpty) ...[
                  Expanded(
                    child: ElevatedContainer(
                      width: double.infinity,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: $constants.insets.xs,
                                left: $constants.insets.sm,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    context.t.times.today,
                                    style: getTextTheme(context)
                                        .titleMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        if (isDesktop(context)) {
                                          showDialog(
                                              context: context,
                                              builder: (context) => Dialog(
                                                      child: AddTaskModal(
                                                    endDate: DateTime.now().add(
                                                        const Duration(
                                                            hours: 1)),
                                                  )));
                                        } else {
                                          showModalBottomSheet(
                                              isScrollControlled: true,
                                              context: context,
                                              builder: (context) =>
                                                  AddTaskModal(
                                                    endDate: DateTime.now().add(
                                                        const Duration(
                                                            hours: 1)),
                                                  ));
                                        }
                                      },
                                      icon: const Icon(
                                        CupertinoIcons.plus,
                                        size: 20,
                                      ))
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: $constants.insets.sm,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                spacing: $constants.insets.xxs,
                                children: [
                                  if (todayTasks.isEmpty)
                                    Text(
                                      context.t.tasks.nothing_to_do,
                                      style: getTextTheme(context).labelSmall!,
                                    ),
                                  if (todayTasks.isNotEmpty) ...todayTasks,
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: $constants.insets.xs),
                  Expanded(
                    child: ElevatedContainer(
                      width: double.infinity,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: $constants.insets.xs,
                                left: $constants.insets.sm,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    context.t.times.tomorrow,
                                    style: getTextTheme(context)
                                        .titleMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      if (isDesktop(context)) {
                                        showDialog(
                                            context: context,
                                            builder: (context) => Dialog(
                                                    child: AddTaskModal(
                                                  endDate: DateTime.now().add(
                                                      const Duration(days: 1)),
                                                )));
                                      } else {
                                        showModalBottomSheet(
                                            isScrollControlled: true,
                                            context: context,
                                            builder: (context) => AddTaskModal(
                                                  endDate: DateTime.now().add(
                                                      const Duration(days: 1)),
                                                ));
                                      }
                                    },
                                    icon: const Icon(
                                      CupertinoIcons.plus,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: $constants.insets.sm,
                              ),
                              child: Column(
                                children: [
                                  if (tomorrowTasks.isEmpty)
                                    Padding(
                                      padding: EdgeInsets.only(
                                          bottom: $constants.insets.xxs),
                                      child: Text(
                                        context.t.tasks.day_off,
                                        style:
                                            getTextTheme(context).labelSmall!,
                                      ),
                                    ),
                                  if (tomorrowTasks.isNotEmpty)
                                    ...tomorrowTasks,
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: $constants.insets.xs),
                  Expanded(
                    child: ElevatedContainer(
                      width: double.infinity,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: $constants.insets.xs,
                                left: $constants.insets.sm,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    context.t.times.this_week,
                                    style: getTextTheme(context)
                                        .titleMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      if (isDesktop(context)) {
                                        showDialog(
                                            context: context,
                                            builder: (context) => Dialog(
                                                    child: AddTaskModal(
                                                  endDate: DateTime.now().add(
                                                      const Duration(days: 2)),
                                                )));
                                      } else {
                                        showModalBottomSheet(
                                            isScrollControlled: true,
                                            context: context,
                                            builder: (context) => AddTaskModal(
                                                  endDate: DateTime.now().add(
                                                      const Duration(days: 2)),
                                                ));
                                      }
                                    },
                                    icon: const Icon(
                                      CupertinoIcons.plus,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: $constants.insets.sm,
                              ),
                              child: Column(
                                children: [
                                  if (thisWeekTasks.isEmpty)
                                    Padding(
                                      padding: EdgeInsets.only(
                                          bottom: $constants.insets.xxs),
                                      child: Text(
                                        context.t.tasks.nothing_to_do,
                                        style:
                                            getTextTheme(context).labelSmall!,
                                      ),
                                    ),
                                  if (thisWeekTasks.isNotEmpty)
                                    ...thisWeekTasks,
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ]
              ],
            ),
          ),
        );
      }),
    );
  }

  List<TaskItem> _todayTasks(List<TaskEntity> tasks) {
    final List<TaskItem> widgets = [];
    for (final task in tasks) {
      if (task.completed != true &&
          task.endDate != null &&
          (task.endDate!.isToday() || task.endDate!.isBefore(DateTime.now()))) {
        widgets.add(TaskItem(task: task));
      }
    }
    return widgets;
  }

  List<TaskItem> _tomorrowTasks(List<TaskEntity> tasks) {
    final List<TaskItem> widgets = [];
    for (final task in tasks) {
      if (task.completed != true &&
          task.endDate != null &&
          task.endDate!.isTomorrow()) {
        widgets.add(TaskItem(task: task));
      }
    }
    return widgets;
  }

  List<TaskItem> _thisWeekTasks(List<TaskEntity> tasks) {
    final List<TaskItem> widgets = [];
    for (final task in tasks) {
      if (task.completed != true &&
          task.endDate != null &&
          task.endDate!.isThisWeek(
            includeToday: false,
            includeTomorrow: false,
          )) {
        widgets.add(TaskItem(task: task));
      }
    }
    return widgets;
  }

  void _searchTasks(String query) {
    final tasks = context.read<TasksBloc>().state.tasks ?? [];
    _filteredTasks = tasks
        .where((task) =>
            task.title.toLowerCase().contains(query.toLowerCase()) ||
            (task.description?.toLowerCase().contains(query.toLowerCase()) ??
                false))
        .toList();
    setState(() {});
  }
}
