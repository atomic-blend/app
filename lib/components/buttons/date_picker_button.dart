import 'package:app/components/dialogs/date_picker_dialog.dart';
import 'package:app/components/widgets/elevated_container.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class DatePickerButton extends StatelessWidget {
  final DateTime? date;
  final String title;
  final String? label;
  final double? height;

  final Function(DateTime?)? onDateChanged;
  const DatePickerButton(
      {super.key,
      this.date,
      required this.title,
      this.onDateChanged,
      this.height,
      this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return ABDatePickerDialog(
                initialDate: date?.toLocal(),
                title: title,
                onDateChanged: (value) {
                  onDateChanged?.call(value);
                },
              );
            },
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (label != null)
              Padding(
                padding: EdgeInsets.only(left: $constants.insets.xs),
                child: AutoSizeText(
                  maxLines: 1,
                  label!,
                  style: getTextTheme(context).bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ElevatedContainer(
              height: height ?? 80,
              width: double.infinity,
              padding: EdgeInsets.all($constants.insets.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    maxLines: date != null ? 1 : 2,
                    date != null
                        ? Jiffy.parseFromDateTime(date!)
                            .toLocal()
                            .yMMMEd
                            .capitalize
                        : context.t.habits.add.no_date_selected,
                    style: getTextTheme(context).titleSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  if (date != null)
                    AutoSizeText(
                      maxLines: 1,
                      Jiffy.parseFromDateTime(date ?? DateTime.now())
                          .toLocal()
                          .Hm
                          .capitalize,
                      style: getTextTheme(context).bodyMedium!.copyWith(),
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
