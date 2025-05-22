import 'package:app/blocs/tasks/tasks.bloc.dart';
import 'package:app/components/buttons/task_item.dart';
import 'package:app/components/forms/search_bar.dart';
import 'package:app/components/widgets/elevated_container.dart';
import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/services/sync.service.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilteredTaskView extends StatefulWidget {
  final List<TaskItem> Function(List<TaskEntity> tasks) filter;

  const FilteredTaskView({super.key, required this.filter});

  @override
  State<FilteredTaskView> createState() => _FilteredTaskViewState();
}

class _FilteredTaskViewState extends State<FilteredTaskView> {
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
        return Padding(
          padding: isDesktop(context)
              ? EdgeInsets.only(
                  right: $constants.insets.md,
                  left: $constants.insets.sm,
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
              children: [
                ElevatedContainer(
                  child: ABSearchBar(
                      controller: _searchController, onSubmitted: (value) {}),
                ),
                Expanded(
                  child: ElevatedContainer(
                    padding: EdgeInsets.symmetric(
                      horizontal: $constants.insets.sm,
                      vertical: $constants.insets.sm,
                    ),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        if (widget.filter(taskState.tasks ?? []).isEmpty)
                          Text(
                            context.t.tasks.nothing_to_do,
                            style: getTextTheme(context).labelSmall!,
                          ),
                        if (widget.filter(taskState.tasks ?? []).isNotEmpty)
                          ...widget.filter(taskState.tasks ?? []),
                      ],
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
}
