import 'dart:convert';

import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/services/user.service.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:fleather/fleather.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class TaskCard extends StatefulWidget {
  final Map<String, dynamic>? taskData;
  final TaskEntity? taskEntity;
  const TaskCard({super.key, this.taskData, this.taskEntity});

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
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
        Text(
          task.title,
          style: getTextTheme(context).bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Text("${context.t.sync.conflict_resolver.notes} : "),
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
        Text.rich(TextSpan(
            text: "${context.t.sync.conflict_resolver.start_date} :",
            children: [
              if (task.startDate != null)
                TextSpan(
                  text: Jiffy.parseFromDateTime(task.startDate!).yMMMEdjm,
                )
            ])),
        Text.rich(
          TextSpan(
              text: "${context.t.sync.conflict_resolver.end_date} :",
              children: [
                if (task.endDate != null)
                  TextSpan(
                    text: " ${Jiffy.parseFromDateTime(task.endDate!).yMMMEdjm}",
                  )
              ]),
          style: getTextTheme(context).bodyMedium,
        ),
        // priotity
        Text.rich(
          TextSpan(
            text: "${context.t.sync.conflict_resolver.priority} :",
          ),
        ),
      ],
    );
  }
}
