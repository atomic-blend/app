import 'package:ab_shared/utils/shortcuts.dart';
import 'package:app/blocs/tasks/tasks.bloc.dart';
import 'package:app/components/buttons/task_item.dart';
import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/pages/tasks/task_detail.dart';
import 'package:app/services/sync.service.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:go_router/go_router.dart';

part 'search.g.dart';

@TypedGoRoute<SearchRoute>(path: '/search', name: "search")
class SearchRoute extends GoRouteData with _$SearchRoute {
  final String? q;

  SearchRoute({this.q});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Search(query: q);
  }
}

class Search extends StatefulWidget {
  const Search({super.key, this.query});

  final String? query;

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _searchController = TextEditingController();
  TaskEntity? _selectedTask;
  List<TaskEntity> _searchResults = [];

  @override
  void initState() {
    super.initState();
    SyncService.sync(context);
    _searchController.text = widget.query ?? "";
    _searchNotes(context.read<TasksBloc>().state.tasks ?? [], widget.query);
  }

  @override
  void didUpdateWidget(Search oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.query != widget.query) {
      _searchController.text = widget.query ?? "";
      _searchNotes(context.read<TasksBloc>().state.tasks ?? [], widget.query);
    }
  }

  void _searchNotes(List<TaskEntity> notes, String? query) {
    if (query == null || query.isEmpty) {
      _searchResults = notes;
    } else {
      _searchResults = notes
          .where((note) =>
              note.title.toLowerCase().contains(query.toLowerCase()) ||
              (note.description?.toLowerCase().contains(query.toLowerCase()) ??
                  false))
          .toList();
    }
    setState(() {});
  }

  List<TaskEntity> _search(List<TaskEntity> tasks) {
    if (widget.query == null || widget.query!.isEmpty) {
      return tasks;
    } else {
      return _searchResults;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(builder: (context, taskState) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: $constants.insets.sm),
        child: Row(
          children: [
            SizedBox(
              width: isDesktop(context)
                  ? getSize(context).width > $constants.screenSize.md
                      ? 350
                      : getSize(context).width * 0.66
                  : getSize(context).width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ..._search(taskState.tasks ?? []).sorted((a, b) {
                    if (a.createdAt == null || b.createdAt == null) return 0;
                    return b.createdAt!.compareTo(a.createdAt!);
                  }).map((note) {
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: $constants.insets.xs,
                      ),
                      child: TaskItem(
                          task: note,
                          onTap: () {
                            if (isDesktop(context)) {
                              setState(() {
                                _selectedTask = note;
                              });
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TaskDetail(task: note)),
                              );
                            }
                          }),
                    );
                  }),
                ],
              ),
            ),
            if (isDesktop(context) &&
                getSize(context).width > $constants.screenSize.md &&
                _selectedTask != null) ...[
              SizedBox(width: $constants.insets.xs),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(
                    right: $constants.insets.xs,
                    bottom: $constants.insets.xs,
                  ),
                  child: TaskDetail(
                      key: ValueKey(_selectedTask!.id),
                      task: _selectedTask!,
                      onCancel: () {
                        if (isDesktop(context)) {
                          setState(() {
                            _selectedTask = null;
                          });
                        } else {
                          Navigator.pop(context);
                        }
                      }),
                ),
              ),
            ]
          ],
        ),
      );
    });
  }
}
