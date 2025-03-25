import 'package:app/blocs/tasks/tasks.bloc.dart';
import 'package:app/components/forms/ab_checkbox.dart';
import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/pages/tasks/task_detail.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/exntensions/date_time_extension.dart';
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
                const Spacer(),
                if (task.endDate != null && task.endDate!.isDayDate())
                  Padding(
                    padding: EdgeInsets.only(right: $constants.insets.xxs),
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
                        Text(Jiffy.parseFromDateTime(task.endDate!).MMMd),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
