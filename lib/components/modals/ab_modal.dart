import 'package:ab_shared/components/buttons/primary_button_square.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:flutter/material.dart';


class ABModal extends StatefulWidget {
  final String title;
  final String? description;
  final String? warning;
  final String? confirmText;
  final String? cancelText;
  final Color? confirmColor;
  final Color? confirmTextColor;
  final Color? cancelColor;

  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  const ABModal(
      {super.key,
      required this.title,
      this.description,
      this.warning,
      this.onConfirm,
      this.confirmText,
      this.cancelText,
      this.confirmColor,
      this.confirmTextColor,
      this.cancelColor,
      this.onCancel});

  @override
  State<ABModal> createState() => _ABModalState();
}

class _ABModalState extends State<ABModal> {
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
                      widget.onCancel?.call();
                      if (widget.onCancel == null) {
                        Navigator.pop(context, false);
                      }
                    },
                    text: widget.cancelText ?? context.t.actions.cancel,
                    textColor: Colors.black,
                    backgroundColor: widget.cancelColor ?? Colors.white,
                  ),
                ),
                SizedBox(
                  width: $constants.insets.md,
                ),
                Expanded(
                  child: PrimaryButtonSquare(
                    onPressed: () async {
                      widget.onConfirm?.call();
                      if (widget.onConfirm == null) {
                        Navigator.pop(context, true);
                      }
                    },
                    text: widget.confirmText ?? context.t.actions.delete,
                    backgroundColor:
                        widget.confirmColor ?? getTheme(context).error,
                    textColor: widget.confirmTextColor ?? Colors.white,
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
