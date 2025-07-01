import 'dart:async';

import 'package:app/entities/sync/conflicted_item/conflicted_item.dart';
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
    on<SyncTasks>(_onSyncTasks);
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
    emit(TasksLoading(prevState.tasks ?? [],
        conflictedItems: prevState.conflictedItems));
    try {
      final tasks = await _tasksService.getAllTasks();
      emit(TasksLoaded(tasks, conflictedItems: prevState.conflictedItems));
    } catch (e) {
      emit(TaskLoadingError(
        prevState.tasks ?? [],
        e.toString(),
        conflictedItems: prevState.conflictedItems,
      ));
    }
  }

  void _onAddTask(AddTask event, Emitter<TasksState> emit) async {
    final prevState = state;
    emit(TasksLoading(prevState.tasks ?? [],
        conflictedItems: prevState.conflictedItems));
    try {
      await _tasksService.createTask(
        event.user,
        event.task,
      );
      emit(TaskAdded(prevState.tasks ?? [],
          conflictedItems: prevState.conflictedItems));
      add(const LoadTasks());
    } catch (e) {
      emit(TaskLoadingError(prevState.tasks ?? [], e.toString(),
          conflictedItems: prevState.conflictedItems));
      add(const LoadTasks());
    }
  }

  void _onEditTask(EditTask event, Emitter<TasksState> emit) async {
    final prevState = state;
    emit(TasksLoading(prevState.tasks ?? [],
        conflictedItems: prevState.conflictedItems));
    try {
      //TODO: replace with patch
      event.task.updatedAt = DateTime.now();
      // replace old task with event.task
      final updatedTasks = prevState.tasks?.map((task) {
        if (task.id == event.task.id) {
          return event.task;
        }
        return task;
      }).toList();
      emit(TaskEdited(updatedTasks ?? [],
          conflictedItems: prevState.conflictedItems));
      add(const SyncTasks());
    } catch (e) {
      emit(TaskLoadingError(prevState.tasks ?? [], e.toString(),
          conflictedItems: prevState.conflictedItems));
      add(const LoadTasks());
    }
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) async {
    final prevState = state;
    emit(TasksLoading(prevState.tasks ?? [],
        conflictedItems: prevState.conflictedItems));
    try {
      await _tasksService.deleteTask(event.task);
      emit(TaskDeleted(prevState.tasks ?? [],
          conflictedItems: prevState.conflictedItems));
      add(const LoadTasks());
    } catch (e) {
      emit(TaskLoadingError(prevState.tasks ?? [], e.toString(),
          conflictedItems: prevState.conflictedItems));
      add(const LoadTasks());
    }
  }

  FutureOr<void> _onSyncTasks(SyncTasks event, Emitter<TasksState> emit) async {
    final prevState = state;
    emit(TaskSyncInProgress(prevState.tasks ?? [],
        conflictedItems: prevState.conflictedItems));
    try {
      if (prevState.tasks == null) {
        add(const LoadTasks());
        return;
      }
      //TODO: replace with patch
      final conflicts = await _tasksService.updateBulk(prevState.tasks!);
      emit(TaskSyncSuccess(prevState.tasks!, conflictedItems: conflicts));
      add(const LoadTasks());
    } catch (e) {
      emit(TaskLoadingError(prevState.tasks ?? [], e.toString(),
          conflictedItems: prevState.conflictedItems));
      add(const LoadTasks());
    }
  }
}
