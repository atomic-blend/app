import 'package:app/components/buttons/primary_button_square.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ABMultupleDatePickerDialog extends StatefulWidget {
  final String title;
  final double? height;
  final DateTime? initialDate;
  final Function(List<DateTime>)? onDateChanged;
  const ABMultupleDatePickerDialog(
      {super.key,
      this.height,
      this.onDateChanged,
      required this.title,
      this.initialDate});

  @override
  State<ABMultupleDatePickerDialog> createState() =>
      _ABMultupleDatePickerDialogState();
}

class _ABMultupleDatePickerDialogState
    extends State<ABMultupleDatePickerDialog> {
  List<DateTime>? _dates;

  @override
  void initState() {
    _dates = [widget.initialDate ?? DateTime.now()] as List<DateTime>?;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: EdgeInsets.all($constants.insets.md),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.title,
              style: getTextTheme(context).headlineMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(
              height: widget.height ?? getSize(context).height * 0.25,
              child: SfDateRangePicker(
                selectionMode: DateRangePickerSelectionMode.multiple,
                onSelectionChanged: (dateRangePickerSelectionChangedArgs) {
                  setState(() {
                    _dates = dateRangePickerSelectionChangedArgs.value
                        as List<DateTime>?;
                  });
                },
              ),
            ),
            Row(
              spacing: $constants.insets.xs,
              children: [
                Expanded(
                  child: PrimaryButtonSquare(
                    text: context.t.actions.cancel,
                    outlined: true,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Expanded(
                  child: PrimaryButtonSquare(
                    text: context.t.actions.save,
                    onPressed: () {
                      widget.onDateChanged?.call(_dates!);
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
