import 'package:ab_shared/components/widgets/elevated_container.dart';
import 'package:app/blocs/tasks/tasks.bloc.dart';
import 'package:ab_shared/components/forms/ab_checkbox.dart';
import 'package:ab_shared/entities/sync/patch_change/patch_change.dart';
import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/pages/tasks/task_detail.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:app/utils/extensions/date_time_extension.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:jiffy/jiffy.dart';

class TaskItem extends StatefulWidget {
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
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool? _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Draggable<TaskEntity>(
      data: widget.task,
      feedback: buildContent(context),
      childWhenDragging: Container(),
      child: buildContent(context),
    );
  }

  Widget buildContent(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (event) {
        setState(() {
          _isHovered = false;
        });
      },
      child: ElevatedContainer(
        disableShadow: true,
        color: _isHovered == true
            ? getTheme(context).surfaceContainer.darken(3)
            : null,
        padding: EdgeInsets.symmetric(
          horizontal: $constants.insets.xs,
          vertical: $constants.insets.xs,
        ),
        child: GestureDetector(
          onTap: () {
            if (widget.onTap != null) {
              widget.onTap!();
              return;
            }
            if (isDesktop(context)) {
              showDialog(
                context: context,
                builder: (context) => Dialog(
                  backgroundColor: Colors.transparent,
                  child: SizedBox(
                    height: getSize(context).height * 0.7,
                    width: isDesktop(context)
                        ? getSize(context).width * 0.5
                        : getSize(context).width,
                    child: TaskDetail(
                      task: widget.task,
                    ),
                  ),
                ),
              );
            } else {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TaskDetail(
                    task: widget.task,
                  ),
                ),
              );
            }
          },
          child: Slidable(
            enabled: widget.slideable ?? true,
            key: ValueKey(widget.task.id),
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
                      context.read<TasksBloc>().add(DeleteTask(widget.task));
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
                  padding:
                      EdgeInsets.symmetric(vertical: $constants.insets.xxs),
                  child: GestureDetector(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (widget.checkable != false)
                          ABCheckbox(
                              value: widget.task.completed ?? false,
                              onChanged: (value) {
                                widget.task.completed = value!;
                                context.read<TasksBloc>().add(
                                      EditTask(
                                        widget.task.id!,
                                        [
                                          PatchChange(
                                            key: "completed",
                                            value: value,
                                          ),
                                        ],
                                      ),
                                    );
                              }),
                        SizedBox(
                          width: $constants.insets.xs,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.task.title,
                              style: getTextTheme(context)
                                  .headlineSmall!
                                  .copyWith(),
                            ),
                            if (widget.collapsed == true) ...[
                              SizedBox(
                                height: $constants.insets.xxs,
                              ),
                              ...buildTaskDateInfos(context),
                            ]
                          ],
                        ),
                        if (widget.collapsed != true) ...[
                          if (widget.task.tags != null &&
                              widget.task.tags!.isNotEmpty)
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
                                      color:
                                          widget.task.tags!.first.color != null
                                              ? hexToColor(widget
                                                      .task.tags!.first.color!)
                                                  .withValues(alpha: 0.2)
                                              : getTheme(context).primary,
                                      borderRadius: BorderRadius.circular(
                                        $constants.corners.sm,
                                      ),
                                    ),
                                    child: Text(widget.task.tags!.first.name),
                                  ),
                                  if (widget.task.tags!.length > 1) ...[
                                    SizedBox(
                                      width: $constants.insets.xs,
                                    ),
                                    Text(
                                      "+${widget.task.tags!.length - 1}",
                                      style: getTextTheme(context)
                                          .bodyMedium!
                                          .copyWith(color: Colors.grey),
                                    )
                                  ]
                                ],
                              ),
                            ),
                          const Spacer(),
                          if (widget.task.priority != null &&
                              widget.task.priority! > 0) ...[
                            Container(
                              padding:
                                  EdgeInsets.only(left: $constants.insets.sm),
                              child: Icon(
                                CupertinoIcons.flag_fill,
                                size: 16,
                                color: widget.task.priority == null ||
                                        widget.task.priority == 0
                                    ? Colors.grey
                                    : widget.task.priority == 1
                                        ? Colors.blueAccent
                                        : widget.task.priority == 2
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
        ),
      ),
    );
  }

  List<Widget> buildTaskDateInfos(BuildContext context) {
    return [
      // day task
      if (widget.task.startDate == null &&
          widget.task.endDate != null &&
          widget.task.endDate!.isDayDate())
        Container(
          padding: widget.collapsed == true
              ? null
              : EdgeInsets.symmetric(
                  horizontal: $constants.insets.xs,
                ),
          decoration: widget.collapsed == true
              ? null
              : BoxDecoration(
                  color: widget.task.endDate?.isBefore(DateTime.now()) == true
                      ? getTheme(context).error.withValues(alpha: 0.2)
                      : null,
                  borderRadius: BorderRadius.circular(
                    $constants.corners.sm,
                  ),
                ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize:
                widget.collapsed == true ? MainAxisSize.max : MainAxisSize.min,
            children: [
              const Icon(
                CupertinoIcons.calendar,
                size: 12,
              ),
              SizedBox(
                width: $constants.insets.xxs,
              ),
              Text(Jiffy.parseFromDateTime(widget.task.endDate!)
                  .toLocal()
                  .MMMMd),
            ],
          ),
        ),
      // time task
      if (widget.task.startDate == null &&
          widget.task.endDate != null &&
          !widget.task.endDate!.isDayDate())
        Container(
          padding: widget.collapsed == true
              ? null
              : EdgeInsets.symmetric(
                  horizontal: $constants.insets.xs,
                ),
          decoration: widget.collapsed == true
              ? null
              : BoxDecoration(
                  color: widget.task.endDate?.isBefore(DateTime.now()) == true
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
                mainAxisSize: widget.collapsed == true
                    ? MainAxisSize.max
                    : MainAxisSize.min,
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
                    "${Jiffy.parseFromDateTime(widget.task.endDate!).toLocal().MMMMd}, ${Jiffy.parseFromDateTime(widget.task.endDate!).toLocal().Hm}",
                    style: getTextTheme(context).bodyMedium,
                  ),
                ],
              ),
            ],
          ),
        ),
      // precise time task (end and start define, like a calendar event)
      if (widget.task.startDate != null && widget.task.endDate != null)
        Container(
          padding: widget.collapsed == true
              ? null
              : EdgeInsets.symmetric(
                  horizontal: $constants.insets.xs,
                ),
          decoration: widget.collapsed == true
              ? null
              : BoxDecoration(
                  color: widget.task.endDate?.isBefore(DateTime.now()) == true
                      ? getTheme(context).error.withValues(alpha: 0.2)
                      : null,
                  borderRadius: BorderRadius.circular(
                    $constants.corners.sm,
                  ),
                ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize:
                widget.collapsed == true ? MainAxisSize.max : MainAxisSize.min,
            children: [
              if (widget.collapsed != true) ...[
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
                  widget.task.endDate?.isBefore(DateTime.now()) == true
                      ? "${Jiffy.parseFromDateTime(widget.task.startDate!).toLocal().MMMMd}, ${Jiffy.parseFromDateTime(widget.task.startDate!).toLocal().Hm} - ${Jiffy.parseFromDateTime(widget.task.endDate!).toLocal().Hm}"
                      : "${Jiffy.parseFromDateTime(widget.task.startDate!).toLocal().Hm} - ${Jiffy.parseFromDateTime(widget.task.endDate!).toLocal().Hm}",
                  softWrap: true,
                  style: widget.collapsed == true
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
