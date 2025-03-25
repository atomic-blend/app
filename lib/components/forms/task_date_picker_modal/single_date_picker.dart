import 'package:app/utils/constants.dart';
import 'package:app/utils/exntensions/date_time_extension.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                  _dueDate = value.first.midnight();
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
                        const Text("15:00"),
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
                        const Text("15 minutes before"),
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
