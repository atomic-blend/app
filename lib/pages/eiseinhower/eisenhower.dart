import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
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
                        title: "Urgent & Important",
                        accentColor: Colors.red,
                        filter: (task) {
                          return task.where((element) => element.priority == 3);
                        }),
                    buildEisenhowerCard(
                        context: context,
                        title: "Not Urgent & Important",
                        accentColor: Colors.red,
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
                        title: "Urgent & Unimportant",
                        accentColor: Colors.red,
                        filter: (task) {
                          //TODO: add filter for overdue tasks
                          return task.where((element) => element.priority == 1);
                        }),
                    buildEisenhowerCard(
                        context: context,
                        title: "Not Urgent & Unimportant",
                        accentColor: Colors.red,
                        filter: (task) {
                          return task.where((element) => element.priority == 0);
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
    required Color accentColor,
    required Function(List<TaskEntity>) filter,
  }) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: getTheme(context).surfaceContainer,
          borderRadius: BorderRadius.circular($constants.insets.sm),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(title),
              ],
            )
          ],
        ),
      ),
    );
  }
}
