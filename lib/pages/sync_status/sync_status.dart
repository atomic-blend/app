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
                    builder: (context) => _buildSyncModal(context));
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
            child: !_hasConflictedItems(taskState: taskState)
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
            Text(
              context.t.sync.title,
              style: getTextTheme(context).headlineMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              context.t.sync.description,
              style: getTextTheme(context).bodyMedium,
            ),
            Text(
              context.t.sync.offline_first,
              style: getTextTheme(context).bodyMedium!.copyWith(
                    color: CupertinoColors.systemGrey,
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
