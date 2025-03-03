import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DueDatePickerModal extends StatefulWidget {
  final Function(DateTime?) onDateChanged;
  final DateTime? firstDate;
  final DateTime? lastDate;
  const DueDatePickerModal(
      {super.key, required this.onDateChanged, this.firstDate, this.lastDate});

  @override
  State<DueDatePickerModal> createState() => _DueDatePickerModalState();
}

class _DueDatePickerModalState extends State<DueDatePickerModal> {
  DateTime? _dueDate;

  @override
  void initState() {
    _dueDate = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: getSize(context).height * 0.7,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
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
                  style: getTextTheme(context).titleSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              TextButton(
                onPressed: () {
                  widget.onDateChanged(_dueDate);
                  Navigator.of(context).pop();
                },
                child: Text(
                  context.t.tasks.add_task_modal.save,
                  style: getTextTheme(context).titleSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
          SfDateRangePicker(
            headerStyle: DateRangePickerHeaderStyle(
              backgroundColor: Colors.transparent,
              textStyle: getTextTheme(context).titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.transparent,
            onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
              setState(() {
                _dueDate = args.value;
              });
            },
            selectionMode: DateRangePickerSelectionMode.single,
            initialSelectedDate: _dueDate,
            minDate: widget.firstDate ??
                Jiffy.parseFromDateTime(DateTime.now())
                    .subtract(years: 100)
                    .dateTime,
            maxDate: widget.lastDate ??
                Jiffy.parseFromDateTime(DateTime.now())
                    .add(years: 100)
                    .dateTime,
          ),
          const Spacer(),
          TextButton(
            onPressed: () {
              setState(() {
                _dueDate = null;
              });
              widget.onDateChanged(null);
              Navigator.pop(context);
            },
            child: Text(
              context.t.tasks.add_task_modal.erase,
              style: getTextTheme(context).titleMedium!.copyWith(
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
