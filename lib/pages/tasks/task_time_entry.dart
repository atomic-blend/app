import 'package:app/entities/time_entry/time_entry.entity.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/pages/tasks/add_time_entry.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/material.dart';

class TaskTimeEntries extends StatelessWidget {
  final List<TimeEntry>? timeEntries;

  const TaskTimeEntries({super.key, this.timeEntries});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              context.t.tasks.time_spent,
            ),
            SizedBox(
              width: $constants.insets.xs,
            ),
            GestureDetector(
              onTap: () {
                if (isDesktop(context)) {
                  showDialog(
                      context: context,
                      builder: (context) => const Dialog(
                            child: AddTimeEntry(),
                          ));
                } else {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => SizedBox(
                        height: getSize(context).height * 0.4,
                        width: double.infinity,
                        child: const AddTimeEntry()),
                  );
                }
              },
              child: Text(
                context.t.actions.add,
                style: getTextTheme(context).labelMedium!.copyWith(
                      color: getTheme(context).primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            )
          ],
        ),
        SizedBox(
          height: $constants.insets.xs,
        ),
        if (timeEntries == null || timeEntries!.isEmpty)
          Text(
            context.t.tasks.no_time_entries,
            style:
                getTextTheme(context).bodyMedium!.copyWith(color: Colors.grey),
          ),
        if (timeEntries != null && timeEntries!.isNotEmpty)
          SingleChildScrollView(
            child: Column(
              children: [
                ...?timeEntries?.map((timeEntry) => Container(
                      child: Text("entry"),
                    ))
              ],
            ),
          )
      ],
    );
  }
}
