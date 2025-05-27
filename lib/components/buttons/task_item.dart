import 'package:app/blocs/tasks/tasks.bloc.dart';
import 'package:app/components/forms/ab_checkbox.dart';
import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/pages/tasks/task_detail.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/exntensions/date_time_extension.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:jiffy/jiffy.dart';

class TaskItem extends StatelessWidget {
  final TaskEntity task;
  final VoidCallback? onTap;
  final bool? collapsed;
  final bool? slideable;
  final bool? checkable;

  const TaskItem(
      {super.key,
      required this.task,
      this.collapsed,
      this.slideable,
      this.onTap,
      this.checkable});

  @override
  Widget build(BuildContext context) {
    return Draggable<TaskEntity>(
      data: task,
      feedback: buildContent(context),
      childWhenDragging: Container(),
      child: buildContent(context),
    );
  }

  Widget buildContent(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!();
          return;
        }
        if (isDesktop(context)) {
          showDialog(
            context: context,
            builder: (context) => Dialog(
              backgroundColor: Colors.transparent,
              child: TaskDetail(
                task: task,
              ),
            ),
          );
        } else {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => TaskDetail(
                task: task,
              ),
            ),
          );
        }
      },
      child: Slidable(
        enabled: slideable ?? true,
        key: ValueKey(task.id),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            Theme(
              data: Theme.of(context).copyWith(
                  outlinedButtonTheme: const OutlinedButtonThemeData(
                style: ButtonStyle(
                    iconColor: WidgetStatePropertyAll(Colors.white),
                    iconSize: WidgetStatePropertyAll(25)),
              )),
              child: SlidableAction(
                onPressed: (context) {
                  context.read<TasksBloc>().add(DeleteTask(task));
                },
                backgroundColor: Colors.red,
                icon: LineAwesome.trash_alt,
              ),
            )
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: Theme(
            data: Theme.of(context),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: $constants.insets.xxs),
              child: GestureDetector(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (checkable != false)
                      ABCheckbox(
                          value: task.completed ?? false,
                          onChanged: (value) {
                            task.completed = value!;
                            context.read<TasksBloc>().add(EditTask(task));
                          }),
                    SizedBox(
                      width: $constants.insets.xs,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          task.title,
                          style:
                              getTextTheme(context).headlineSmall!.copyWith(),
                        ),
                        if (collapsed == true) ...[
                          SizedBox(
                            height: $constants.insets.xxs,
                          ),
                          ...buildTaskDateInfos(context),
                        ]
                      ],
                    ),
                    if (collapsed != true) ...[
                      if (task.tags != null && task.tags!.isNotEmpty)
                        Container(
                          padding: EdgeInsets.only(
                            left: $constants.insets.sm,
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: $constants.insets.sm),
                                decoration: BoxDecoration(
                                  color: task.tags!.first.color != null
                                      ? hexToColor(task.tags!.first.color!)
                                          .withValues(alpha: 0.2)
                                      : getTheme(context).primary,
                                  borderRadius: BorderRadius.circular(
                                    $constants.corners.sm,
                                  ),
                                ),
                                child: Text(task.tags!.first.name),
                              ),
                              if (task.tags!.length > 1) ...[
                                SizedBox(
                                  width: $constants.insets.xs,
                                ),
                                Text(
                                  "+${task.tags!.length - 1}",
                                  style: getTextTheme(context)
                                      .bodyMedium!
                                      .copyWith(color: Colors.grey),
                                )
                              ]
                            ],
                          ),
                        ),
                      const Spacer(),
                      if (task.priority != null && task.priority! > 0) ...[
                        Container(
                          padding: EdgeInsets.only(left: $constants.insets.sm),
                          child: Icon(
                            CupertinoIcons.flag_fill,
                            size: 16,
                            color: task.priority == null || task.priority == 0
                                ? Colors.grey
                                : task.priority == 1
                                    ? Colors.blueAccent
                                    : task.priority == 2
                                        ? Colors.deepOrangeAccent
                                        : Colors.red,
                          ),
                        ),
                        SizedBox(
                          width: $constants.insets.xs,
                        ),
                      ],
                      ...buildTaskDateInfos(context),
                    ]
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> buildTaskDateInfos(BuildContext context) {
    return [
      // day task
      if (task.startDate == null &&
          task.endDate != null &&
          task.endDate!.isDayDate())
        Container(
          padding: collapsed == true
              ? null
              : EdgeInsets.symmetric(
                  horizontal: $constants.insets.xs,
                ),
          decoration: collapsed == true
              ? null
              : BoxDecoration(
                  color: task.endDate?.isBefore(DateTime.now()) == true
                      ? getTheme(context).error.withValues(alpha: 0.2)
                      : null,
                  borderRadius: BorderRadius.circular(
                    $constants.corners.sm,
                  ),
                ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize:
                collapsed == true ? MainAxisSize.max : MainAxisSize.min,
            children: [
              const Icon(
                CupertinoIcons.calendar,
                size: 12,
              ),
              SizedBox(
                width: $constants.insets.xxs,
              ),
              Text(Jiffy.parseFromDateTime(task.endDate!).toLocal().MMMMd),
            ],
          ),
        ),
      // time task
      if (task.startDate == null &&
          task.endDate != null &&
          !task.endDate!.isDayDate())
        Container(
          padding: collapsed == true
              ? null
              : EdgeInsets.symmetric(
                  horizontal: $constants.insets.xs,
                ),
          decoration: collapsed == true
              ? null
              : BoxDecoration(
                  color: task.endDate?.isBefore(DateTime.now()) == true
                      ? getTheme(context).error.withValues(alpha: 0.2)
                      : null,
                  borderRadius: BorderRadius.circular(
                    $constants.corners.sm,
                  ),
                ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize:
                    collapsed == true ? MainAxisSize.max : MainAxisSize.min,
                children: [
                  const Icon(
                    CupertinoIcons.time,
                    size: 12,
                  ),
                  SizedBox(
                    width: $constants.insets.xxs,
                  ),
                  AutoSizeText(
                    maxLines: 1,
                    "${Jiffy.parseFromDateTime(task.endDate!).toLocal().MMMMd}, ${Jiffy.parseFromDateTime(task.endDate!).toLocal().Hm}",
                    style: getTextTheme(context).bodyMedium,
                  ),
                ],
              ),
            ],
          ),
        ),
      // precise time task (end and start define, like a calendar event)
      if (task.startDate != null && task.endDate != null)
        Container(
          padding: collapsed == true
              ? null
              : EdgeInsets.symmetric(
                  horizontal: $constants.insets.xs,
                ),
          decoration: collapsed == true
              ? null
              : BoxDecoration(
                  color: task.endDate?.isBefore(DateTime.now()) == true
                      ? getTheme(context).error.withValues(alpha: 0.2)
                      : null,
                  borderRadius: BorderRadius.circular(
                    $constants.corners.sm,
                  ),
                ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize:
                collapsed == true ? MainAxisSize.max : MainAxisSize.min,
            children: [
              if (collapsed != true) ...[
                const Icon(
                  CupertinoIcons.alarm,
                  size: 16,
                ),
                SizedBox(
                  width: $constants.insets.xs,
                ),
              ],
              Flexible(
                child: Text(
                  task.endDate?.isBefore(DateTime.now()) == true
                      ? "${Jiffy.parseFromDateTime(task.startDate!).toLocal().MMMMd}, ${Jiffy.parseFromDateTime(task.startDate!).toLocal().Hm} - ${Jiffy.parseFromDateTime(task.endDate!).toLocal().Hm}"
                      : "${Jiffy.parseFromDateTime(task.startDate!).toLocal().Hm} - ${Jiffy.parseFromDateTime(task.endDate!).toLocal().Hm}",
                  softWrap: true,
                  style: collapsed == true
                      ? getTextTheme(context).bodySmall!.copyWith(
                            color: getTheme(context).error,
                            fontWeight: FontWeight.bold,
                          )
                      : null,
                ),
              ),
            ],
          ),
        )
    ];
  }
}
