part of 'tasks.bloc.dart';

sealed class TasksState extends Equatable {
  final List<TaskEntity>? tasks;
  final List<Patch>? stagedPatches;
  final List<ConflictedItem>? conflicts;
  final SyncResult? latestSync;
  const TasksState(this.tasks,
      {required this.conflicts, required this.stagedPatches, required this.latestSync});

  @override
  List<Object?> get props => [tasks, conflicts, stagedPatches, latestSync];
}

class TasksInitial extends TasksState {
  const TasksInitial() : super(null, conflicts: null, stagedPatches: null, latestSync: null);
}

class TasksLoading extends TasksState {
  const TasksLoading(List<TaskEntity> super.tasks,
      {required super.conflicts, required super.stagedPatches, required super.latestSync});
}

class TasksLoaded extends TasksState {
  const TasksLoaded(List<TaskEntity> super.tasks,
      {required super.conflicts, required super.stagedPatches, required super.latestSync});

  @override
  List<Object?> get props => [tasks, conflicts, stagedPatches, latestSync];
}

class TaskLoadingError extends TasksState {
  const TaskLoadingError(List<TaskEntity> super.tasks, this.message,
      {required super.conflicts, required super.stagedPatches, required super.latestSync});
  final String message;

  @override
  List<Object?> get props => [message];
}

class TaskAddLoading extends TasksState {
  const TaskAddLoading(List<TaskEntity> super.tasks,
      {required super.conflicts, required super.stagedPatches, required super.latestSync});
}

class TaskDeleteLoading extends TasksState {
  const TaskDeleteLoading(List<TaskEntity> super.tasks,
      {required super.conflicts, required super.stagedPatches, required super.latestSync});
}

class TaskEditLoading extends TasksState {
  const TaskEditLoading(List<TaskEntity> super.tasks,
      {required super.conflicts, required super.stagedPatches, required super.latestSync});
}

class TaskAdded extends TasksState {
  const TaskAdded(List<TaskEntity> super.tasks,
      {required super.conflicts, required super.stagedPatches, required super.latestSync});

  @override
  List<Object?> get props => [tasks, conflicts, stagedPatches, latestSync];
}

class TaskDeleted extends TasksState {
  const TaskDeleted(List<TaskEntity> super.tasks,
      {required super.conflicts, required super.stagedPatches, required super.latestSync});

  @override
  List<Object?> get props => [tasks, conflicts, stagedPatches, latestSync];
}

class TaskEdited extends TasksState {
  const TaskEdited(List<TaskEntity> super.tasks,
      {required super.conflicts, required super.stagedPatches, required super.latestSync});

  @override
  List<Object?> get props => [tasks, conflicts, stagedPatches, latestSync];
}

class TaskError extends TasksState {
  const TaskError(List<TaskEntity> super.tasks,
      {required super.conflicts,
      required super.stagedPatches,
      required super.latestSync,
      required this.message});
  final String message;

  @override
  List<Object?> get props => [message];
}

class TaskSyncInProgress extends TasksState {
  const TaskSyncInProgress(List<TaskEntity> super.tasks,
      {required super.conflicts, required super.stagedPatches, required super.latestSync});

  @override
  List<Object?> get props => [tasks, conflicts, stagedPatches, latestSync];
}

class TaskSyncSuccess extends TasksState {
  const TaskSyncSuccess(List<TaskEntity> super.tasks,
      {required super.conflicts, required super.stagedPatches, required super.latestSync});

  @override
  List<Object?> get props => [tasks, conflicts, stagedPatches, latestSync];
}
