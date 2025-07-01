import 'dart:async';

import 'package:app/entities/sync/conflicted_item/conflicted_item.dart';
import 'package:app/entities/sync/item_type/item_type.dart';
import 'package:app/entities/sync/patch/patch.dart';
import 'package:app/entities/sync/patch_action/patch_action.dart';
import 'package:app/entities/sync/patch_change/patch_change.dart';
import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/entities/user/user.entity.dart';
import 'package:app/services/tasks.service.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:objectid/objectid.dart';

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
    emit(TasksLoading(prevState.tasks ?? [], conflicts: prevState.conflicts));
    try {
      final tasks = await _tasksService.getAllTasks();
      emit(TasksLoaded(tasks, conflicts: prevState.conflicts));
    } catch (e) {
      emit(TaskLoadingError(
        prevState.tasks ?? [],
        e.toString(),
        conflicts: prevState.conflicts,
      ));
    }
  }

  void _onAddTask(AddTask event, Emitter<TasksState> emit) async {
    final prevState = state;
    emit(TasksLoading(prevState.tasks ?? [], conflicts: prevState.conflicts));
    try {
      //TODO: replace with patch
      await _tasksService.createTask(
        event.user,
        event.task,
      );
      emit(TaskAdded(prevState.tasks ?? [], conflicts: prevState.conflicts));
      add(const LoadTasks());
    } catch (e) {
      emit(TaskLoadingError(prevState.tasks ?? [], e.toString(),
          conflicts: prevState.conflicts));
      add(const LoadTasks());
    }
  }

  void _onEditTask(EditTask event, Emitter<TasksState> emit) async {
    final prevState = state;
    emit(TasksLoading(prevState.tasks ?? [], conflicts: prevState.conflicts));
    try {
      final existingPatches = prevState.stagedPatches ?? [];
      final patch = Patch(
        id: ObjectId().hexString,
        action: PatchAction.update,
        patchDate: DateTime.now(),
        type: ItemType.task,
        itemId: event.taskId,
        changes: event.changes,
      );
      existingPatches.add(patch);
      emit(TaskEdited(prevState.tasks ?? [],
          conflicts: prevState.conflicts, stagedPatches: existingPatches));
      add(const SyncTasks());
    } catch (e) {
      emit(TaskLoadingError(prevState.tasks ?? [], e.toString(),
          conflicts: prevState.conflicts));
      add(const LoadTasks());
    }
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) async {
    final prevState = state;
    emit(TasksLoading(prevState.tasks ?? [], conflicts: prevState.conflicts));
    try {
      //TODO: replace with patch
      await _tasksService.deleteTask(event.task);
      emit(TaskDeleted(prevState.tasks ?? [], conflicts: prevState.conflicts));
      add(const LoadTasks());
    } catch (e) {
      emit(TaskLoadingError(prevState.tasks ?? [], e.toString(),
          conflicts: prevState.conflicts));
      add(const LoadTasks());
    }
  }

  FutureOr<void> _onSyncTasks(SyncTasks event, Emitter<TasksState> emit) async {
    final prevState = state;
    emit(TaskSyncInProgress(prevState.tasks ?? [],
        conflicts: prevState.conflicts));
    try {
      if (prevState.tasks == null) {
        add(const LoadTasks());
        return;
      }
      //TODO: replace with patch
      //TODO: delete from stagedPatches if patch is successful
      add(const LoadTasks());
    } catch (e) {
      emit(TaskLoadingError(prevState.tasks ?? [], e.toString(),
          conflicts: prevState.conflicts));
      add(const LoadTasks());
    }
  }
}
