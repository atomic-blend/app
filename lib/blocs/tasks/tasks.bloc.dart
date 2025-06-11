
import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/entities/user/user.entity.dart';
import 'package:app/services/tasks.service.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'tasks.event.dart';
part 'tasks.state.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  final TasksService _tasksService = TasksService();
  TasksBloc() : super(const TasksInitial()) {
    on<LoadTasks>(_onLoadTasks);
    on<AddTask>(_onAddTask);
    on<EditTask>(_onEditTask);
    on<DeleteTask>(_onDeleteTask);
    
  }

  @override
  TasksState? fromJson(Map<String, dynamic> json) {
    if (json["tasks"] != null) {
      return TasksLoaded(
        (json["tasks"] as List).map((e) => TaskEntity.fromJson(e)).toList(),
      );
    }
    return const TasksInitial();
  }

  @override
  Map<String, dynamic>? toJson(TasksState state) {
    if (state is TasksLoaded && state.tasks != null) {
      return {"tasks": state.tasks!.map((e) => e.toJson()).toList()};
    }
    return null;
  }

  void _onLoadTasks(LoadTasks event, Emitter<TasksState> emit) async {
    final prevState = state;
    emit(TasksLoading(prevState.tasks ?? []));
    try {
    final tasks = await _tasksService.getAllTasks();
      emit(TasksLoaded(tasks));
    } catch (e) {
      emit(TaskLoadingError(prevState.tasks ?? [], e.toString()));
    }
  }

  void _onAddTask(AddTask event, Emitter<TasksState> emit) async {
    final prevState = state;
    emit(TasksLoading(prevState.tasks ?? []));
    try {
      await _tasksService.createTask(event.user, event.task,);
      emit(TaskAdded(prevState.tasks ?? []));
      add(const LoadTasks());
    } catch (e) {
      emit(TaskLoadingError(prevState.tasks ?? [], e.toString()));
      add(const LoadTasks());
    }
  }

  void _onEditTask(EditTask event, Emitter<TasksState> emit) async {
    final prevState = state;
    emit(TasksLoading(prevState.tasks ?? []));
    try {
      await _tasksService.updateTask(event.task);
      emit(TaskEdited(prevState.tasks ?? []));
      add(const LoadTasks());
    } catch (e) {
      emit(TaskLoadingError(prevState.tasks ?? [], e.toString()));
      add(const LoadTasks());
    }
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) async {
    final prevState = state;
    emit(TasksLoading(prevState.tasks ?? []));
    try {
      await _tasksService.deleteTask(event.task);
      emit(TaskDeleted(prevState.tasks ?? []));
      add(const LoadTasks());
    } catch (e) {
      emit(TaskLoadingError(prevState.tasks ?? [], e.toString()));
      add(const LoadTasks());
    }
  }
}
