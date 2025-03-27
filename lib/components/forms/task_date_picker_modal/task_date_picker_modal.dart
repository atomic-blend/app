import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:app/components/forms/task_date_picker_modal/single_date_picker.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/pages/under_construction/under_construction.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:app/utils/exntensions/date_time_extension.dart';

class TaskDatePickerModal extends StatefulWidget {
  final Function(DateTime?) onEndDateChanged;
  final Function(List<DateTime>?) onRemindersChanged;
  final DateTime? endDate;
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
      this.reminders});

  @override
  State<TaskDatePickerModal> createState() => _TaskDatePickerModalState();
}

class _TaskDatePickerModalState extends State<TaskDatePickerModal> {
  int? mode = 0;
  DateTime? _dueDate;

  @override
  void initState() {
    _dueDate = widget.endDate ?? DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: getSize(context).height * 0.7,
      decoration: BoxDecoration(
        color: getTheme(context).surfaceContainer,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular($constants.corners.xs),
          topRight: Radius.circular($constants.corners.xs),
        ),
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
                  },
                ),
              ),
              TextButton(
                onPressed: () {
                  widget.onEndDateChanged(_dueDate);
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
            SingleDatePicker(
              endDate: _dueDate,
              reminders: widget.reminders,
              onRemindersChanged: widget.onRemindersChanged,
              onEndDateChanged: (value) {
                setState(() {
                  _dueDate = value;
                });
              },
            ),
          if (mode == 1)
            SizedBox(
                height: getSize(context).height * 0.5,
                width: double.infinity,
                child: UnderConstruction()),
          const Spacer(),
          TextButton(
            onPressed: () {
              setState(() {
                _dueDate = null;
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
    );
  }
}
