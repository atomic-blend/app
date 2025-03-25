import 'package:app/blocs/tasks/tasks.bloc.dart';
import 'package:app/components/forms/app_text_form_field.dart';
import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/components/forms/task_date_picker_modal.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiffy/jiffy.dart';

import '../../components/forms/ab_checkbox.dart';

class TaskDetail extends StatefulWidget {
  final TaskEntity task;
  const TaskDetail({super.key, required this.task});

  @override
  State<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  final TextEditingController _titleController = TextEditingController();
  DateTime? _dueDate;

  @override
  void initState() {
    _titleController.text = widget.task.title;
    _dueDate = widget.task.endDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.t.tasks.task_details,
          style: getTextTheme(context).bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      backgroundColor: getTheme(context).surface,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: $constants.insets.sm),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ABCheckbox(
                    value: widget.task.completed, onChanged: (newValue) {}),
                GestureDetector(
                  onTap: () async {
                    await showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) => TaskDatePickerModal(
                              onDateChanged: (date) {
                                setState(() {
                                  _dueDate = date;
                                });
                              },
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            ));
                    widget.task.endDate = _dueDate;
                    if (!context.mounted) return;
                    context.read<TasksBloc>().add(EditTask(widget.task));
                  },
                  child: Container(
                    child: _dueDate != null
                        ? Text(Jiffy.parseFromDateTime(_dueDate!).yMMMMd,
                            style: getTextTheme(context).bodyMedium!.copyWith())
                        : Text(
                            context.t.tasks.due_dates.no_due_date,
                            style: getTextTheme(context).titleSmall!.copyWith(),
                          ),
                  ),
                ),
                Container(
                  width: 50,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: $constants.insets.xxs),
            child: Column(
              children: [
                SizedBox(
                  child: AppTextFormField(
                    backgroundColor: Colors.transparent,
                    controller: _titleController,
                    hintText: context.t.tasks.add_task_modal.task_title,
                    height: 50,
                    textStyle: getTextTheme(context).titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                    onSubmitted: () {
                      widget.task.title = _titleController.text;
                      if (!context.mounted) return;
                      context.read<TasksBloc>().add(EditTask(widget.task));
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
