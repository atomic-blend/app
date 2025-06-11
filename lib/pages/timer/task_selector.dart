import 'package:app/blocs/tasks/tasks.bloc.dart';
import 'package:app/components/buttons/task_item.dart';
import 'package:app/components/forms/search_bar.dart';
import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskSelector extends StatefulWidget {
  final Function(TaskEntity?)? onTaskSelected;
  const TaskSelector({super.key, this.onTaskSelected});

  @override
  State<TaskSelector> createState() => _TaskSelectorState();
}

class TasksEntity {}

class _TaskSelectorState extends State<TaskSelector> {
  final TextEditingController _searchController = TextEditingController();

  List<TaskEntity> _filteredTasks = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all($constants.insets.sm),
      decoration: BoxDecoration(
        color: getTheme(context).surface,
        borderRadius: BorderRadius.circular($constants.corners.md),
      ),
      height: getSize(context).height * 0.6,
      width: double.infinity,
      child: BlocBuilder<TasksBloc, TasksState>(builder: (context, taskState) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _filterTasks(_searchController.text);
        });
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: ABSearchBar(
                    controller: _searchController,
                    onSubmitted: (value) {},
                  ),
                ),
                SizedBox(
                  width: $constants.insets.xs,
                ),
                TextButton(
                  onPressed: () {
                    _searchController.clear();
                    widget.onTaskSelected?.call(null);
                    Navigator.pop(context, null);
                  },
                  child: Text(
                    context.t.actions.clear,
                    style: getTextTheme(context).bodyMedium!.copyWith(
                          color: getTheme(context).primary,
                        ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: $constants.insets.xs,
            ),
            ..._filteredTasks.map(
              (task) => Padding(
                padding: EdgeInsets.only(
                  bottom: $constants.insets.xs,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: getTheme(context).surfaceContainer,
                    borderRadius: BorderRadius.circular($constants.corners.md),
                  ),
                  padding: EdgeInsets.all($constants.insets.xs),
                  child: TaskItem(
                    task: task,
                    checkable: false,
                    onTap: () {
                      widget.onTaskSelected?.call(task);
                      Navigator.pop(context, task);
                    },
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  _filterTasks(String query) {
    final tasksBloc = context.read<TasksBloc>();
    final tasks = tasksBloc.state.tasks ?? [];
    setState(() {
      _filteredTasks = tasks
          .where((task) =>
              task.title.toLowerCase().contains(query.toLowerCase()) &&
              task.completed != true)
          .toList();
    });
  }
}
