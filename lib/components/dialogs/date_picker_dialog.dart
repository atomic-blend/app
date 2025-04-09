import 'package:app/components/buttons/primary_button_square.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ABDatePickerDialog extends StatefulWidget {
  final String title;
  final double? height;
  final DateTime? initialDate;
  final Function(DateTime)? onDateChanged;
  const ABDatePickerDialog(
      {super.key,
      this.height,
      this.onDateChanged,
      required this.title,
      this.initialDate});

  @override
  State<ABDatePickerDialog> createState() => _ABDatePickerDialogState();
}

class _ABDatePickerDialogState extends State<ABDatePickerDialog> {
  DateTime? _date;

  @override
  void initState() {
    _date = widget.initialDate?.toLocal() ?? DateTime.now();
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
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.dateAndTime,
                use24hFormat: true,
                initialDateTime: _date,
                onDateTimeChanged: (DateTime value) {
                  setState(() {
                    _date = value;
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
                      widget.onDateChanged!(_date!.toUtc());
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
