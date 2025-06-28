part of 'tasks.bloc.dart';

sealed class TasksState extends Equatable {
  final List<TaskEntity>? tasks;
  final List<ConflictedItem>? conflictedItems;
  const TasksState(this.tasks, { this.conflictedItems });

  @override
  List<Object?> get props => [tasks, conflictedItems];
}

class TasksInitial extends TasksState {
  const TasksInitial() : super(null);
}

class TasksLoading extends TasksState {
  const TasksLoading(
      List<TaskEntity> super.tasks, { super.conflictedItems });
}

class TasksLoaded extends TasksState {
  const TasksLoaded(
      List<TaskEntity> super.tasks, { super.conflictedItems });

  @override
  List<Object?> get props => [tasks, conflictedItems];
}

class TaskLoadingError extends TasksState {
  const TaskLoadingError(
      List<TaskEntity> super.tasks, this.message,{ super.conflictedItems});
  final String message;

  @override
  List<Object?> get props => [message];
}

class TaskAddLoading extends TasksState {
  const TaskAddLoading(
      List<TaskEntity> super.tasks, { super.conflictedItems });
}

class TaskDeleteLoading extends TasksState {
  const TaskDeleteLoading(
      List<TaskEntity> super.tasks, { super.conflictedItems });
}

class TaskEditLoading extends TasksState {
  const TaskEditLoading(
      List<TaskEntity> super.tasks, { super.conflictedItems });
}

class TaskAdded extends TasksState {
  const TaskAdded(
      List<TaskEntity> super.tasks, { super.conflictedItems });

  @override
  List<Object?> get props => [tasks, conflictedItems];
}

class TaskDeleted extends TasksState {
  const TaskDeleted(
      List<TaskEntity> super.tasks, { super.conflictedItems });

  @override
  List<Object?> get props => [tasks, conflictedItems];
}

class TaskEdited extends TasksState {
  const TaskEdited(
      List<TaskEntity> super.tasks, { super.conflictedItems });

  @override
  List<Object?> get props => [tasks, conflictedItems];
}

class TaskError extends TasksState {
  const TaskError(List<TaskEntity> super.tasks,
      { super.conflictedItems, required this.message });
  final String message;

  @override
  List<Object?> get props => [message];
}

class TaskSyncInProgress extends TasksState {
  const TaskSyncInProgress(List<TaskEntity> super.tasks, { super.conflictedItems });

  @override
  List<Object?> get props => [tasks, conflictedItems];
}

class TaskSyncSuccess extends TasksState {
  const TaskSyncSuccess(
      List<TaskEntity> super.tasks, { super.conflictedItems });

  @override
  List<Object?> get props => [tasks, conflictedItems];
}
