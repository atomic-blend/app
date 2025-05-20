import 'dart:convert';
import 'dart:io';

import 'package:app/blocs/tag/tag.bloc.dart';
import 'package:app/blocs/tasks/tasks.bloc.dart';
import 'package:app/components/buttons/icon_text_pill.dart';
import 'package:app/components/dialogs/priority_picker.dart';
import 'package:app/components/forms/app_text_form_field.dart';
import 'package:app/components/forms/task_date_picker_modal/task_date_picker_modal.dart';
import 'package:app/entities/tag/tag.entity.dart';
import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/pages/tasks/assign_tag_modal.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/exntensions/date_time_extension.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:fleather/fleather.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:jiffy/jiffy.dart';
import 'package:macos_window_utils/macos_window_utils.dart';

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
  List<TagEntity> _tags = [];
  int? _priority;

  FleatherController? _controller;

  @override
  void initState() {
    _titleController.text = widget.task.title;
    _endDate = widget.task.endDate;
    _startDate = widget.task.startDate;
    _reminders = widget.task.reminders;
    _tags = widget.task.tags ?? [];
    _priority = widget.task.priority;
    if (widget.task.description != null) {
      final json = jsonDecode(widget.task.description!);
      _controller = FleatherController(
        document: ParchmentDocument.fromJson(json),
      );
    } else {
      _controller = FleatherController();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isDesktop(context) && Platform.isMacOS) {
      return TitlebarSafeArea(child: buildBody(context));
    }
    return buildBody(context);
  }

  Widget buildBody(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.t.tasks.task_details,
          style: getTextTheme(context).bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.back,
            color: getTheme(context).primary,
          ),
          onPressed: () {
            _updateTask(context);
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: getTheme(context).surface,
      body: BlocBuilder<TagBloc, TagState>(builder: (context, tagState) {
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
                  SizedBox(
                    width: 20,
                    child: CustomPopup(
                        content: PriorityPicker(
                          priority: _priority,
                          onChanged: (newValue) {
                            if (newValue == 0) {
                              setState(() {
                                _priority = null;
                              });
                            } else {
                              setState(() {
                                _priority = newValue;
                              });
                            }
                            widget.task.priority = _priority;
                            if (!context.mounted) return;
                            context
                                .read<TasksBloc>()
                                .add(EditTask(widget.task));
                          },
                        ),
                        child: SizedBox(
                          width: 20,
                          child: Icon(
                            _priority == null
                                ? CupertinoIcons.flag
                                : CupertinoIcons.flag_fill,
                            color: _priority == null || _priority == 0
                                ? Colors.grey
                                : _priority == 1
                                    ? Colors.blueAccent
                                    : _priority == 2
                                        ? Colors.deepOrangeAccent
                                        : Colors.red,
                          ),
                        )),
                  )
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
                      GestureDetector(
                        onTap: () async {
                          await showModalBottomSheet(
                              context: context,
                              builder: (context) => AssignTagModal(
                                    selectedTags: _tags,
                                    onSelectedTagsChanged: (tags) {
                                      setState(() {
                                        _tags = tags;
                                      });
                                    },
                                  ));
                          widget.task.tags = _tags;
                          if (!context.mounted) return;
                          context.read<TasksBloc>().add(EditTask(widget.task));
                        },
                        child: IconTextPill(
                          title: _tags.isEmpty
                              ? context.t.tags.add_modal.title
                              : context.t.actions.edit,
                          color:
                              getTheme(context).primary.withValues(alpha: 0.1),
                        ),
                      ),
                      SizedBox(
                        width: $constants.insets.xs,
                      ),
                      Container(
                        height: $constants.insets.md, // Adjust height as needed
                        width: 1,
                        color: Colors.grey[300],
                      ),
                      SizedBox(
                        width: $constants.insets.xs,
                      ),
                      ..._tags.map((tag) => Padding(
                            padding:
                                EdgeInsets.only(right: $constants.insets.xs),
                            child: IconTextPill(
                              title: tag.name,
                              color: tag.color != null
                                  ? hexToColor(tag.color!)
                                      .withValues(alpha: 0.2)
                                  : null,
                              onDelete: () {
                                setState(() {
                                  _tags.removeWhere((e) => e.id == tag.id);
                                });
                                widget.task.tags = _tags;
                                if (!context.mounted) return;
                                context
                                    .read<TasksBloc>()
                                    .add(EditTask(widget.task));
                              },
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: $constants.insets.xs,
                  ),
                  const Divider(
                    height: 1,
                  ),
                  SizedBox(
                    height: $constants.insets.xs,
                  ),
                  Text(
                    context.t.tasks.add_task_modal.notes,
                    style: getTextTheme(context).labelMedium!.copyWith(),
                  ),
                  if (isDesktop(context))
                    FleatherToolbar.basic(controller: _controller!),
                  KeyboardVisibilityBuilder(
                      builder: (context, isKeyboardVisible) {
                    return SizedBox(
                      height: isKeyboardVisible
                          ? getSize(context).height * 0.3
                          : isDesktop(context)
                              ? getSize(context).height * 0.5
                              : getSize(context).height * 0.62,
                      child: FleatherEditor(
                        controller: _controller!,
                      ),
                    );
                  }),
                  if (!isDesktop(context))
                    KeyboardVisibilityBuilder(
                        builder: (context, isKeyboardVisible) {
                      if (isKeyboardVisible) {
                        return FleatherToolbar.basic(controller: _controller!);
                      }
                      return Container();
                    }),
                ],
              ),
            )
          ],
        );
      }),
    );
  }

  _updateTask(BuildContext context) {
    widget.task.title = _titleController.text;
    widget.task.description = jsonEncode(_controller!.document.toJson());
    widget.task.endDate = _endDate;
    widget.task.startDate = _startDate;
    widget.task.reminders = _reminders;
    widget.task.tags = _tags;
    widget.task.priority = _priority;
    context.read<TasksBloc>().add(EditTask(widget.task));
  }
}
