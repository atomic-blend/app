import 'dart:async';

import 'package:app/blocs/app/app.bloc.dart';
import 'package:app/blocs/tasks/tasks.bloc.dart';
import 'package:app/components/buttons/task_item.dart';
import 'package:app/components/forms/search_bar.dart';
import 'package:app/components/widgets/elevated_container.dart';
import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/pages/timer/task_timer.dart';
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
import 'package:percent_indicator/circular_percent_indicator.dart';

class OverviewTasks extends StatefulWidget {
  const OverviewTasks({super.key});

  @override
  State<OverviewTasks> createState() => _OverviewTasksState();
}

class _OverviewTasksState extends State<OverviewTasks> {
  final TextEditingController _searchController = TextEditingController();

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
                      controller: _searchController, onSubmitted: (value) {}),
                ),
                SizedBox(height: $constants.insets.xs),
                Expanded(
                  child: ElevatedContainer(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: $constants.insets.sm,
                      vertical: $constants.insets.xs,
                    ),
                    child: SingleChildScrollView(
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
                            Text(
                              context.t.tasks.nothing_to_do,
                              style: getTextTheme(context).labelSmall!,
                            ),
                          if (todayTasks.isNotEmpty) ...todayTasks,
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: $constants.insets.xs),
                Expanded(
                  child: ElevatedContainer(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: $constants.insets.sm,
                      vertical: $constants.insets.xs,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.t.times.tomorrow,
                            style: getTextTheme(context).titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          if (tomorrowTasks.isEmpty)
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: $constants.insets.xxs),
                              child: Text(
                                context.t.tasks.day_off,
                                style: getTextTheme(context).labelSmall!,
                              ),
                            ),
                          if (tomorrowTasks.isNotEmpty) ...tomorrowTasks,
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: $constants.insets.xs),
                Expanded(
                  child: ElevatedContainer(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: $constants.insets.sm,
                      vertical: $constants.insets.xs,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.t.times.this_week,
                            style: getTextTheme(context).titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          if (thisWeekTasks.isEmpty)
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: $constants.insets.xxs),
                              child: Text(
                                context.t.tasks.nothing_to_do,
                                style: getTextTheme(context).labelSmall!,
                              ),
                            ),
                          if (thisWeekTasks.isNotEmpty) ...thisWeekTasks,
                        ],
                      ),
                    ),
                  ),
                ),
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
}
