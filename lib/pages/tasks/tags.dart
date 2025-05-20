import 'package:app/blocs/tag/tag.bloc.dart';
import 'package:app/blocs/tasks/tasks.bloc.dart';
import 'package:app/components/buttons/icon_text_pill.dart';
import 'package:app/components/buttons/task_item.dart';
import 'package:app/entities/tag/tag.entity.dart';
import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/pages/tags/my_tags.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/sync.service.dart';

class TagsView extends StatefulWidget {
  const TagsView({super.key});

  @override
  State<TagsView> createState() => _TagsViewState();
}

class _TagsViewState extends State<TagsView> {
  final List<TagEntity> _filteredTags = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(builder: (context, taskState) {
      return BlocBuilder<TagBloc, TagState>(builder: (context, tagState) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: $constants.insets.xs,
            vertical: $constants.insets.xs,
          ),
          child: RefreshIndicator(
            onRefresh: () {
              SyncService.sync(context);
              return Future.delayed(const Duration(seconds: 1));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: getTheme(context).surfaceContainer,
                    borderRadius: BorderRadius.circular($constants.insets.sm),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: $constants.insets.xs,
                    vertical: $constants.insets.xs,
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
                              context.t.tasks.my_tags,
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const MyTags()));
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
                        height: $constants.insets.xs,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          if (_filteredTags.isNotEmpty)
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  _filteredTags.clear();
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
                          ...(tagState.tags ?? []).map((tag) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _filteredTags.add(tag);
                                  });
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      right: $constants.insets.xs),
                                  child: IconTextPill(
                                    outlined: _filteredTags
                                        .map((e) => e.id)
                                        .contains(tag.id),
                                    title: tag.name,
                                    icon: null,
                                    color: tag.color != null
                                        ? hexToColor(tag.color!)
                                            .withValues(alpha: 0.2)
                                        : null,
                                  ),
                                ),
                              )),
                          if (tagState.tags == null || tagState.tags!.isEmpty)
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const MyTags()));
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                  right: $constants.insets.xxs,
                                  left: $constants.insets.xxs,
                                ),
                                child: AutoSizeText(
                                  context.t.tasks.no_tags_for_now,
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
                SizedBox(
                  height: $constants.insets.xs,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: getTheme(context).surfaceContainer,
                      borderRadius: BorderRadius.circular($constants.insets.sm),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: $constants.insets.xs,
                      vertical: $constants.insets.xs,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // AutoSizeText(
                        //   context.t.tasks.title,
                        //   style: getTextTheme(context).titleMedium!.copyWith(
                        //         fontWeight: FontWeight.bold,
                        //       ),
                        // ),
                        ..._getFilteredTasks(context, taskState.tasks)
                            .map((task) => TaskItem(task: task)),
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
    if (_filteredTags.isEmpty) {
      return tasks;
    }
    return tasks.where((task) {
      for (var tag in _filteredTags) {
        if (task.tags?.map((e) => e.id).contains(tag.id) == true) {
          return true;
        }
      }
      return false;
    }).toList();
  }
}
