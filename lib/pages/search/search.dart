import 'package:app/blocs/habit/habit.bloc.dart';
import 'package:app/blocs/tag/tag.bloc.dart';
import 'package:app/blocs/tasks/tasks.bloc.dart';
import 'package:app/components/buttons/task_item.dart';
import 'package:app/components/forms/search_bar.dart';
import 'package:app/components/widgets/elevated_container.dart';
import 'package:app/entities/habit/habit.entity.dart';
import 'package:app/entities/tag/tag.entity.dart';
import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/pages/tasks/task_detail.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Search extends StatefulWidget {
  final String? searchQuery;
  const Search({super.key, this.searchQuery});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _searchController = TextEditingController();
  List<Widget> _searchResults = [];

  @override
  void initState() {
    super.initState();
    if (widget.searchQuery != null) {
      _searchController.text = widget.searchQuery!;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _updateSearchResults(
          query: widget.searchQuery,
          tasks: context.read<TasksBloc>().state.tasks,
          tags: context.read<TagBloc>().state.tags,
          habits: context.read<HabitBloc>().state.habits,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(builder: (context, taskState) {
      return BlocBuilder<TagBloc, TagState>(builder: (context, tagState) {
        return BlocBuilder<HabitBloc, HabitState>(
            builder: (context, habitState) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.8,
              minHeight: MediaQuery.of(context).size.height * 0.3,
              minWidth: MediaQuery.of(context).size.width,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: $constants.insets.md,
                  vertical: $constants.insets.md),
              child: Column(
                children: [
                  ABSearchBar(
                      controller: _searchController,
                      onSubmitted: (value) {
                        _updateSearchResults(
                          query: value,
                          tasks: taskState.tasks,
                          tags: tagState.tags,
                          habits: habitState.habits,
                        );
                      }),
                  SizedBox(height: $constants.insets.sm),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        if (_searchController.text.isEmpty)
                          const Text('Please enter a search query.'),
                        ..._searchResults,
                        if (_searchResults.isEmpty &&
                            _searchController.text.isNotEmpty)
                          Text(
                              'No results found for "${_searchController.text}".'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
      });
    });
  }

  _updateSearchResults({
    String? query,
    List<TaskEntity>? tasks,
    List<TagEntity>? tags,
    List<Habit>? habits,
  }) {
    final query = _searchController.text.toLowerCase();
    _searchResults.clear();

    // Search tasks
    final tasks = context.read<TasksBloc>().state.tasks;
    for (final task in tasks ?? []) {
      if (task.title.toLowerCase().contains(query) ||
          task.description?.toLowerCase().contains(query) == true) {
        _searchResults.add(_buildSearchResult(task));
      }
    }

    // Search tags
    final tags = context.read<TagBloc>().state.tags;
    for (final tag in tags ?? []) {
      if (tag.name.toLowerCase().contains(query)) {
        _searchResults.add(
          _buildSearchResult(
            tag,
          ),
        );
      }
    }

    // Search habits
    final habits = context.read<HabitBloc>().state.habits;
    for (final habit in habits ?? []) {
      if (habit.name.toLowerCase().contains(query)) {
        _searchResults.add(
          _buildSearchResult(
            habit,
          ),
        );
      }
    }

    setState(() {});
  }

  Widget _buildSearchResult(dynamic item) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: $constants.insets.xs,
      ),
      child: GestureDetector(
        onTap: () => _openItemDetails(item),
        child: ElevatedContainer(
          padding: EdgeInsets.symmetric(
              horizontal: $constants.insets.sm, vertical: $constants.insets.sm),
          child: Row(
            children: [
              _buildIconFromItemType(item),
              SizedBox(width: $constants.insets.sm),
              Expanded(child: _buildSearchTitleFromItemType(item)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconFromItemType(dynamic item) {
    IconData? iconData = Icons.help;
    Color? iconColor = Colors.grey;
    if (item is TaskEntity) {
      iconData = CupertinoIcons.checkmark_square;
    } else if (item is TagEntity) {
      iconData = CupertinoIcons.tag_fill;
    } else if (item is Habit) {
      iconData = CupertinoIcons.arrow_counterclockwise_circle_fill;
    }
    return Icon(iconData, color: iconColor);
  }

  Widget _buildSearchTitleFromItemType(dynamic item) {
    String title = '';
    if (item is TaskEntity) {
      title = item.title;
    } else if (item is TagEntity) {
      title = item.name;
    } else if (item is Habit) {
      title = item.name ?? 'Unnamed Habit';
    }

    return Text(title, style: getTextTheme(context).bodyLarge?.copyWith());
  }

  void _openItemDetails(dynamic item) {
    Widget? itemPage;
    if (item is TaskEntity) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => itemPage!),
      );
    } else {
      // Handle other item types if needed
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Not available for now')),
      );
    }
  }
}
