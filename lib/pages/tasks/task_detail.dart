import 'package:app/blocs/tag/tag.bloc.dart';
import 'package:app/blocs/tasks/tasks.bloc.dart';
import 'package:app/components/buttons/icon_text_pill.dart';
import 'package:app/components/forms/app_text_form_field.dart';
import 'package:app/entities/tag/tag.entity.dart';
import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/components/forms/task_date_picker_modal/task_date_picker_modal.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/exntensions/date_time_extension.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/cupertino.dart';
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
  DateTime? _endDate;
  DateTime? _startDate;
  List<DateTime>? _reminders;

  @override
  void initState() {
    _titleController.text = widget.task.title;
    _endDate = widget.task.endDate;
    _startDate = widget.task.startDate;
    _reminders = widget.task.reminders;
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
      body: BlocBuilder<TagBloc, TagState>(builder: (context, tagState) {
        // get the task tags from the tagState
        List<TagEntity> taskTags = [];
        for (var tag in (tagState.tags ?? [])) {
          if (widget.task.tags != null && widget.task.tags!.contains(tag.id)) {
            taskTags.add(tag.name);
          }
        }
        return Column(
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
                                endDate: _endDate,
                                startDate: _startDate,
                                reminders: _reminders,
                                onRemindersChanged: (newRem) {
                                  setState(() {
                                    _reminders = newRem;
                                  });
                                },
                                onEndDateChanged: (date) {
                                  setState(() {
                                    _endDate = date;
                                  });
                                },
                                onStartDateChanged: (date) {
                                  setState(() {
                                    _startDate = date;
                                  });
                                },
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                              ));
                      widget.task.endDate = _endDate;
                      widget.task.startDate = _startDate;
                      widget.task.reminders = _reminders;
                      if (!context.mounted) return;
                      context.read<TasksBloc>().add(EditTask(widget.task));
                    },
                    child: Container(
                      child: _endDate != null && _startDate == null
                          ? Text(
                              _endDate?.isDayDate() == true
                                  ? Jiffy.parseFromDateTime(_endDate!)
                                      .toLocal()
                                      .yMMMEd
                                  : Jiffy.parseFromDateTime(_endDate!)
                                      .toLocal()
                                      .yMMMMdjm,
                              style:
                                  getTextTheme(context).bodyMedium!.copyWith())
                          : _startDate != null
                              ? Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      Jiffy.parseFromDateTime(_endDate!)
                                          .toLocal()
                                          .yMMMEd,
                                    ),
                                    Text(
                                        "${context.t.tasks.from.toLowerCase()} ${Jiffy.parseFromDateTime(_startDate!).toLocal().Hm} ${context.t.tasks.to.toLowerCase()} ${Jiffy.parseFromDateTime(_endDate!).toLocal().Hm}")
                                  ],
                                )
                              : Text(
                                  context.t.tasks.due_dates.no_due_date,
                                  style: getTextTheme(context)
                                      .titleSmall!
                                      .copyWith(),
                                ),
                    ),
                  ),
                  Container(
                    width: 50,
                  ),
                ],
              ),
            ),
            AppTextFormField(
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
            SizedBox(
              height: $constants.insets.xs,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: $constants.insets.xs + $constants.insets.xxs),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ...taskTags.map((tag) => IconTextPill(title: tag.name)),
                      if (taskTags.isEmpty)
                        IconTextPill(title: context.t.tags.no_tags)
                    ],
                  )
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
