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

class TaskAdded extends TasksState {
  const TaskAdded(List<TaskEntity> super.tasks);

  @override
  List<Object?> get props => [tasks];
}

class TaskDeleted extends TasksState {
  const TaskDeleted(List<TaskEntity> super.tasks);

  @override
  List<Object?> get props => [tasks];
}

class TaskEdited extends TasksState {
  const TaskEdited(List<TaskEntity> super.tasks);

  @override
  List<Object?> get props => [tasks];
}

class TaskError extends TasksState {
  const TaskError(List<TaskEntity> super.tasks, this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}