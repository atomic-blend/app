import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTagModal extends StatefulWidget {
  const AddTagModal({super.key});

  @override
  State<AddTagModal> createState() => _AddTagModalState();
}

class _AddTagModalState extends State<AddTagModal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).viewInsets.bottom +
          getSize(context).height * 0.88,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular($constants.corners.lg),
          topRight: Radius.circular($constants.corners.lg),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: $constants.insets.sm,
          vertical: $constants.insets.md,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    CupertinoIcons.back,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    context.t.actions.save,
                    style: getTextTheme(context).bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: getTheme(context).primary,
                        ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: $constants.insets.sm,
            ),
            AutoSizeText(
              maxLines: 1,
              context.t.tags.add_modal.title,
              style: getTextTheme(context).titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
