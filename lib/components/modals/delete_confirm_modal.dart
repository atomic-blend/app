import 'package:app/components/buttons/primary_button_square.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../utils/shortcuts.dart';

class DeleteConfirmModal extends StatefulWidget {
  final String title;
  final String? description;
  final String? warning;

  final VoidCallback? onDelete;
  const DeleteConfirmModal(
      {super.key,
      required this.title,
      this.description,
      this.warning,
      this.onDelete});

  @override
  State<DeleteConfirmModal> createState() => _DeleteConfirmModalState();
}

class _DeleteConfirmModalState extends State<DeleteConfirmModal> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: getTheme(context).surfaceContainer,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: $constants.insets.md,
          vertical: $constants.insets.md,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: getTextTheme(context)
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            if (widget.description != null) ...[
              SizedBox(
                height: $constants.insets.sm,
              ),
              Text(
                widget.description!,
                style: getTextTheme(context).bodyMedium!.copyWith(),
              ),
            ],
            if (widget.warning != null) ...[
              SizedBox(
                height: $constants.insets.xs,
              ),
              Text(
                widget.warning!,
                style: getTextTheme(context).bodyMedium!.copyWith(
                      color: getTheme(context).error,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
            SizedBox(
              height: $constants.insets.md,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: PrimaryButtonSquare(
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    text: context.t.actions.cancel,
                    textColor: Colors.black,
                    backgroundColor: Colors.white,
                  ),
                ),
                SizedBox(
                  width: $constants.insets.md,
                ),
                Expanded(
                  child: PrimaryButtonSquare(
                    onPressed: () async {
                      widget.onDelete?.call();
                      Navigator.pop(context, true);
                    },
                    text: context.t.actions.delete,
                    backgroundColor: getTheme(context).error,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
