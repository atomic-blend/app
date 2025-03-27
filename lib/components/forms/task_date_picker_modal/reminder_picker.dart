import 'package:app/components/dialogs/date_picker_dialog.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

enum ReminderPickerMode { day, time }

class ReminderPicker extends StatefulWidget {
  // either endDate for day task or startDate for tasks with start and end
  final DateTime dueDate;
  final List<DateTime>? reminders;
  final Function(List<DateTime>?) onRemindersChanged;
  final ReminderPickerMode mode;
  const ReminderPicker(
      {super.key,
      required this.onRemindersChanged,
      required this.mode,
      this.reminders,
      required this.dueDate});

  @override
  State<ReminderPicker> createState() => _ReminderPickerState();
}

class _ReminderPickerState extends State<ReminderPicker> {
  var _reminders = <DateTime>[];

  @override
  void initState() {
    super.initState();
    _reminders = widget.reminders?.toList() ?? [];
  }

  bool _isReminderSelected(String value) {
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) return false;

    int days = int.parse(value);
    DateTime reminderDate = widget.dueDate.add(Duration(days: days));

    return _reminders.contains(reminderDate);
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.day == b.day && a.month == b.month && a.year == b.year;
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> items;
    if (widget.mode == ReminderPickerMode.day) {
      items = context.t.days_before;
    } else {
      items = context.t.time_before;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(context.t.tasks.add_task_modal.reminders(n: 0),
            style: getTextTheme(context).headlineMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                )),
        SizedBox(
          height: $constants.insets.sm,
        ),
        SizedBox(
          height: getSize(context).height * 0.15,
          child: _reminders.isEmpty
              ? Text(
                  context.t.tasks.add_task_modal.no_reminders,
                  style: getTextTheme(context).bodyMedium,
                )
              : ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: _reminders.length,
                  itemBuilder: (context, index) {
                    final reminder = _reminders[index];
                    return ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            Jiffy.parseFromDateTime(reminder).Hm,
                            style:
                                getTextTheme(context).headlineSmall!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          Text(
                            Jiffy.parseFromDateTime(reminder).yMMMMEEEEd,
                            style: getTextTheme(context).bodySmall,
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(CupertinoIcons.xmark),
                        onPressed: () {
                          setState(() {
                            _reminders.removeAt(index);
                            widget.onRemindersChanged(
                                _reminders.isEmpty ? null : _reminders);
                          });
                        },
                      ),
                    );
                  },
                ),
        ),
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return ABDatePickerDialog(
                  title: context.t.tasks.add_task_modal
                      .when_would_you_like_to_be_reminded,
                  onDateChanged: (value) {
                    setState(() {
                      _reminders.add(value);
                      widget.onRemindersChanged(_reminders);
                    });
                  },
                );
              },
            );
          },
          child: Center(
            child: Text(
              context.t.actions.add,
              style: getTextTheme(context)
                  .bodyMedium!
                  .copyWith(color: getTheme(context).primary),
            ),
          ),
        ),
        // ...items.entries.mapIndexed((index, element) {
        //   final isSelected = _isReminderSelected(element.value.value);

        //   Widget w = GestureDetector(
        //     onTap: () {
        //       int days = int.parse(element.value.value);
        //       DateTime reminderDate = widget.dueDate.add(Duration(days: days));

        //       setState(() {
        //         if (isSelected) {
        //           // Remove the reminder if it's already selected
        //           _reminders.removeWhere((r) => _isSameDay(r, reminderDate));
        //         } else {
        //           // Add the reminder if it's not already selected
        //           _reminders.add(reminderDate);
        //         }

        //         // Notify parent about changes
        //         widget
        //             .onRemindersChanged(_reminders.isEmpty ? null : _reminders);
        //       });
        //     },
        //     child: Padding(
        //       padding: EdgeInsets.symmetric(
        //         horizontal: $constants.insets.xs,
        //         vertical: $constants.insets.xs,
        //       ),
        //       child: Text(
        //         element.value.label,
        //         style: getTextTheme(context).bodyMedium!.copyWith(
        //               color: isSelected ? getTheme(context).primary : null,
        //             ),
        //       ),
        //     ),
        //   );

        //   // Show checkmark if this reminder is selected
        //   if (isSelected) {
        //     w = Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       mainAxisSize: MainAxisSize.max,
        //       children: [
        //         Expanded(child: w),
        //         Icon(CupertinoIcons.check_mark,
        //             color: getTheme(context).primary)
        //       ],
        //     );
        //   }

        //   return w;
        // })
      ],
    );
  }
}
