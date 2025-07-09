import 'package:flutter/cupertino.dart';

class ABCheckbox extends StatelessWidget {
  final bool? value;
  final double? size;
  final Function(bool?)? onChanged;
  const ABCheckbox({super.key, this.value, this.onChanged, this.size});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(
        value == true
            ? CupertinoIcons.checkmark_square_fill
            : CupertinoIcons.square,
        size: size ?? 20,
      ),
      onTap: () {
        if (onChanged != null) {
          onChanged!(value == null ? true : !value!);
        }
      },
    );
  }
}
