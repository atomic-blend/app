import 'package:app/blocs/tasks/tasks.bloc.dart';
import 'package:app/components/forms/ab_checkbox.dart';
import 'package:app/components/widgets/elevated_container.dart';
import 'package:app/entities/sync/conflicted_item/conflicted_item.dart';
import 'package:app/entities/sync/item_type/item_type.dart';
import 'package:app/entities/sync/patch/patch.dart';
import 'package:app/entities/sync/patch_change/patch_change.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/pages/sync_status/items_ui/task/task_detail_card.dart';
import 'package:app/pages/sync_status/items_ui/task/task_patch_card.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiffy/jiffy.dart';

class ConflictResolver extends StatefulWidget {
  const ConflictResolver({super.key});

  @override
  State<ConflictResolver> createState() => _ConflictResolverState();
}

class _ConflictResolverState extends State<ConflictResolver> {
  int _selectedIndex = 0;
  bool _applyToAll = false;

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
          final patches = <Patch>[];
          final conflicts = <ConflictedItem>[];
          if (taskState.latestSync?.conflicts != null) {
            conflicts.addAll(taskState.latestSync!.conflicts);
            patches.addAll(taskState.stagedPatches ?? []);
          }
          final patch = patches.firstWhereOrNull(
              (p) => p.id == conflicts[_selectedIndex].patchId);
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: $constants.insets.sm,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.t.sync.conflict_resolver.progress,
                  style: getTextTheme(context).bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Stack(
                  children: [
                    ElevatedContainer(
                      height: 50,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: $constants.insets.sm,
                          horizontal: $constants.insets.sm,
                        ),
                        child: LinearProgressIndicator(
                          value: _selectedIndex / conflicts.length,
                          borderRadius: BorderRadius.circular(10),
                          backgroundColor: Colors.grey[300],
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    Positioned(
                        top: 0,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Center(
                            child: Text(
                                "${_selectedIndex + 1} / ${conflicts.length}")))
                  ],
                ),
                SizedBox(
                  height: $constants.insets.sm,
                ),
                Text(
                  context.t.sync.conflict_resolver.in_app_version,
                  style: getTextTheme(context).bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedContainer(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          vertical: $constants.insets.sm,
                          horizontal: $constants.insets.sm,
                        ),
                        child: Column(
                          children: [
                            _getItemUi(context, patch!.itemType, patch.itemId)
                          ],
                        ),
                      ),
                      SizedBox(
                        height: $constants.insets.sm,
                      ),
                      Text(context.t.sync.conflict_resolver.changes_to_apply,
                          style: getTextTheme(context).bodyLarge!.copyWith(
                                fontWeight: FontWeight.bold,
                              )),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: getSize(context).height * 0.12,
                        ),
                        child: ElevatedContainer(
                          width: double.infinity,
                          child: Column(
                            children: [
                              SizedBox(
                                height: $constants.insets.sm,
                              ),
                              _getPatchChanges(patch.itemType, patch.changes),
                              SizedBox(
                                height: $constants.insets.sm,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: $constants.insets.sm,
                ),
                Text(
                  context.t.sync.conflict_resolver.choose_between,
                  style: getTextTheme(context).bodyLarge!.copyWith(),
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ABCheckbox(
                      size: 23,
                      value: _applyToAll,
                      onChanged: (value) {
                        setState(() {
                          _applyToAll = value!;
                        });
                      },
                    ),
                    SizedBox(
                      width: $constants.insets.xs,
                    ),
                    Text(context.t.sync.conflict_resolver.apply_to_all,
                        style: getTextTheme(context).bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            )),
                  ],
                ),
                SizedBox(
                  height: $constants.insets.xs,
                ),
                Row(
                  spacing: $constants.insets.sm,
                  children: [
                    Expanded(
                      child: ElevatedContainer(
                        padding: EdgeInsets.symmetric(
                          vertical: $constants.insets.sm,
                        ),
                        color: getTheme(context).error.withValues(alpha: 0.8),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              CupertinoIcons.xmark,
                              size: 70,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: $constants.insets.xs,
                            ),
                            Text(context.t.sync.conflict_resolver.refuse,
                                style:
                                    getTextTheme(context).bodyLarge!.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        )),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ElevatedContainer(
                        padding: EdgeInsets.symmetric(
                          vertical: $constants.insets.sm,
                        ),
                        color: getTheme(context).primary.withValues(alpha: 0.8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              CupertinoIcons.check_mark,
                              size: 70,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: $constants.insets.xs,
                            ),
                            Text(context.t.sync.conflict_resolver.accept,
                                style:
                                    getTextTheme(context).bodyLarge!.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        )),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        }),
      ),
    );
  }

  _buildConflictListCard(
      BuildContext context, ConflictedItem conflict, List<Patch> patches) {
    final patch = patches.firstWhere(
      (change) => change.id == conflict.patchId,
    );
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: $constants.insets.sm,
      ),
      child: ElevatedContainer(
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.t.sync.conflict_resolver
                          .item_type[conflict.type.name] ??
                      conflict.type.name,
                  style: getTextTheme(context).bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  context.t.sync.conflict_resolver.patch_date(
                    date: Jiffy.parseFromDateTime(patch.patchDate)
                        .toLocal()
                        .yMMMEd,
                  ),
                )
              ],
            ),
          ],
        ),
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

  _getPatchChanges(ItemType type, List<PatchChange> changes) {
    switch (type) {
      case ItemType.task:
        return TaskPatchCard(
          changes: changes,
        );
      case ItemType.note:
        // Handle note patch changes if needed
        return SizedBox.shrink();
      default:
        // Handle other item types if needed
        return SizedBox.shrink();
    }
  }

  _forcePatch(BuildContext context, Patch patch) {
    switch (patch.itemType) {
      case ItemType.task:
        context.read<TasksBloc>().add(
              ForceTaskPatch(patch),
            );
        break;
      case ItemType.note:
        // Handle note patching if needed
        break;
      default:
        // Handle other item types if needed
        break;
    }
  }

  _discardPatch(BuildContext context, Patch patch) {
    switch (patch.itemType) {
      case ItemType.task:
        context.read<TasksBloc>().add(
              DiscardTaskPatch(patch),
            );
        break;
      case ItemType.note:
        // Handle note patching if needed
        break;
      default:
        // Handle other item types if needed
        break;
    }
  }

  _getItemUi(BuildContext context, ItemType type, String itemId) {
    switch (type) {
      case ItemType.task:
        final taskState = context.watch<TasksBloc>().state;
        final task = taskState.tasks?.firstWhereOrNull((t) => t.id == itemId);
        if (task == null) {
          return SizedBox.shrink(); // Placeholder for missing task
        }
        return TaskDetailCard(
          taskEntity: task,
        );
      case ItemType.note:
        // Return NoteCard or similar widget for notes
        return SizedBox.shrink(); // Placeholder for note UI
      default:
        return SizedBox.shrink(); // Placeholder for other item types
    }
  }
}
