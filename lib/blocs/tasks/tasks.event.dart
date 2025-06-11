part of 'tasks.bloc.dart';

sealed class TasksEvent {
  const TasksEvent();
}

final class LoadTasks extends TasksEvent {
  const LoadTasks();
}

final class AddTask extends TasksEvent {
  const AddTask(this.task, this.user);
  final TaskEntity task;
  final UserEntity user;
}

final class EditTask extends TasksEvent {
  const EditTask(this.task);
  final TaskEntity task;
}

final class DeleteTask extends TasksEvent {
  const DeleteTask(this.task);
  final TaskEntity task;
}
