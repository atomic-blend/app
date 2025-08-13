import 'package:app/blocs/tasks/tasks.bloc.dart';
import 'package:app/components/buttons/task_item.dart';
import 'package:app/components/forms/search_bar.dart';
import 'package:ab_shared/components/widgets/elevated_container.dart';
import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/pages/sync_status/conflict_card.dart';
import 'package:app/services/sync.service.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilteredTaskView extends StatefulWidget {
  final List<TaskEntity> Function(List<TaskEntity> tasks) filter;

  const FilteredTaskView({super.key, required this.filter});

  @override
  State<FilteredTaskView> createState() => _FilteredTaskViewState();
}

class _FilteredTaskViewState extends State<FilteredTaskView> {
  final TextEditingController _searchController = TextEditingController();
  List<TaskEntity> _filteredTasks = <TaskEntity>[];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<TasksBloc, TasksState>(builder: (context, taskState) {
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
                ConflictCard(
                  color: getTheme(context).error.lighten(55),
                  padding: EdgeInsets.only(
                    top: $constants.insets.xs,
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
                if (_filteredTasks.isEmpty)
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        if (widget.filter(taskState.tasks ?? []).isEmpty)
                          Text(
                            context.t.tasks.nothing_to_do,
                            style: getTextTheme(context).labelSmall!,
                          ),
                        if (widget.filter(taskState.tasks ?? []).isNotEmpty)
                          ...widget.filter(taskState.tasks ?? []).map(
                                (task) => Padding(
                                  padding: EdgeInsets.only(
                                    bottom: $constants.insets.xs,
                                  ),
                                  child: ElevatedContainer(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: $constants.insets.sm,
                                      vertical: $constants.insets.xs,
                                    ),
                                    child: TaskItem(
                                      task: task,
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        );
      }),
    );
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
