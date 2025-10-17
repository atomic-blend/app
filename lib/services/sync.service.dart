import 'package:ab_shared/blocs/auth/auth.bloc.dart';
import 'package:ab_shared/components/app/ab_header.dart';
import 'package:app/blocs/folder/folder.bloc.dart';
import 'package:app/blocs/habit/habit.bloc.dart';
import 'package:app/blocs/tag/tag.bloc.dart';
import 'package:app/blocs/tasks/tasks.bloc.dart';
import 'package:app/blocs/time_entries/time_entry.bloc.dart';
import 'package:flutter/cupertino.dart';
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

  static List<SyncedElement> getSyncedElements({
    required TasksState tasksState,
    required HabitState habitState,
    required TagState tagState,
    required FolderState folderState,
    required TimeEntryState timeEntryState,
    required AuthState authState,
  }) {
    return [
      SyncedElement(
          key: const Key("tasks"),
          label: "Tasks",
          icon: CupertinoIcons.checkmark_rectangle,
          count: tasksState.tasks?.length ?? 0),
      SyncedElement(
          key: const Key("habits"),
          label: "Habits",
          icon: CupertinoIcons.repeat,
          count: habitState.habits?.length ?? 0),
      SyncedElement(
          key: const Key("tags"),
          label: "Tags",
          icon: CupertinoIcons.tag,
          count: tagState.tags?.length ?? 0),
      SyncedElement(
          key: const Key("folders"),
          label: "Folders",
          icon: CupertinoIcons.folder,
          count: folderState.folders?.length ?? 0),
      SyncedElement(
          key: const Key("time_entries"),
          label: "Time Entries",
          icon: CupertinoIcons.clock,
          count: timeEntryState.timeEntries?.length ?? 0),
    ];
  }

  static bool isSyncing({
    required TasksState tasksState,
    required HabitState habitState,
    required TagState tagState,
    required FolderState folderState,
    required TimeEntryState timeEntryState,
    required AuthState authState,
  }) {
    return tasksState is TasksLoading ||
        habitState is HabitLoading ||
        tagState is TagLoading ||
        folderState is FolderLoading ||
        timeEntryState is TimeEntryLoading ||
        authState is Loading ||
        tasksState is TaskAddLoading ||
        tasksState is TaskEditLoading ||
        tasksState is TaskDeleteLoading ||
        tasksState is TaskSyncInProgress ||
        tagState is TagEditLoading ||
        tagState is TagDeleteLoading;
  }
}
