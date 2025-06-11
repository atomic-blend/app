import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:app/components/forms/task_date_picker_modal/duration_picker.dart';
import 'package:app/components/forms/task_date_picker_modal/single_date_picker.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/exntensions/date_time_extension.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/material.dart';

class TaskDatePickerModal extends StatefulWidget {
  final Function(DateTime?) onStartDateChanged;
  final Function(DateTime?) onEndDateChanged;
  final Function(List<DateTime>?) onRemindersChanged;
  final DateTime? endDate;
  final DateTime? startDate;
  final List<DateTime>? reminders;
  final DateTime? firstDate;
  final DateTime? lastDate;

  const TaskDatePickerModal(
      {super.key,
      required this.onEndDateChanged,
      this.firstDate,
      this.lastDate,
      this.endDate,
      required this.onRemindersChanged,
      this.reminders,
      required this.onStartDateChanged,
      this.startDate});

  @override
  State<TaskDatePickerModal> createState() => _TaskDatePickerModalState();
}

class _TaskDatePickerModalState extends State<TaskDatePickerModal> {
  int? mode = 0;
  DateTime? endDate;
  DateTime? startDate;

  @override
  void initState() {
    final now = DateTime.now();
    endDate = widget.endDate ?? now.midnight();
    startDate = widget.startDate;
    if (startDate != null) {
      mode = 1;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: getSize(context).height * 0.7,
        decoration: BoxDecoration(
          color: getTheme(context).surface,
          borderRadius: BorderRadius.circular($constants.corners.md),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    context.t.tasks.add_task_modal.cancel,
                    style: getTextTheme(context).bodyMedium!.copyWith(),
                  ),
                ),
                SizedBox(
                  height: 30,
                  child: AnimatedToggleSwitch<int?>.rolling(
                    current: mode,
                    indicatorSize:
                        Size.fromWidth(getSize(context).width * 0.4 / 2),
                    values: const [0, 1],
                    iconBuilder: (value, foreground) {
                      return Text(context.t.date_modes.values.elementAt(value!),
                          style: getTextTheme(context).bodyMedium!.copyWith());
                    },
                    styleBuilder: (value) {
                      return ToggleStyle(
                        borderColor: Colors.transparent,
                        indicatorColor: value == mode
                            ? getTheme(context).surface
                            : getTheme(context).surfaceContainer,
                        backgroundColor: getTheme(context).surfaceContainer,
                      );
                    },
                    onChanged: (value) {
                      setState(() {
                        mode = value;
                      });
                      if (mode == 0) {
                        setState(() {
                          endDate = widget.endDate;
                        });
                      } else {
                        setState(() {
                          startDate = widget.endDate;
                          endDate = startDate?.add(const Duration(minutes: 30));
                        });
                      }
                    },
                  ),
                ),
                TextButton(
                  onPressed: () {
                    widget.onStartDateChanged(startDate);
                    widget.onRemindersChanged(widget.reminders);
                    widget.onEndDateChanged(endDate);
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    context.t.tasks.add_task_modal.save,
                    style: getTextTheme(context).bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: getTheme(context).primary,
                        ),
                  ),
                ),
              ],
            ),
            if (mode == 0)
              SizedBox(
                height: getSize(context).height * 0.55,
                child: SingleDatePicker(
                  endDate: endDate,
                  reminders: widget.reminders,
                  onRemindersChanged: widget.onRemindersChanged,
                  onEndDateChanged: (value) {
                    setState(() {
                      endDate = value;
                    });
                  },
                ),
              ),
            if (mode == 1)
              SizedBox(
                  height: getSize(context).height * 0.5,
                  width: double.infinity,
                  child: DurationPicker(
                    endDate: endDate,
                    startDate: startDate,
                    reminders: widget.reminders,
                    onRemindersChanged: widget.onRemindersChanged,
                    onEndDateChanged: (value) {
                      setState(() {
                        endDate = value;
                      });
                    },
                    onStartDateChanged: (value) {
                      setState(() {
                        startDate = value;
                        endDate = value.add(const Duration(minutes: 30));
                      });
                    },
                  )),
            const Spacer(),
            TextButton(
              onPressed: () {
                setState(() {
                  endDate = null;
                });
                widget.onEndDateChanged(null);
                Navigator.pop(context);
              },
              child: Text(
                context.t.tasks.add_task_modal.erase,
                style: getTextTheme(context).bodyMedium!.copyWith(
                      color: Colors.red,
                    ),
              ),
            ),
            SizedBox(height: $constants.insets.sm),
          ],
        ),
      ),
    );
  }
}
