import 'package:app/blocs/tasks/tasks.bloc.dart';
import 'package:app/components/widgets/elevated_container.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/services/sync.service.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SyncStatus extends StatefulWidget {
  final Widget? customButton;
  const SyncStatus({super.key, this.customButton});

  @override
  State<SyncStatus> createState() => _SyncStatusState();
}

class _SyncStatusState extends State<SyncStatus> {
  @override
  Widget build(BuildContext context) {
    if (widget.customButton != null) {
      return widget.customButton!;
    }
    return BlocBuilder<TasksBloc, TasksState>(builder: (context, taskState) {
      return Stack(
        children: [
          GestureDetector(
            onLongPress: () {
              SyncService.sync(context);
            },
            onTap: () {
              if (isDesktop(context)) {
                showDialog(
                  context: context,
                  builder: (context) => Dialog(
                    child: SizedBox(
                        height: getSize(context).height * 0.4,
                        width: getSize(context).width * 0.4,
                        child: _buildSyncModal(context)),
                  ),
                );
              } else {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => SizedBox(
                        height: getSize(context).height * 0.8,
                        child: _buildSyncModal(context)));
              }
            },
            child: ElevatedContainer(
              borderRadius: $constants.corners.full,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  CupertinoIcons.cloud,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 6,
            child: _hasConflictedItems(taskState: taskState)
                ? Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Icon(
                      CupertinoIcons.exclamationmark,
                      size: 8,
                      color: Colors.white,
                    ),
                  )
                : !_isLoading(taskState: taskState)
                    ? Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      )
                    : Container(
                        width: 14,
                        height: 14,
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: getTheme(context).surfaceContainer,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const CircularProgressIndicator(
                          color: Colors.blueAccent,
                          strokeWidth: 3,
                        ),
                      ),
          ),
        ],
      );
    });
  }

  Widget _buildSyncModal(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, taskState) {
        final taskConflictedItems = taskState.conflictedItems;
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.all($constants.insets.sm),
              child: ElevatedContainer(
                padding: EdgeInsets.symmetric(
                    horizontal: $constants.insets.sm,
                    vertical: $constants.insets.xs),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.t.sync.title,
                      style: getTextTheme(context).headlineLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      context.t.sync.description,
                      style: getTextTheme(context).bodyMedium,
                    ),
                    SizedBox(
                      height: $constants.insets.sm,
                    ),
                    Text(
                      context.t.sync.status,
                      style: getTextTheme(context).bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(
                      height: $constants.insets.xxs,
                    ),
                    ElevatedContainer(
                      height: 20,
                      width: double.infinity,
                      color: _isLoading(taskState: taskState)
                          ? Colors.amber
                          : _hasConflictedItems(taskState: taskState)
                              ? Colors.red
                              : Colors.green,
                      child: _isLoading(taskState: taskState)
                          ? Center(
                              child: Text(
                              context.t.sync.loading,
                            ))
                          : _hasConflictedItems(taskState: taskState)
                              ? Center(
                                  child: Text(
                                  context.t.sync.conflicts,
                                  style: const TextStyle(color: Colors.white),
                                ))
                              : Center(
                                  child: Text(
                                  context.t.sync.up_to_date,
                                  style: const TextStyle(color: Colors.white),
                                )),
                    ),
                    SizedBox(
                      height: $constants.insets.xs,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: $constants.insets.sm),
              child: ElevatedContainer(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                    horizontal: $constants.insets.sm,
                    vertical: $constants.insets.xs),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(context.t.sync.details.title,
                        style: getTextTheme(context).headlineMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            )),
                    SizedBox(
                      height: $constants.insets.xxs,
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }

  bool _isLoading({required TasksState taskState}) {
    return taskState.runtimeType == TasksLoading ||
        taskState.runtimeType == TaskSyncInProgress;
  }

  bool _hasConflictedItems({required TasksState taskState}) {
    return taskState.conflictedItems?.isNotEmpty ?? false;
  }
}
