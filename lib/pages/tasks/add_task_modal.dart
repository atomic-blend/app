import 'package:app/blocs/auth/auth.bloc.dart';
import 'package:app/blocs/tasks/tasks.bloc.dart';
import 'package:app/components/forms/app_text_form_field.dart';
import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/components/forms/task_date_picker_modal/task_date_picker_modal.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/exntensions/date_time_extension.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:app/utils/toast_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTaskModal extends StatefulWidget {
  const AddTaskModal({super.key});

  @override
  State<AddTaskModal> createState() => _AddTaskModalState();
}

class _AddTaskModalState extends State<AddTaskModal> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  DateTime? _dueDate;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, authState) {
      return Container(
        width: double.infinity,
        height: MediaQuery.of(context).viewInsets.bottom +
            getSize(context).height * 0.12,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular($constants.corners.xs),
            topRight: Radius.circular($constants.corners.xs),
          ),
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
              height: 20,
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
                            horizontal: $constants.insets.xs + 4, vertical: 2),
                        decoration: BoxDecoration(
                          color: _dueDate != null
                              ? getTheme(context).primaryContainer
                              : null,
                          borderRadius:
                              BorderRadius.circular($constants.corners.full),
                        ),
                        child: GestureDetector(
                            onTap: () async {
                              await showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (context) => TaskDatePickerModal(
                                        onEndDateChanged: (date) {
                                          setState(() {
                                            _dueDate = date;
                                          });
                                        },
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2100),
                                      ));
                            },
                            child: Row(
                              children: [
                                Icon(CupertinoIcons.calendar,
                                    color: _dueDate != null
                                        ? getTheme(context).primary
                                        : null),
                                if (_dueDate != null)
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: $constants.insets.xxs),
                                    child: Text(
                                      _dueDate!.formatDueDate(context),
                                      style: getTextTheme(context)
                                          .bodySmall!
                                          .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: _dueDate != null
                                                ? getTheme(context).primary
                                                : null,
                                          ),
                                    ),
                                  ),
                              ],
                            )),
                      ),
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
                            endDate: _dueDate,
                            completed: false,
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
