import 'package:app/blocs/tasks/tasks.bloc.dart';
import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/pages/tasks/task_detail.dart';
import 'package:app/utils/constants.dart';
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
        child: GestureDetector(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Checkbox(
                  value: task.completed ?? false,
                  onChanged: (value) {
                    task.completed = value!;
                    context.read<TasksBloc>().add(EditTask(task));
                  }),
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
              if (task.startDate != null)
                Padding(
                  padding: EdgeInsets.only(right: $constants.insets.md),
                  child: Text(Jiffy.parseFromDateTime(task.startDate!).MMMd),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
