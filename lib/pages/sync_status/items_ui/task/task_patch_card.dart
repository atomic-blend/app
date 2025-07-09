import 'package:app/entities/sync/patch_change/patch_change.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class TaskPatchCard extends StatelessWidget {
  final List<PatchChange>? changes;
  const TaskPatchCard({super.key, this.changes});

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[];
    for (var change in changes ?? []) {
      switch (change.key) {
        case "title":
          items.add(_buildTaskFieldItem(
            context,
            CupertinoIcons.textformat_alt,
            context.t.sync.conflict_resolver.fields["title"]!,
            change.value as String?,
          ));
          break;
        case "description":
          items.add(_buildTaskFieldItem(
            context,
            CupertinoIcons.doc_text,
            context.t.sync.conflict_resolver.fields["description"]!,
            change.value as String?,
          ));
          break;
        case "completed":
          items.add(_buildTaskFieldItem(
            context,
            CupertinoIcons.checkmark_alt,
            context.t.sync.conflict_resolver.fields["completed"]!,
            change.value == true
                ? context.t.sync.conflict_resolver.fields["yes"]
                : context.t.sync.conflict_resolver.fields["no"],
          ));
          break;
        case "priority":
          items.add(_buildTaskFieldItem(
            context,
            CupertinoIcons.flag,
            context.t.sync.conflict_resolver.fields["priority"]!,
            change.value as String?,
          ));
          break;
        case "startDate":
          items.add(_buildTaskFieldItem(
            context,
            CupertinoIcons.calendar,
            context.t.sync.conflict_resolver.fields["start_date"]!,
            change.value != null
                ? Jiffy.parseFromDateTime(change.value).yMMMMdjm
                : null,
          ));
          break;
        case "endDate":
          items.add(_buildTaskFieldItem(
            context,
            CupertinoIcons.calendar,
            context.t.sync.conflict_resolver.fields["end_date"]!,
            change.value != null ? Jiffy.parse(change.value).yMMMMdjm : null,
          ));
          break;
        case "reminders":
          items.add(_buildTaskFieldItem(
            context,
            CupertinoIcons.alarm,
            context.t.sync.conflict_resolver.fields["reminders_title"]!,
            change.value != null
                ? context.t.sync.conflict_resolver.fields["reminders"]!(
                    n: (change.value as List).length)
                : null,
          ));
          break;
        case "tags":
          final tags =
              (change.value as List?)?.map((e) => e.toString()).join(", ");
          items.add(_buildTaskFieldItem(
            context,
            CupertinoIcons.tag,
            context.t.sync.conflict_resolver.fields["tags"]!,
            tags,
          ));
          break;
        case "folderId":
          items.add(_buildTaskFieldItem(
            context,
            CupertinoIcons.folder,
            context.t.sync.conflict_resolver.fields["folder"]!,
            change.value != null ? "Change" : null,
          ));
          break;
      }
    }

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: $constants.insets.sm,
      ),
      child: SingleChildScrollView(
        child: Column(
          spacing: $constants.insets.xs,
          children: items,
        ),
      ),
    );
  }

  _buildTaskFieldItem(
      BuildContext context, IconData icon, String fieldName, String? value) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(
          width: $constants.insets.xs,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            fieldName,
            style: getTextTheme(context).bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          if (value != null)
            Text(
              value,
            )
          else
            Text(
              context.t.sync.conflict_resolver.fields["undefined"]!,
              style: getTextTheme(context).bodyMedium!.copyWith(
                    fontStyle: FontStyle.italic,
                    color: Colors.grey,
                  ),
            ),
        ]),
      ],
    );
  }
}
