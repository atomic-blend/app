import 'package:app/blocs/tasks/tasks.bloc.dart';
import 'package:app/i18n/strings.g.dart';
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
      body: BlocBuilder<TasksBloc, TasksState>(builder: (context, taskState) {
        final taskConflictedItems = taskState.latestSync?.conflicts ?? [];
        return const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [],
        );
      }),
    );
  }
}
