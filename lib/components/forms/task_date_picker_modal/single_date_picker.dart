import 'package:app/utils/constants.dart';
import 'package:app/utils/exntensions/date_time_extension.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:jiffy/jiffy.dart';

class SingleDatePicker extends StatefulWidget {
  final DateTime? firstDate;
  final DateTime? lastDate;

  const SingleDatePicker({super.key, this.firstDate, this.lastDate});

  @override
  State<SingleDatePicker> createState() => _SingleDatePickerState();
}

class _SingleDatePickerState extends State<SingleDatePicker> {
  DateTime? _dueDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: $constants.insets.xxs,
            horizontal: $constants.insets.sm,
          ),
          child: Container(
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
              value: [_dueDate],
              onValueChanged: (value) {
                setState(() {
                  if (_dueDate == null) {
                    _dueDate = value[0];
                  } else {
                    _dueDate = _dueDate!.copyWith(
                      year: value[0].year,
                      month: value[0].month,
                      day: value[0].day,
                    );
                  }
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
                        children: const [
                          Icon(CupertinoIcons.clock),
                          Text("Planned time"),
                        ],
                      ),
                      CustomPopup(
                        content: SizedBox(
                          width: getSize(context).width * 0.5,
                          height: getSize(context).height * 0.25,
                          child: CupertinoDatePicker(
                            use24hFormat: true,
                            mode: CupertinoDatePickerMode.time,
                            onDateTimeChanged: (value) {
                              setState(() {
                                _dueDate ??= DateTime.now();
                                _dueDate = _dueDate?.copyWith(
                                  hour: value.hour,
                                  minute: value.minute,
                                );
                              });
                            },
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(_dueDate != null &&
                                    (_dueDate?.hour != 0 &&
                                        _dueDate?.minute != 0)
                                ? "${_dueDate?.hour}:${_dueDate?.minute}"
                                : "none"),
                            SizedBox(width: $constants.insets.xs),
                            if (_dueDate != null &&
                                (_dueDate?.hour != 0 && _dueDate?.minute != 0))
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _dueDate = _dueDate?.copyWith(
                                      hour: 0,
                                      minute: 0,
                                    );
                                  });
                                },
                                child: Icon(
                                  CupertinoIcons.xmark,
                                  color: getTheme(context).error,
                                  size: 20,
                                ),
                              )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: $constants.insets.xs),
                Divider(),
                SizedBox(height: $constants.insets.xs),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: $constants.insets.sm,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        spacing: $constants.insets.sm,
                        children: const [
                          Icon(CupertinoIcons.alarm),
                          Text("Reminder")
                        ],
                      ),
                      const Text("-"),
                    ],
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
