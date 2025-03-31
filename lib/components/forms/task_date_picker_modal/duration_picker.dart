import 'package:app/components/dialogs/date_picker_dialog.dart';
import 'package:app/components/forms/task_date_picker_modal/reminder_picker.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:jiffy/jiffy.dart';

class DurationPicker extends StatefulWidget {
  final Function(List<DateTime>?) onRemindersChanged;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final DateTime? endDate;
  final DateTime? startDate;
  final List<DateTime>? reminders;
  final Function(DateTime)? onEndDateChanged;
  final Function(DateTime)? onStartDateChanged;

  const DurationPicker(
      {super.key,
      this.firstDate,
      this.lastDate,
      this.endDate,
      this.onEndDateChanged,
      required this.onRemindersChanged,
      this.reminders,
      this.startDate,
      this.onStartDateChanged});

  @override
  State<DurationPicker> createState() => _DurationPickerState();
}

class _DurationPickerState extends State<DurationPicker> {
  DateTime? _endDate;
  DateTime? _startDate;
  List<DateTime>? _reminders;

  @override
  void initState() {
    if (widget.startDate == null) {
      _startDate = widget.endDate;
      _endDate = _startDate?.add(const Duration(minutes: 30));
    } else {
      _startDate = widget.startDate;
      _endDate = widget.endDate;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: $constants.insets.sm),
      child: Column(
        children: [
          SizedBox(
            height: getSize(context).height * 0.1,
            child: Row(
              spacing: $constants.insets.sm,
              children: [
                _generateDateContainer(
                    date: _startDate,
                    title: context.t.tasks.add_task_modal
                        .when_would_you_like_the_task_to_start,
                    onDateChanged: (value) {
                      setState(() {
                        _startDate = value?.toUtc();
                        _endDate = value?.toUtc().add(const Duration(minutes: 30));
                      });
                      widget.onStartDateChanged?.call(value!);
                    }),
                _generateDateContainer(
                    date: _endDate,
                    title: context.t.tasks.add_task_modal
                        .when_would_you_like_the_task_to_end,
                    onDateChanged: (value) {
                      setState(() {
                        _endDate = value?.toUtc();
                      });
                      widget.onEndDateChanged?.call(value!);
                    }),
              ],
            ),
          ),
          SizedBox(height: $constants.insets.sm),
          Container(
            decoration: BoxDecoration(
              color: getTheme(context).surface,
              borderRadius: BorderRadius.circular($constants.corners.md),
            ),
            padding: EdgeInsets.symmetric(
                vertical: $constants.insets.sm,
                horizontal: $constants.insets.sm),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: $constants.insets.sm,
                  ),
                  child: CustomPopup(
                    content: SizedBox(
                      width: getSize(context).width * 0.75,
                      child: ReminderPicker(
                          reminders: _reminders,
                          dueDate: _endDate ?? DateTime.now(),
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
                                : "-")),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _generateDateContainer(
      {DateTime? date,
      Function(DateTime?)? onDateChanged,
      required String title}) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return ABDatePickerDialog(
                initialDate: date.toLocal(),
                title: title,
                onDateChanged: (value) {
                  setState(() {
                    onDateChanged?.call(value);
                  });
                },
              );
            },
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: getTheme(context).surface,
            borderRadius: BorderRadius.circular($constants.corners.md),
          ),
          padding: EdgeInsets.all($constants.insets.sm),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                maxLines: 1,
                Jiffy.parseFromDateTime(date!).toLocal().yMMMEd.capitalize,
                style: getTextTheme(context).titleSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              AutoSizeText(
                maxLines: 1,
                Jiffy.parseFromDateTime(date).toLocal().Hm.capitalize,
                style: getTextTheme(context).bodyMedium!.copyWith(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
