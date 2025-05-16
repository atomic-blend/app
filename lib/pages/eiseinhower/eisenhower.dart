import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EisenhowerMatrix extends StatelessWidget {
  const EisenhowerMatrix({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.t.eisenhower.title,
          style: getTextTheme(context).bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: $constants.insets.xs,
          ),
          child: Column(
            spacing: $constants.insets.xs,
            children: [
              Expanded(
                child: Row(
                  spacing: $constants.insets.xs,
                  children: [
                    buildEisenhowerCard(
                        context: context,
                        priority: 3,
                        title: "Urgent & Important",
                        filter: (task) {
                          return task.where((element) => element.priority == 3);
                        }),
                    buildEisenhowerCard(
                        context: context,
                        priority: 2,
                        title: "Not Urgent & Important",
                        filter: (task) {
                          return task.where((element) => element.priority == 2);
                        }),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  spacing: $constants.insets.xs,
                  children: [
                    buildEisenhowerCard(
                        context: context,
                        priority: 1,
                        title: "Urgent & Unimportant",
                        filter: (task) {
                          //TODO: add filter for overdue tasks
                          return task.where((element) => element.priority == 1);
                        }),
                    buildEisenhowerCard(
                        context: context,
                        priority: null,
                        title: "Not Urgent & Unimportant",
                        filter: (task) {
                          return task
                              .where((element) => element.priority == null);
                        }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildEisenhowerCard({
    required BuildContext context,
    required String title,
    required int? priority,
    required Function(List<TaskEntity>) filter,
  }) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all($constants.insets.xs),
        decoration: BoxDecoration(
          color: getTheme(context).surfaceContainer,
          borderRadius: BorderRadius.circular($constants.insets.sm),
        ),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: $constants.insets.xs,
                ),
                Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    color: priority == null || priority == 0
                        ? Colors.grey
                        : priority == 1
                            ? Colors.blueAccent
                            : priority == 2
                                ? Colors.deepOrangeAccent
                                : Colors.red,
                    borderRadius: BorderRadius.circular($constants.insets.sm),
                  ),
                  child: Icon(
                    CupertinoIcons.flag_fill,
                    size: 16,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: $constants.insets.xs,
                ),
                Flexible(
                  child: Text(
                    title,
                    style: getTextTheme(context).bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
