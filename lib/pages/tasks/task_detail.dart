import 'dart:convert';
import 'dart:io';

import 'package:app/blocs/folder/folder.bloc.dart';
import 'package:app/blocs/tag/tag.bloc.dart';
import 'package:app/blocs/tasks/tasks.bloc.dart';
import 'package:app/components/buttons/icon_text_pill.dart';
import 'package:app/components/dialogs/priority_picker.dart';
import 'package:app/components/forms/app_text_form_field.dart';
import 'package:app/components/forms/task_date_picker_modal/task_date_picker_modal.dart';
import 'package:app/components/widgets/elevated_container.dart';
import 'package:app/entities/folder/folder.entity.dart';
import 'package:app/entities/tag/tag.entity.dart';
import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/pages/tasks/add_time_entry.dart';
import 'package:app/pages/tasks/assign_folder.dart';
import 'package:app/pages/tasks/assign_tag_modal.dart';
import 'package:app/pages/tasks/task_time_entry_log.dart' show TaskTimeEntryLog;
import 'package:app/pages/timer/task_timer.dart';
import 'package:app/pages/timer/timer_utils.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/exntensions/date_time_extension.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:collection/collection.dart';
import 'package:fleather/fleather.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:jiffy/jiffy.dart';
import 'package:macos_window_utils/macos_window_utils.dart';

import '../../components/forms/ab_checkbox.dart';

class TaskDetail extends StatefulWidget {
  final TaskEntity task;
  final bool? smallNotes;

  const TaskDetail({super.key, required this.task, this.smallNotes});

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
  Folder? _folder;

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
    if (isDesktop(context)) {
      final body = ClipRRect(
        borderRadius: BorderRadius.circular($constants.corners.sm),
        child: buildBody(context),
      );

      if (Platform.isMacOS) {
        return TitlebarSafeArea(
          child: body,
        );
      } else {
        return body;
      }
    }
    return buildBody(context);
  }

  Widget buildBody(BuildContext context) {
    return BlocBuilder<FolderBloc, FolderState>(
        builder: (context, folderState) {
      _folder = folderState.folders
          ?.firstWhereOrNull((element) => element.id == widget.task.folderId);
      return Scaffold(
        appBar: AppBar(
          title: CustomPopup(
            content: SizedBox(
              width: getSize(context).width * 0.9,
              child: AssignFolder(
                folderId: widget.task.folderId,
                onFolderSelected: (folder) {
                  if (folder == null) {
                    setState(() {
                      widget.task.folderId = null;
                      _folder = null;
                    });
                  } else {
                    setState(() {
                      widget.task.folderId = folder.id;
                      _folder = folder;
                    });
                  }
                },
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (widget.task.folderId == null) ...[
                  const SizedBox(
                    width: 20,
                    height: 30,
                    child: Icon(
                      CupertinoIcons.tray_arrow_down,
                      size: 18,
                    ),
                  ),
                  SizedBox(
                    width: $constants.insets.xs,
                  ),
                  Text(
                    context.t.inbox.title,
                    style: getTextTheme(context).bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  )
                ] else ...[
                  if (_folder?.emoji != null) ...[
                    SizedBox(
                      width: 20,
                      height: 30,
                      child: Text(
                        _folder!.emoji!,
                        style: const TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: $constants.insets.xs,
                    ),
                    Text(
                      _folder?.name ?? "",
                      style: getTextTheme(context).bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    )
                  ],
                ],
              ],
            ),
          ),
          leading: IconButton(
            icon: Icon(
              isDesktop(context) ? CupertinoIcons.xmark : CupertinoIcons.back,
            ),
            onPressed: () {
              _updateTask(context);
              Navigator.of(context).pop();
            },
          ),
        ),
        backgroundColor: getTheme(context).surface,
        body: BlocBuilder<TagBloc, TagState>(builder: (context, tagState) {
          return Padding(
            padding: isDesktop(context)
                ? EdgeInsets.only(
                    right: $constants.insets.md,
                    left: $constants.insets.sm,
                    bottom: $constants.insets.xs,
                  )
                : EdgeInsets.only(
                    right: $constants.insets.sm,
                    left: $constants.insets.sm,
                    bottom: $constants.insets.lg,
                  ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedContainer(
                  padding: EdgeInsets.symmetric(
                    horizontal: $constants.insets.sm,
                    vertical: $constants.insets.xs,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ABCheckbox(
                          value: widget.task.completed,
                          onChanged: (newValue) {}),
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
                                  style: getTextTheme(context)
                                      .bodyMedium!
                                      .copyWith())
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
                            backgroundColor: getTheme(context).surface,
                            contentPadding:
                                EdgeInsets.all($constants.insets.xxs),
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
                SizedBox(
                  height: $constants.insets.xs,
                ),
                Expanded(
                  child: ElevatedContainer(
                    padding: EdgeInsets.only(
                      bottom: $constants.insets.xs,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTextFormField(
                          backgroundColor: Colors.transparent,
                          controller: _titleController,
                          hintText: context.t.tasks.add_task_modal.task_title,
                          height: 50,
                          textStyle:
                              getTextTheme(context).titleMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                          onSubmitted: () {
                            widget.task.title = _titleController.text;
                            if (!context.mounted) return;
                            context
                                .read<TasksBloc>()
                                .add(EditTask(widget.task));
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: $constants.insets.xs),
                          child: Row(
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
                                  context
                                      .read<TasksBloc>()
                                      .add(EditTask(widget.task));
                                },
                                child: IconTextPill(
                                  title: _tags.isEmpty
                                      ? context.t.tags.add_modal.title
                                      : context.t.actions.edit,
                                  color: getTheme(context)
                                      .primary
                                      .withValues(alpha: 0.1),
                                ),
                              ),
                              SizedBox(
                                width: $constants.insets.xs,
                              ),
                              Container(
                                height: $constants.insets.md,
                                // Adjust height as needed
                                width: 1,
                                color: Colors.grey[300],
                              ),
                              SizedBox(
                                width: $constants.insets.xs,
                              ),
                              ..._tags.map((tag) => Padding(
                                    padding: EdgeInsets.only(
                                        right: $constants.insets.xs),
                                    child: IconTextPill(
                                      title: tag.name,
                                      color: tag.color != null
                                          ? hexToColor(tag.color!)
                                              .withValues(alpha: 0.2)
                                          : null,
                                      onDelete: () {
                                        setState(() {
                                          _tags.removeWhere(
                                              (e) => e.id == tag.id);
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
                        ),
                        SizedBox(
                          height: $constants.insets.xs,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: $constants.insets.sm,
                            vertical: $constants.insets.xs,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                context.t.tasks.add_task_modal.notes,
                                style: getTextTheme(context)
                                    .labelMedium!
                                    .copyWith(),
                              ),
                              if (isDesktop(context))
                                FleatherToolbar.basic(controller: _controller!),
                              KeyboardVisibilityBuilder(
                                  builder: (context, isKeyboardVisible) {
                                return SizedBox(
                                  // height: widget.smallNotes == true
                                  //     ? getSize(context).height * 0.25
                                  //     : isKeyboardVisible
                                  //         ? getSize(context).height * 0.3
                                  //         : isDesktop(context)
                                  //             ? getSize(context).height * 0.4
                                  //             : getSize(context).height * 0.4,
                                  child: FleatherEditor(
                                    controller: _controller!,
                                  ),
                                );
                              }),
                              if (!isDesktop(context))
                                KeyboardVisibilityBuilder(
                                    builder: (context, isKeyboardVisible) {
                                  if (isKeyboardVisible) {
                                    return FleatherToolbar.basic(
                                        controller: _controller!);
                                  }
                                  return Container();
                                }),
                              SizedBox(
                                height: $constants.insets.sm,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: $constants.insets.sm,
                ),
                StaggeredGrid.count(
                    crossAxisCount: 4,
                    mainAxisSpacing: $constants.insets.sm,
                    crossAxisSpacing: $constants.insets.sm,
                    children: [
                      StaggeredGridTile.count(
                        crossAxisCellCount: isDesktop(context) ? 1 : 2,
                        mainAxisCellCount: isDesktop(context) ? 0.5 : 0.8,
                        child: _buildCard(
                            context: context,
                            title: context.t.tasks.time_log,
                            icon: CupertinoIcons.arrow_counterclockwise,
                            onTap: () {
                              if (isDesktop(context)) {
                                showDialog(
                                    context: context,
                                    builder: (context) => Dialog(
                                          child: TaskTimeEntryLog(
                                            task: widget.task,
                                          ),
                                        ));
                              } else {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (context) => SizedBox(
                                      height: getSize(context).height * 0.4,
                                      width: double.infinity,
                                      child: TaskTimeEntryLog(
                                        task: widget.task,
                                      )),
                                );
                              }
                            }),
                      ),
                      StaggeredGridTile.count(
                          crossAxisCellCount: isDesktop(context) ? 1 : 2,
                          mainAxisCellCount: isDesktop(context) ? 0.5 : 0.8,
                          child: _buildCard(
                              context: context,
                              title: context.t.tasks.log_session,
                              icon: CupertinoIcons.plus_app,
                              onTap: () {
                                if (isDesktop(context)) {
                                  showDialog(
                                      context: context,
                                      builder: (context) => Dialog(
                                            child: AddTimeEntry(
                                              task: widget.task,
                                            ),
                                          ));
                                } else {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) => SizedBox(
                                        height: getSize(context).height * 0.4,
                                        width: double.infinity,
                                        child: AddTimeEntry(
                                          task: widget.task,
                                        )),
                                  );
                                }
                              })),
                      StaggeredGridTile.count(
                        crossAxisCellCount: isDesktop(context) ? 1 : 2,
                        mainAxisCellCount: isDesktop(context) ? 0.5 : 0.8,
                        child: _buildCard(
                            context: context,
                            title: context.t.tasks.timer,
                            icon: CupertinoIcons.stopwatch,
                            onTap: () {
                              _showTimerModal(context, TimerMode.stopwatch);
                            }),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: isDesktop(context) ? 1 : 2,
                        mainAxisCellCount: isDesktop(context) ? 0.5 : 0.8,
                        child: _buildCard(
                            context: context,
                            title: context.t.tasks.pomodoro,
                            icon: CupertinoIcons.timer,
                            onTap: () {
                              _showTimerModal(context, TimerMode.pomodoro);
                            }),
                      )
                    ]),
                if (isDesktop(context))
                  SizedBox(
                    height: $constants.insets.xs,
                  ),
              ],
            ),
          );
        }),
      );
    });
  }

  _buildCard({
    required BuildContext context,
    required String title,
    required IconData icon,
    required Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: ElevatedContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 30,
            ),
            Text(
              title,
              style: getTextTheme(context).bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  _updateTask(BuildContext context) {
    widget.task.title = _titleController.text;
    widget.task.description = jsonEncode(_controller!.document.toJson());
    widget.task.endDate = _endDate;
    widget.task.startDate = _startDate;
    widget.task.reminders = _reminders;
    widget.task.tags = _tags;
    widget.task.folderId = _folder?.id;
    widget.task.priority = _priority;
    context.read<TasksBloc>().add(EditTask(widget.task));
  }

  _showTimerModal(BuildContext context, TimerMode mode) {
    if (isDesktop(context)) {
      showDialog(
          context: context,
          builder: (context) => Dialog(
                child: SizedBox(
                  width: getSize(context).width * 0.7,
                  height: getSize(context).height * 0.75,
                  child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular($constants.corners.lg),
                      child: TaskTimer(
                        task: widget.task,
                        mode: TimerMode.stopwatch,
                      )),
                ),
              ));
    } else {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => SizedBox(
          height: getSize(context).height * 0.8,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular($constants.corners.xl),
            child: TaskTimer(
              task: widget.task,
              mode: mode,
            ),
          ),
        ),
      );
    }
  }
}
