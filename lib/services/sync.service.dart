import 'package:ab_shared/blocs/auth/auth.bloc.dart';
import 'package:app/blocs/folder/folder.bloc.dart';
import 'package:app/blocs/habit/habit.bloc.dart';
import 'package:app/blocs/tag/tag.bloc.dart';
import 'package:app/blocs/tasks/tasks.bloc.dart';
import 'package:app/blocs/time_entries/time_entry.bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SyncService {
  static Future<void> sync(BuildContext context) async {
    if (context.read<AuthBloc>().state is! LoggedIn) return;

    // Sync data
    context.read<HabitBloc>().add(const LoadHabits());
    context.read<TagBloc>().add(const LoadTags());
    context.read<FolderBloc>().add(const LoadFolders());
    context.read<TimeEntryBloc>().add(const LoadTimeEntries());
    if (context.read<TasksBloc>().state is TasksInitial) {
      context.read<TasksBloc>().add(const SyncTasks());
    } else {
      context.read<TasksBloc>().add(const SyncTasksSince());
    }
  }

  static void syncUserData(BuildContext context) {
    if (context.read<AuthBloc>().state is! LoggedIn) return;

    // Sync user data
    context.read<AuthBloc>().add(const RefreshUser());
  }
}
