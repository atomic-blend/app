import 'dart:convert';

import 'package:app/components/forms/ab_checkbox.dart';
import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/services/user.service.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:fleather/fleather.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        Divider(),
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  const Icon(CupertinoIcons.calendar),
                  SizedBox(
                    width: $constants.insets.xs,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context
                              .t.sync.conflict_resolver.fields["start_date"]!,
                          style: getTextTheme(context).bodyMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        if (task.startDate != null)
                          Text(
                            Jiffy.parseFromDateTime(task.startDate!).yMMMEdjm,
                          )
                        else
                          Text(
                            context
                                .t.sync.conflict_resolver.fields["undefined"]!,
                            style: getTextTheme(context).bodyMedium!.copyWith(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.grey,
                                ),
                          ),
                      ]),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  const Icon(
                    CupertinoIcons.calendar_today,
                  ),
                  SizedBox(
                    width: $constants.insets.xs,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.t.sync.conflict_resolver.fields["end_date"]!,
                        style: getTextTheme(context).bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      if (task.endDate != null)
                        Text(
                          Jiffy.parseFromDateTime(task.endDate!).yMMMEdjm,
                        )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: $constants.insets.xs,
        ),
        // priotity
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  const Icon(CupertinoIcons.flag),
                  SizedBox(
                    width: $constants.insets.xs,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.t.sync.conflict_resolver.fields["priority"]!,
                          style: getTextTheme(context).bodyMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        if (task.priority != null)
                          Text(
                            context.t.tasks.priorities.values
                                .toList()[task.priority ?? 0],
                          )
                        else
                          Text(
                            context
                                .t.sync.conflict_resolver.fields["undefined"]!,
                            style: getTextTheme(context).bodyMedium!.copyWith(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.grey,
                                ),
                          ),
                      ]),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  const Icon(CupertinoIcons.alarm),
                  SizedBox(
                    width: $constants.insets.xs,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.t.sync.conflict_resolver
                              .fields["reminders_title"]!,
                          style: getTextTheme(context).bodyMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        if (task.reminders != null)
                          Text(
                            context
                                .t.sync.conflict_resolver.fields["reminders"]!(
                              n: task.reminders?.length ?? 0,
                            ),
                          )
                        else
                          Text(
                            context
                                .t.sync.conflict_resolver.fields["undefined"]!,
                            style: getTextTheme(context).bodyMedium!.copyWith(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.grey,
                                ),
                          ),
                      ]),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
