import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:jiffy/jiffy.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class PopupDatePickerFormField extends StatefulWidget {
  final double? width;
  final Function(DateTime) onDateChanged;
  final String labelText;
  final String hintText;
  final DateTime? value;
  final DateTime? firstDate;
  final DateTime? lastDate;
  const PopupDatePickerFormField(
      {super.key,
      required this.labelText,
      required this.hintText,
      this.width,
      required this.onDateChanged,
      this.value,
      this.firstDate,
      this.lastDate});

  @override
  State<PopupDatePickerFormField> createState() =>
      _PopupDatePickerFormFieldState();
}

class _PopupDatePickerFormFieldState extends State<PopupDatePickerFormField> {
  DateTime? date;

  @override
  void initState() {
    if (widget.value != null) {
      date = widget.value;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPopup(
      content: SizedBox(
        height: getSize(context).height * 0.4,
        child: SfDateRangePicker(
          headerStyle: DateRangePickerHeaderStyle(
            backgroundColor: Colors.transparent,
            textStyle: getTextTheme(context).titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          backgroundColor: Colors.transparent,
          onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
            setState(() {
              date = args.value;
            });
            widget.onDateChanged(date!);
          },
          selectionMode: DateRangePickerSelectionMode.single,
          initialSelectedDate: date,
          minDate: widget.firstDate ??
              Jiffy.parseFromDateTime(DateTime.now())
                  .subtract(years: 100)
                  .dateTime,
          maxDate: widget.lastDate ??
              Jiffy.parseFromDateTime(DateTime.now()).add(years: 100).dateTime,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelText,
            style: getTextTheme(context)
                .titleMedium!
                .copyWith(color: Colors.grey.shade500),
          ),
          Container(
            height: 50,
            width: widget.width,
            padding: EdgeInsets.fromLTRB(
                $constants.insets.sm, 0, $constants.insets.sm, 0),
            decoration: BoxDecoration(
              color: getTheme(context).surfaceContainerHigh,
              borderRadius: BorderRadius.circular($constants.insets.sm),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    date == null
                        ? widget.hintText
                        : Jiffy.parseFromDateTime(date!).yMMMd,
                    style: getTextTheme(context).bodyLarge!),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
