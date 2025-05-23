import 'package:app/blocs/folder/folder.bloc.dart';
import 'package:app/blocs/tasks/tasks.bloc.dart';
import 'package:app/components/buttons/icon_text_pill.dart';
import 'package:app/components/buttons/task_item.dart';
import 'package:app/components/widgets/elevated_container.dart';
import 'package:app/entities/folder/folder.entity.dart';
import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/pages/folder/my_folders.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/sync.service.dart';

class FoldersView extends StatefulWidget {
  const FoldersView({super.key});

  @override
  State<FoldersView> createState() => _FoldersViewState();
}

class _FoldersViewState extends State<FoldersView> {
  final List<Folder> _filteredFolders = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(builder: (context, taskState) {
      return BlocBuilder<FolderBloc, FolderState>(
          builder: (context, folderState) {
        final filteredTasks = _getFilteredTasks(context, taskState.tasks)
            .map((task) => TaskItem(task: task));
        return Padding(
          padding: isDesktop(context)
              ? EdgeInsets.only(
                  right: $constants.insets.sm,
                  left: $constants.insets.xs,
                  bottom: $constants.insets.sm,
                )
              : EdgeInsets.only(
                  right: $constants.insets.sm,
                  left: $constants.insets.sm,
                  bottom: $constants.insets.sm,
                ),
          child: RefreshIndicator(
            onRefresh: () {
              SyncService.sync(context);
              return Future.delayed(const Duration(seconds: 1));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedContainer(
                  padding: EdgeInsets.symmetric(
                    horizontal: $constants.insets.sm,
                    vertical: $constants.insets.sm,
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: $constants.insets.xxs),
                            child: AutoSizeText(
                              context.t.tasks.my_folders,
                              style: getTextTheme(context).titleSmall!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          SizedBox(
                            width: $constants.insets.sm,
                          ),
                          GestureDetector(
                            onTap: () {
                              _showMyFolderModal(context);
                            },
                            child: Text(
                              context.t.actions.edit,
                              style: getTextTheme(context).bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: getTheme(context).primary,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: $constants.insets.xxs,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          if (_filteredFolders.isNotEmpty)
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  _filteredFolders.clear();
                                });
                              },
                              child: Text(
                                context.t.actions.clear,
                                style:
                                    getTextTheme(context).bodyMedium!.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey.shade800,
                                        ),
                              ),
                            ),
                          ...(folderState.folders ?? [])
                              .map((folder) => GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _filteredFolders.add(folder);
                                      });
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          right: $constants.insets.xs),
                                      child: IconTextPill(
                                        outlined: _filteredFolders
                                            .map((e) => e.id)
                                            .contains(folder.id),
                                        title: folder.name,
                                        icon: null,
                                        color: folder.color != null
                                            ? hexToColor(folder.color!)
                                                .withValues(alpha: 0.2)
                                            : null,
                                      ),
                                    ),
                                  )),
                          if (folderState.folders == null ||
                              folderState.folders!.isEmpty)
                            GestureDetector(
                              onTap: () {
                                _showMyFolderModal(context);
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                  right: $constants.insets.xxs,
                                  left: $constants.insets.xxs,
                                ),
                                child: AutoSizeText(
                                  context.t.tasks.folders.no_folders,
                                  style: getTextTheme(context)
                                      .bodyMedium!
                                      .copyWith(),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: $constants.insets.xs),
                Expanded(
                  child: ElevatedContainer(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: $constants.insets.sm,
                      vertical: $constants.insets.sm,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (filteredTasks.isEmpty)
                          Expanded(
                            child: AutoSizeText(
                              context.t.tasks.no_tasks_for_now,
                              style:
                                  getTextTheme(context).bodyMedium!.copyWith(),
                            ),
                          ),
                        ...filteredTasks
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      });
    });
  }

  List<TaskEntity> _getFilteredTasks(
      BuildContext context, List<TaskEntity>? tasks) {
    if (tasks == null) {
      return [];
    }
    tasks = tasks.where((task) => task.completed != true).toList();
    if (_filteredFolders.isEmpty) {
      return tasks;
    }
    return tasks.where((task) {
      for (var folder in _filteredFolders) {
        if (task.folderId != null && task.folderId == folder.id) {
          return true;
        }
      }
      return false;
    }).toList();
  }

  _showMyFolderModal(BuildContext context) {
    if (isDesktop(context)) {
      showDialog(
        context: context,
        builder: (context) => Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: $constants.insets.xs),
          child: SizedBox(
            height: getSize(context).height * 0.7,
            width: getSize(context).width,
            child: ClipRRect(
              borderRadius: BorderRadius.circular($constants.corners.md),
              child: const MyFolders(),
            ),
          ),
        ),
      );
    } else {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => SizedBox(
          height: getSize(context).height * 0.8,
          child: ClipRRect(
            borderRadius: BorderRadius.circular($constants.corners.md),
            child: const MyFolders(),
          ),
        ),
      );
    }
  }
}
