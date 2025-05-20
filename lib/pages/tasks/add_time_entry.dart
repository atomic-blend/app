import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTimeEntry extends StatefulWidget {
  const AddTimeEntry({super.key});

  @override
  State<AddTimeEntry> createState() => _AddTimeEntryState();
}

class _AddTimeEntryState extends State<AddTimeEntry> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: $constants.insets.sm,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: $constants.insets.xs,
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Container(
                      padding: EdgeInsets.all($constants.insets.xxs),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(100)),
                      child: const Icon(CupertinoIcons.xmark))),
              SizedBox(
                width: $constants.insets.xs,
              ),
              Expanded(
                child: AutoSizeText(
                  maxLines: 1,
                  context.t.tasks.add_time_entry.title,
                  style: getTextTheme(context).headlineLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: $constants.insets.sm),
            child: Column(
              children: [
                Text(
                  context.t.tasks.add_time_entry.description,
                ),
                SizedBox(
                  height: $constants.insets.sm,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
