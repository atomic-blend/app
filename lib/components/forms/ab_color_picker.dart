import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';

class AbColorPicker extends StatelessWidget {
  final String? labelText;
  final String? labelDescription;
  final Color? color;
  final Function(Color)? onColorChanged;

  const AbColorPicker(
      {super.key,
      this.labelText,
      this.labelDescription,
      this.onColorChanged,
      this.color});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (labelText != null)
            Text(
              labelText!,
              style: getTextTheme(context).bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          if (labelDescription != null)
            Text(
              labelDescription!,
              style: getTextTheme(context).bodySmall!.copyWith(
                    color: Colors.grey[700],
                  ),
            ),
          SizedBox(
            height: $constants.insets.xxs,
          ),
          ColorPicker(
            color: color ?? Colors.blue,
            padding: EdgeInsets.zero,
            enableShadesSelection: false,
            pickersEnabled: const <ColorPickerType, bool>{
              ColorPickerType.both: false,
              ColorPickerType.primary: true,
              ColorPickerType.accent: true,
              ColorPickerType.wheel: true,
              ColorPickerType.custom: false,
            },
            pickerTypeLabels: <ColorPickerType, String>{
              ColorPickerType.primary: context.t.tags.add_modal.primary,
              ColorPickerType.accent: context.t.tags.add_modal.accent,
              ColorPickerType.wheel: context.t.tags.add_modal.wheel,
            },
            onColorChanged: (color) {
              onColorChanged?.call(color);
            },
          ),
        ],
      );
    });
  }
}
