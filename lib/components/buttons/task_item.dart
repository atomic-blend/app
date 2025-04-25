import 'package:app/blocs/tasks/tasks.bloc.dart';
import 'package:app/components/forms/ab_checkbox.dart';
import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/pages/tasks/task_detail.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/exntensions/date_time_extension.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:jiffy/jiffy.dart';

class TaskItem extends StatelessWidget {
  final TaskEntity task;
  const TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => TaskDetail(task: task)));
      },
      child: Slidable(
        key: ValueKey(task.id),
        endActionPane: ActionPane(motion: const ScrollMotion(), children: [
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
        ]),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: $constants.insets.xxs),
          child: GestureDetector(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                    ),
                    if (task.description != null) Text(task.description!)
                  ],
                ),
                if (task.tags != null && task.tags!.isNotEmpty)
                  Container(
                    padding: EdgeInsets.only(left: $constants.insets.sm),
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
                // day task
                if (task.startDate == null &&
                    task.endDate != null &&
                    task.endDate!.isDayDate())
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: $constants.insets.xs,
                    ),
                    decoration: BoxDecoration(
                      color: task.endDate?.isBefore(DateTime.now()) == true
                          ? getTheme(context).error.withValues(alpha: 0.2)
                          : null,
                      borderRadius: BorderRadius.circular(
                        $constants.corners.sm,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          CupertinoIcons.calendar,
                          size: 12,
                        ),
                        SizedBox(
                          width: $constants.insets.xxs,
                        ),
                        Text(Jiffy.parseFromDateTime(task.endDate!)
                            .toLocal()
                            .MMMMd),
                      ],
                    ),
                  ),
                // time task
                if (task.startDate == null &&
                    task.endDate != null &&
                    !task.endDate!.isDayDate())
                  Container(
                    width: getSize(context).width * 0.3,
                    padding: EdgeInsets.symmetric(
                      horizontal: $constants.insets.xs,
                    ),
                    decoration: BoxDecoration(
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
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              CupertinoIcons.time,
                              size: 12,
                            ),
                            SizedBox(
                              width: $constants.insets.xxs,
                            ),
                            Flexible(
                              child: Text(task.endDate
                                          ?.isBefore(DateTime.now()) ==
                                      true
                                  ? "${Jiffy.parseFromDateTime(task.endDate!).toLocal().MMMMd}, ${Jiffy.parseFromDateTime(task.endDate!).toLocal().Hm}"
                                  : Jiffy.parseFromDateTime(task.endDate!)
                                      .toLocal()
                                      .jm),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                // precise time task (end and start define, like a calendar event)
                if (task.startDate != null && task.endDate != null)
                  Container(
                    width: getSize(context).width * 0.3,
                    padding: EdgeInsets.symmetric(
                      horizontal: $constants.insets.xs,
                    ),
                    decoration: BoxDecoration(
                      color: task.endDate?.isBefore(DateTime.now()) == true
                          ? getTheme(context).error.withValues(alpha: 0.2)
                          : null,
                      borderRadius: BorderRadius.circular(
                        $constants.corners.sm,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          CupertinoIcons.alarm,
                          size: 16,
                        ),
                        SizedBox(
                          width: $constants.insets.xs,
                        ),
                        Flexible(
                          child: Text(
                            task.endDate?.isBefore(DateTime.now()) == true
                                ? "${Jiffy.parseFromDateTime(task.startDate!).toLocal().MMMMd}, ${Jiffy.parseFromDateTime(task.startDate!).toLocal().Hm} - ${Jiffy.parseFromDateTime(task.endDate!).toLocal().Hm}"
                                : "${Jiffy.parseFromDateTime(task.startDate!).toLocal().Hm} - ${Jiffy.parseFromDateTime(task.endDate!).toLocal().Hm}",
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
