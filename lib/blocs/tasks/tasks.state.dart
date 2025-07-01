part of 'tasks.bloc.dart';

sealed class TasksState extends Equatable {
  final List<TaskEntity>? tasks;
  final List<Patch>? stagedPatches;
  final List<ConflictedItem>? conflicts;
  const TasksState(this.tasks, {this.conflicts, this.stagedPatches});

  @override
  List<Object?> get props => [tasks, conflicts, stagedPatches];
}

class TasksInitial extends TasksState {
  const TasksInitial() : super(null);
}

class TasksLoading extends TasksState {
  const TasksLoading(List<TaskEntity> super.tasks, {super.conflicts, super.stagedPatches});
}

class TasksLoaded extends TasksState {
  const TasksLoaded(List<TaskEntity> super.tasks, {super.conflicts, super.stagedPatches});

  @override
  List<Object?> get props => [tasks, conflicts, stagedPatches];
}

class TaskLoadingError extends TasksState {
  const TaskLoadingError(List<TaskEntity> super.tasks, this.message,
      {super.conflicts, super.stagedPatches});
  final String message;

  @override
  List<Object?> get props => [message];
}

class TaskAddLoading extends TasksState {
  const TaskAddLoading(List<TaskEntity> super.tasks, {super.conflicts, super.stagedPatches});
}

class TaskDeleteLoading extends TasksState {
  const TaskDeleteLoading(List<TaskEntity> super.tasks, {super.conflicts, super.stagedPatches});
}

class TaskEditLoading extends TasksState {
  const TaskEditLoading(List<TaskEntity> super.tasks, {super.conflicts, super.stagedPatches});
}

class TaskAdded extends TasksState {
  const TaskAdded(List<TaskEntity> super.tasks, {super.conflicts, super.stagedPatches});

  @override
  List<Object?> get props => [tasks, conflicts, stagedPatches];
}

class TaskDeleted extends TasksState {
  const TaskDeleted(List<TaskEntity> super.tasks, {super.conflicts, super.stagedPatches});

  @override
  List<Object?> get props => [tasks, conflicts, stagedPatches];
}

class TaskEdited extends TasksState {
  const TaskEdited(List<TaskEntity> super.tasks, {super.conflicts, super.stagedPatches});

  @override
  List<Object?> get props => [tasks, conflicts, stagedPatches];
}

class TaskError extends TasksState {
  const TaskError(List<TaskEntity> super.tasks,
      {super.conflicts, super.stagedPatches, required this.message});
  final String message;

  @override
  List<Object?> get props => [message];
}

class TaskSyncInProgress extends TasksState {
  const TaskSyncInProgress(List<TaskEntity> super.tasks, {super.conflicts, super.stagedPatches});

  @override
  List<Object?> get props => [tasks, conflicts, stagedPatches];
}

class TaskSyncSuccess extends TasksState {
  const TaskSyncSuccess(List<TaskEntity> super.tasks, {super.conflicts, super.stagedPatches});

  @override
  List<Object?> get props => [tasks, conflicts, stagedPatches];
}
