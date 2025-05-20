part of 'tasks.bloc.dart';

sealed class TasksState extends Equatable {
  final List<TaskEntity>? tasks;
  const TasksState(this.tasks);

  @override
  List<Object?> get props => [tasks];
}

class TasksInitial extends TasksState {
  const TasksInitial() : super(null);
}

class TasksLoading extends TasksState {
  const TasksLoading(List<TaskEntity> super.tasks);
}

class TasksLoaded extends TasksState {
  const TasksLoaded(List<TaskEntity> super.tasks);

  @override
  List<Object?> get props => [tasks];
}

class TaskLoadingError extends TasksState {
  const TaskLoadingError(List<TaskEntity> super.tasks, this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}

class TaskAddLoading extends TasksState {
  const TaskAddLoading(List<TaskEntity> super.tasks);
}

class TaskDeleteLoading extends TasksState {
  const TaskDeleteLoading(List<TaskEntity> super.tasks);
}

class TaskEditLoading extends TasksState {
  const TaskEditLoading(List<TaskEntity> super.tasks);
}

class TaskAddTimeEntryLoading extends TasksState {
  const TaskAddTimeEntryLoading(List<TaskEntity> super.tasks);
}

class TaskRemoveTimeEntryLoading extends TasksState {
  const TaskRemoveTimeEntryLoading(List<TaskEntity> super.tasks);
}

class TaskUpdateTimeEntryLoading extends TasksState {
  const TaskUpdateTimeEntryLoading(List<TaskEntity> super.tasks);
}

class TaskAddTimeEntrySuccess extends TasksState {
  const TaskAddTimeEntrySuccess(List<TaskEntity> super.tasks);
}

class TaskRemoveTimeEntrySuccess extends TasksState {
  const TaskRemoveTimeEntrySuccess(List<TaskEntity> super.tasks);
}

class TaskUpdateTimeEntrySuccess extends TasksState {
  const TaskUpdateTimeEntrySuccess(List<TaskEntity> super.tasks);
}