import 'package:app/blocs/tasks/tasks.bloc.dart';
import 'package:app/components/widgets/elevated_container.dart';
import 'package:app/entities/sync/conflicted_item/conflicted_item.dart';
import 'package:app/entities/sync/item_type/item_type.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConflictResolver extends StatefulWidget {
  const ConflictResolver({super.key});

  @override
  State<ConflictResolver> createState() => _ConflictResolverState();
}

class _ConflictResolverState extends State<ConflictResolver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.t.sync.conflict_resolver.title,
          style: getTextTheme(context).bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: SafeArea(
        child:
            BlocBuilder<TasksBloc, TasksState>(builder: (context, taskState) {
          final conflicts = [];
          if (taskState.latestSync?.conflicts != null) {
            conflicts.addAll(taskState.latestSync!.conflicts);
          }
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: $constants.insets.sm,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: getSize(context).height * 0.4,
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedContainer(
                          child: Column(
                            children: [
                              Text(
                                "Local Version",
                                style:
                                    getTextTheme(context).bodyMedium!.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: $constants.insets.sm,
                      ),
                      Expanded(
                        child: ElevatedContainer(
                          child: Column(
                            children: [
                              Text("Cloud Version",
                                  style: getTextTheme(context)
                                      .bodyMedium!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                      )),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Text("choose between which version to keep",
                    style: getTextTheme(context).bodyMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                        )),
                SizedBox(
                  height: $constants.insets.sm,
                ),
                Expanded(
                  child: ElevatedContainer(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Text("Conflicting Changes",
                            style: getTextTheme(context).bodyLarge!.copyWith(
                                  fontWeight: FontWeight.bold,
                                )),
                        ...conflicts
                            .map((conflict) =>
                                _buildConflictListCard(context, conflict))
                            .toList(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  _buildConflictListCard(BuildContext context, ConflictedItem conflict) {
    return ElevatedContainer(
      padding: EdgeInsets.symmetric(
        horizontal: $constants.insets.sm,
        vertical: $constants.insets.xs,
      ),
      color: getTheme(context).surface,
      child: Row(
        children: [
          Icon(
            _getConflictIcon(conflict.type),
          ),
          SizedBox(
            width: $constants.insets.sm,
          ),
          Column(
            children: [
              Text(conflict.type.name),
              Text(
                conflict.localItem?["updatedAt"] ?? "",
              )
            ],
          ),
        ],
      ),
    );
  }

  _getConflictIcon(ItemType type) {
    switch (type) {
      case ItemType.note:
        return Icons.note;
      case ItemType.task:
        return Icons.check_box;
      default:
        return Icons.help_outline;
    }
  }
}
