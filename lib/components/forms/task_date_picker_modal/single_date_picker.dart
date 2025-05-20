import 'package:app/components/forms/task_date_picker_modal/reminder_picker.dart';
import 'package:app/components/responsive_stateful_widget.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/exntensions/date_time_extension.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:jiffy/jiffy.dart';

class SingleDatePicker extends ResponsiveStatefulWidget {
  final Function(List<DateTime>?) onRemindersChanged;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final DateTime? endDate;
  final List<DateTime>? reminders;
  final Function(DateTime)? onEndDateChanged;

  const SingleDatePicker(
      {super.key,
      this.firstDate,
      this.lastDate,
      this.endDate,
      this.onEndDateChanged,
      required this.onRemindersChanged,
      this.reminders});

  @override
  ResponsiveState<SingleDatePicker> createState() => _SingleDatePickerState();
}

class _SingleDatePickerState extends ResponsiveState<SingleDatePicker> {
  DateTime? endDate;
  List<DateTime>? _reminders;

  @override
  void initState() {
    endDate = widget.endDate;
    _reminders = widget.reminders;
    super.initState();
  }

  @override
  Widget buildDesktop(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: $constants.insets.xxs,
            horizontal: $constants.insets.sm,
          ),
          child: Container(
            width: isDesktop(context) ? getSize(context).width * 0.5 : null,
            decoration: BoxDecoration(
              color: getTheme(context).surface,
              borderRadius: BorderRadius.circular($constants.corners.md),
            ),
            child: CalendarDatePicker2(
              config: CalendarDatePicker2Config(
                calendarType: CalendarDatePicker2Type.single,
                firstDate: widget.firstDate ??
                    Jiffy.parseFromDateTime(DateTime.now())
                        .subtract(years: 100)
                        .dateTime,
                lastDate: widget.lastDate ??
                    Jiffy.parseFromDateTime(DateTime.now())
                        .add(years: 100)
                        .dateTime,
              ),
              value: [endDate],
              onValueChanged: (value) {
                setState(() {
                  if (endDate == null) {
                    endDate = value[0];
                  } else {
                    endDate = endDate!.copyWith(
                      year: value[0].year,
                      month: value[0].month,
                      day: value[0].day,
                    );
                  }
                  widget.onEndDateChanged?.call(endDate!);
                });
              },
            ),
          ),
        ),
        SizedBox(height: $constants.insets.sm),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: $constants.insets.sm),
            child: Container(
              decoration: BoxDecoration(
                color: getTheme(context).surface,
                borderRadius: BorderRadius.circular($constants.corners.md),
              ),
              padding: EdgeInsets.symmetric(
                  vertical: $constants.insets.sm,
                  horizontal: $constants.insets.sm),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: $constants.insets.sm,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          spacing: $constants.insets.sm,
                          children: [
                            const Icon(CupertinoIcons.clock),
                            Text(context.t.tasks.add_task_modal.time_planned),
                          ],
                        ),
                        CustomPopup(
                          backgroundColor: getTheme(context).surface,
                          content: SizedBox(
                            width: getSize(context).width * 0.5,
                            height: getSize(context).height * 0.25,
                            child: CupertinoDatePicker(
                              use24hFormat: true,
                              initialDateTime:
                                  endDate?.toLocal() ?? DateTime.now(),
                              mode: CupertinoDatePickerMode.time,
                              onDateTimeChanged: (value) {
                                setState(() {
                                  endDate = endDate?.copyWith(
                                    hour: value.toUtc().hour,
                                    minute: value.toUtc().minute,
                                  );
                                });
                                widget.onEndDateChanged?.call(endDate!);
                              },
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(endDate != null &&
                                      endDate?.isDayDate() != true
                                  ? Jiffy.parseFromDateTime(endDate!)
                                      .toLocal()
                                      .Hm
                                  : context.t.tasks.add_task_modal.none),
                              if (endDate != null &&
                                  endDate?.isDayDate() != true) ...[
                                SizedBox(width: $constants.insets.xs),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      endDate = endDate?.copyWith(
                                        hour: 0,
                                        minute: 0,
                                      );
                                    });
                                    widget.onEndDateChanged?.call(endDate!);
                                  },
                                  child: Icon(
                                    CupertinoIcons.xmark,
                                    color: getTheme(context).error,
                                    size: 20,
                                  ),
                                )
                              ]
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: $constants.insets.xs),
                  const Divider(),
                  SizedBox(height: $constants.insets.xs),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: $constants.insets.sm,
                    ),
                    child: CustomPopup(
                      content: SizedBox(
                        width: getSize(context).width * 0.75,
                        child: ReminderPicker(
                            reminders: _reminders,
                            dueDate: endDate ?? DateTime.now(),
                            onRemindersChanged: (newValue) {
                              setState(() {
                                _reminders = newValue;
                              });
                              widget.onRemindersChanged(_reminders);
                            },
                            mode: ReminderPickerMode.day),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            spacing: $constants.insets.sm,
                            children: [
                              const Icon(CupertinoIcons.alarm),
                              Text(context.t.tasks.add_task_modal
                                  .reminders(n: 2))
                            ],
                          ),
                          Center(
                              child: Text(_reminders != null &&
                                      _reminders!.isNotEmpty
                                  ? "${_reminders?.length.toString()} ${context.t.tasks.add_task_modal.reminders(n: _reminders?.length ?? 0).toLowerCase()}"
                                  : context.t.tasks.add_task_modal.none)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget buildMobile(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: $constants.insets.xxs,
            horizontal: $constants.insets.sm,
          ),
          child: Container(
            height: isDesktop(context) ? getSize(context).height * 0.4 : null,
            width: isDesktop(context) ? getSize(context).width * 0.5 : null,
            decoration: BoxDecoration(
              color: getTheme(context).surface,
              borderRadius: BorderRadius.circular($constants.corners.md),
            ),
            child: CalendarDatePicker2(
              config: CalendarDatePicker2Config(
                calendarType: CalendarDatePicker2Type.single,
                firstDate: widget.firstDate ??
                    Jiffy.parseFromDateTime(DateTime.now())
                        .subtract(years: 100)
                        .dateTime,
                lastDate: widget.lastDate ??
                    Jiffy.parseFromDateTime(DateTime.now())
                        .add(years: 100)
                        .dateTime,
              ),
              value: [endDate],
              onValueChanged: (value) {
                setState(() {
                  if (endDate == null) {
                    endDate = value[0];
                  } else {
                    endDate = endDate!.copyWith(
                      year: value[0].year,
                      month: value[0].month,
                      day: value[0].day,
                    );
                  }
                  widget.onEndDateChanged?.call(endDate!);
                });
              },
            ),
          ),
        ),
        SizedBox(height: $constants.insets.sm),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: $constants.insets.sm),
          child: Container(
            decoration: BoxDecoration(
              color: getTheme(context).surface,
              borderRadius: BorderRadius.circular($constants.corners.md),
            ),
            padding: EdgeInsets.symmetric(
                vertical: $constants.insets.sm,
                horizontal: $constants.insets.sm),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: $constants.insets.sm,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        spacing: $constants.insets.sm,
                        children: [
                          const Icon(CupertinoIcons.clock),
                          Text(context.t.tasks.add_task_modal.time_planned),
                        ],
                      ),
                      CustomPopup(
                        backgroundColor: getTheme(context).surface,
                        content: SizedBox(
                          width: getSize(context).width * 0.5,
                          height: getSize(context).height * 0.25,
                          child: CupertinoDatePicker(
                            use24hFormat: true,
                            initialDateTime:
                                endDate?.toLocal() ?? DateTime.now(),
                            mode: CupertinoDatePickerMode.time,
                            onDateTimeChanged: (value) {
                              setState(() {
                                endDate = endDate?.copyWith(
                                  hour: value.toUtc().hour,
                                  minute: value.toUtc().minute,
                                );
                              });
                              widget.onEndDateChanged?.call(endDate!);
                            },
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(endDate != null && endDate?.isDayDate() != true
                                ? Jiffy.parseFromDateTime(endDate!).toLocal().Hm
                                : context.t.tasks.add_task_modal.none),
                            if (endDate != null &&
                                endDate?.isDayDate() != true) ...[
                              SizedBox(width: $constants.insets.xs),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    endDate = endDate?.copyWith(
                                      hour: 0,
                                      minute: 0,
                                    );
                                  });
                                  widget.onEndDateChanged?.call(endDate!);
                                },
                                child: Icon(
                                  CupertinoIcons.xmark,
                                  color: getTheme(context).error,
                                  size: 20,
                                ),
                              )
                            ]
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: $constants.insets.xs),
                const Divider(),
                SizedBox(height: $constants.insets.xs),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: $constants.insets.sm,
                  ),
                  child: CustomPopup(
                    content: SizedBox(
                      width: getSize(context).width * 0.75,
                      child: ReminderPicker(
                          reminders: _reminders,
                          dueDate: endDate ?? DateTime.now(),
                          onRemindersChanged: (newValue) {
                            setState(() {
                              _reminders = newValue;
                            });
                            widget.onRemindersChanged(_reminders);
                          },
                          mode: ReminderPickerMode.day),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          spacing: $constants.insets.sm,
                          children: [
                            const Icon(CupertinoIcons.alarm),
                            Text(context.t.tasks.add_task_modal.reminders(n: 2))
                          ],
                        ),
                        Center(
                            child: Text(_reminders != null &&
                                    _reminders!.isNotEmpty
                                ? "${_reminders?.length.toString()} ${context.t.tasks.add_task_modal.reminders(n: _reminders?.length ?? 0).toLowerCase()}"
                                : context.t.tasks.add_task_modal.none)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
