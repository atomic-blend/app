import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class ABCheckbox extends StatelessWidget {
  final bool? value;
  final Function(bool?)? onChanged;
  const ABCheckbox({super.key, this.value, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(
        value == true
            ? CupertinoIcons.checkmark_square_fill
            : CupertinoIcons.square,
        size: 20,
      ),
      onTap: () {
        if (onChanged != null) {
          onChanged!(value == null ? true : !value!);
        }
      },
    );
    return Checkbox(
        value: value ?? false,
        onChanged: (newValue) {
          if (onChanged != null) {
            onChanged!(newValue);
          }
        });
  }
}
