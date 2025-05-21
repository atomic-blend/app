import 'package:app/blocs/tasks/tasks.bloc.dart';
import 'package:app/components/buttons/task_item.dart';
import 'package:app/components/forms/search_bar.dart';
import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/services/sync.service.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/exntensions/date_time_extension.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<TasksBloc, TasksState>(builder: (context, taskState) {
        final todayTasks = _todayTasks(taskState.tasks ?? []);
        final tomorrowTasks = _tomorrowTasks(taskState.tasks ?? []);
        final thisWeekTasks = _thisWeekTasks(taskState.tasks ?? []);
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: $constants.insets.xs),
          child: RefreshIndicator(
            onRefresh: () {
              SyncService.sync(context);
              return Future.delayed(const Duration(seconds: 1));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ABSearchBar(
                    controller: _searchController, onSubmitted: (value) {}),
                SizedBox(height: $constants.insets.xs),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: getTheme(context).surfaceContainer,
                      borderRadius: BorderRadius.circular($constants.insets.sm),
                    ),
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
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: getTheme(context).surfaceContainer,
                      borderRadius: BorderRadius.circular($constants.insets.sm),
                    ),
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
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: getTheme(context).surfaceContainer,
                      borderRadius: BorderRadius.circular($constants.insets.sm),
                    ),
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
                SizedBox(height: $constants.insets.xs),
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
