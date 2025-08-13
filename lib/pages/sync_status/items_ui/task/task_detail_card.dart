import 'dart:convert';

import 'package:app/components/forms/ab_checkbox.dart';
import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/main.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:fleather/fleather.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:jiffy/jiffy.dart';

class TaskDetailCard extends StatefulWidget {
  final Map<String, dynamic>? taskData;
  final TaskEntity? taskEntity;
  const TaskDetailCard({super.key, this.taskData, this.taskEntity});

  @override
  State<TaskDetailCard> createState() => _TaskDetailCardState();
}

class _TaskDetailCardState extends State<TaskDetailCard> {
  @override
  Widget build(BuildContext context) {
    if (widget.taskData == null && widget.taskEntity == null) {
      return const SizedBox.shrink();
    }

    if (widget.taskData == null && widget.taskEntity != null) {
      return _buildTaskDetails(context, widget.taskEntity!);
    }

    final taskData = widget.taskData!;

    return FutureBuilder(
        future: TaskEntity.decrypt(taskData, encryptionService!),
        builder: (context, snapshot) {
          final task = snapshot.data ?? widget.taskEntity;
          return Column(
            children: [
              _buildTaskDetails(context, task!),
            ],
          );
        });
  }

  _buildTaskDetails(BuildContext context, TaskEntity task) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ABCheckbox(
              value: task.completed,
            ),
            SizedBox(
              width: $constants.insets.xs,
            ),
            Text(
              task.title,
              style: getTextTheme(context).bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
        Text("${context.t.sync.conflict_resolver.fields["description"]!} : "),
        if (task.description != null)
          FleatherEditor(
            controller: FleatherController(
              document: ParchmentDocument.fromJson(
                json.decode(task.description!),
              ),
            ),
            readOnly: true,
            expands: false,
            padding: EdgeInsets.zero,
          ),
        const Divider(),
        SizedBox(
          child: StaggeredGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: $constants.insets.xs,
            children: [
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 0.26,
                child: _buildTaskFieldItem(
                    context,
                    CupertinoIcons.calendar_today,
                    context.t.sync.conflict_resolver.fields["start_date"]!,
                    task.startDate != null
                        ? Jiffy.parseFromDateTime(task.startDate!)
                            .toLocal()
                            .yMMMEdjm
                        : null),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 0.26,
                child: _buildTaskFieldItem(
                    context,
                    CupertinoIcons.calendar_today,
                    context.t.sync.conflict_resolver.fields["end_date"]!,
                    task.endDate != null
                        ? Jiffy.parseFromDateTime(task.endDate!)
                            .toLocal()
                            .yMMMEdjm
                        : null),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 0.26,
                child: _buildTaskFieldItem(
                    context,
                    CupertinoIcons.flag,
                    context.t.sync.conflict_resolver.fields["priority"]!,
                    task.priority != null
                        ? context.t.tasks.priorities.values
                            .toList()[task.priority ?? 0]
                        : null),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 0.26,
                child: _buildTaskFieldItem(
                    context,
                    CupertinoIcons.alarm,
                    context.t.sync.conflict_resolver.fields["reminders_title"]!,
                    task.reminders != null
                        ? context.t.sync.conflict_resolver.fields["reminders"]!(
                            n: task.reminders?.length ?? 0)
                        : null),
              ),
            ],
          ),
        ),
        // priotity
      ],
    );
  }
}

_buildTaskFieldItem(
    BuildContext context, IconData icon, String fieldName, String? value) {
  return Row(
    children: [
      Icon(icon),
      SizedBox(
        width: $constants.insets.xs,
      ),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          fieldName,
          style: getTextTheme(context).bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        if (value != null)
          Text(
            value,
          )
        else
          Text(
            context.t.sync.conflict_resolver.fields["undefined"]!,
            style: getTextTheme(context).bodyMedium!.copyWith(
                  fontStyle: FontStyle.italic,
                  color: Colors.grey,
                ),
          ),
      ]),
    ],
  );
}
