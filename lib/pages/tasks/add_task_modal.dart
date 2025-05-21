import 'package:app/blocs/auth/auth.bloc.dart';
import 'package:app/blocs/tasks/tasks.bloc.dart';
import 'package:app/components/dialogs/priority_picker.dart';
import 'package:app/components/forms/app_text_form_field.dart';
import 'package:app/components/forms/task_date_picker_modal/task_date_picker_modal.dart';
import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/exntensions/date_time_extension.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:app/utils/toast_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTaskModal extends StatefulWidget {
  final DateTime? endDate;
  final int? priority;

  const AddTaskModal({super.key, this.endDate, this.priority});

  @override
  State<AddTaskModal> createState() => _AddTaskModalState();
}

class _AddTaskModalState extends State<AddTaskModal> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  DateTime? _endDate;
  DateTime? _startDate;
  List<DateTime>? _reminders;
  int? _priority;

  @override
  void initState() {
    if (widget.endDate != null) {
      _endDate = widget.endDate;
    }
    if (widget.priority != null) {
      _priority = widget.priority;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, authState) {
      return Container(
        width:
            isDesktop(context) ? getSize(context).width * 0.7 : double.infinity,
        padding: EdgeInsets.fromLTRB(
          isDesktop(context) ? $constants.insets.xxs : 0,
          isDesktop(context) ? $constants.insets.xxs : 0,
          isDesktop(context) ? $constants.insets.xxs : 0,
          MediaQuery.viewInsetsOf(context).bottom + $constants.insets.xs,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular($constants.corners.md),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppTextFormField(
              backgroundColor: Colors.transparent,
              controller: _titleController,
              hintText: context.t.tasks.add_task_modal.task_title,
              autofocus: true,
              height: 50,
            ),
            AppTextFormField(
              backgroundColor: Colors.transparent,
              controller: _descriptionController,
              hintText: context.t.tasks.add_task_modal.description,
              autofocus: true,
              height: isDesktop(context) ? 50 : 20,
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: $constants.insets.xs + 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: $constants.insets.xs, vertical: 2),
                        decoration: BoxDecoration(
                          color: _endDate != null
                              ? getTheme(context).primaryContainer
                              : getTheme(context).surfaceContainer,
                          borderRadius:
                              BorderRadius.circular($constants.corners.full),
                        ),
                        child: GestureDetector(
                            onTap: () async {
                              var selector = TaskDatePickerModal(
                                onStartDateChanged: (date) {
                                  setState(() {
                                    _startDate = date;
                                  });
                                },
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
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                              );
                              if (isDesktop(context)) {
                                await showDialog(
                                  context: context,
                                  builder: (context) => Dialog(
                                    child: selector,
                                  ),
                                );
                              } else {
                                await showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) => selector);
                              }
                            },
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 25,
                                  height: 25,
                                  child: Icon(CupertinoIcons.calendar,
                                      size: 18,
                                      color: _endDate != null
                                          ? getTheme(context).primary
                                          : null),
                                ),
                                if (_endDate != null || isDesktop(context))
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: $constants.insets.xxs),
                                    child: Text(
                                      _endDate != null
                                          ? _endDate!.formatDueDate(context)
                                          : context
                                              .t.tasks.add_task_modal.dates,
                                      style: getTextTheme(context)
                                          .bodySmall!
                                          .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: _endDate != null
                                                ? getTheme(context).primary
                                                : null,
                                          ),
                                    ),
                                  ),
                              ],
                            )),
                      ),
                      SizedBox(
                        width: $constants.insets.xs,
                      ),
                      GestureDetector(
                        onTap: () async {
                          var selector = PriorityPicker(
                            displayCard: true,
                            priority: _priority,
                            onChanged: (value) {
                              if (value == 0) {
                                _priority = null;
                              } else {
                                _priority = value;
                              }
                            },
                          );
                          if (isDesktop(context)) {
                            await showDialog(
                              context: context,
                              builder: (context) => Dialog(
                                backgroundColor: getTheme(context).surface,
                                child: selector,
                              ),
                            );
                          } else {
                            await showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (context) => Container(
                                decoration: BoxDecoration(
                                  color: getTheme(context).surface,
                                  borderRadius: BorderRadius.only(
                                    topLeft:
                                        Radius.circular($constants.corners.md),
                                    topRight:
                                        Radius.circular($constants.corners.md),
                                  ),
                                ),
                                width: double.infinity,
                                height: getSize(context).height * 0.5,
                                padding: EdgeInsets.all($constants.insets.xs),
                                child: selector,
                              ),
                            );
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: $constants.insets.xs + 4,
                              vertical: 2),
                          decoration: BoxDecoration(
                            color: _priority != null
                                ? (_priority == 1
                                        ? Colors.blueAccent
                                        : _priority == 2
                                            ? Colors.deepOrangeAccent
                                            : Colors.red)
                                    .withValues(
                                    alpha: 0.2,
                                  )
                                : getTheme(context).surfaceContainer,
                            borderRadius:
                                BorderRadius.circular($constants.corners.full),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 25,
                                height: 25,
                                child: Icon(CupertinoIcons.flag,
                                    size: 18,
                                    color: _priority != null
                                        ? _priority == 1
                                            ? Colors.blueAccent
                                            : _priority == 2
                                                ? Colors.deepOrangeAccent
                                                : Colors.red
                                        : null),
                              ),
                              if (_priority != null || isDesktop(context))
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: $constants.insets.xxs),
                                  child: Text(
                                    _priority != null
                                        ? context.t.tasks.priorities.values
                                            .toList()[_priority!]
                                        : context.t.tasks.priority,
                                    style: getTextTheme(context)
                                        .bodySmall!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: _priority != null
                                              ? _priority == 1
                                                  ? Colors.blueAccent
                                                  : _priority == 2
                                                      ? Colors.deepOrangeAccent
                                                      : Colors.red
                                              : null,
                                        ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  GestureDetector(
                      onTap: () {
                        if (_titleController.text.isEmpty) {
                          ToastHelper.showError(
                              context: context,
                              title:
                                  context.t.tasks.add_task_modal.title_required,
                              description: context.t.tasks.add_task_modal
                                  .title_required_description);
                          return;
                        }
                        final task = TaskEntity(
                            title: _titleController.text,
                            startDate: _startDate,
                            endDate: _endDate,
                            reminders: _reminders,
                            completed: false,
                            priority: _priority,
                            createdAt: DateTime.now(),
                            updatedAt: DateTime.now());
                        if (_descriptionController.text.isNotEmpty) {
                          task.description = _descriptionController.text;
                        }
                        context
                            .read<TasksBloc>()
                            .add(AddTask(task, authState.user!));
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        CupertinoIcons.arrow_up_circle_fill,
                        color: getTheme(context).primary,
                      ))
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
