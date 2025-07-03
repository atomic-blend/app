import 'dart:async';

import 'package:app/entities/sync/conflicted_item/conflicted_item.dart';
import 'package:app/entities/sync/item_type/item_type.dart';
import 'package:app/entities/sync/patch/patch.dart';
import 'package:app/entities/sync/patch_action/patch_action.dart';
import 'package:app/entities/sync/patch_change/patch_change.dart';
import 'package:app/entities/sync/sync_result/sync_result.dart';
import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/entities/user/user.entity.dart';
import 'package:app/services/tasks.service.dart';
import 'package:app/services/user.service.dart';
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
        conflicts: (json["conflicts"] as List?)
            ?.map((e) => ConflictedItem.fromJson(e))
            .toList(),
        stagedPatches: (json["stagedPatches"] as List?)
            ?.map((e) => Patch.fromJson(e))
            .toList(),
        latestSync: json["latestSync"] != null
            ? SyncResult.fromJson(json["latestSync"])
            : null,
      );
    }
    return const TasksInitial();
  }

  @override
  Map<String, dynamic>? toJson(TasksState state) {
    return {
      "tasks": state.tasks!.map((e) => e.toJson()).toList(),
      "conflicts": state.conflicts?.map((e) => e.toJson()).toList(),
      "stagedPatches": state.stagedPatches?.map((e) => e.toJson()).toList(),
      "latestSync": state.latestSync?.toJson(),
    };
  }

  void _onLoadTasks(LoadTasks event, Emitter<TasksState> emit) async {
    final prevState = state;
    emit(TasksLoading(
      prevState.tasks ?? [],
      conflicts: prevState.conflicts,
      stagedPatches: prevState.stagedPatches,
      latestSync: prevState.latestSync,
    ));
    try {
      final tasks = await _tasksService.getAllTasks();
      emit(TasksLoaded(
        tasks,
        conflicts: prevState.conflicts,
        stagedPatches: prevState.stagedPatches,
        latestSync: prevState.latestSync,
      ));
    } catch (e) {
      emit(TaskLoadingError(
        prevState.tasks ?? [],
        e.toString(),
        conflicts: prevState.conflicts,
        stagedPatches: prevState.stagedPatches,
        latestSync: prevState.latestSync,
      ));
    }
  }

  void _onAddTask(AddTask event, Emitter<TasksState> emit) async {
    final prevState = state;
    emit(TaskCreateInProgress(
      prevState.tasks ?? [],
      conflicts: prevState.conflicts,
      stagedPatches: prevState.stagedPatches,
      latestSync: prevState.latestSync,
    ));
    try {
      //TODO: replace with patch
      final existingPatches = prevState.stagedPatches ?? [];
      final patch = Patch(
        id: ObjectId().hexString,
        action: PatchAction.create,
        patchDate: DateTime.now(),
        itemType: ItemType.task,
        itemId: "",
        changes: [
          PatchChange(
            key: 'data',
            value: event.task,
          ),
        ],
      );
      existingPatches.add(patch);

      final updatedTasks = _applyPatchToState(state: prevState, patch: patch);

      emit(TaskAdded(
        updatedTasks,
        conflicts: prevState.conflicts,
        stagedPatches: existingPatches,
        latestSync: prevState.latestSync,
      ));
      add(const SyncTasks());
    } catch (e) {
      emit(TaskLoadingError(
        prevState.tasks ?? [],
        e.toString(),
        conflicts: prevState.conflicts,
        stagedPatches: prevState.stagedPatches,
        latestSync: prevState.latestSync,
      ));
      add(const LoadTasks());
    }
  }

  void _onEditTask(EditTask event, Emitter<TasksState> emit) async {
    final prevState = state;
    emit(TasksLoading(
      prevState.tasks ?? [],
      conflicts: prevState.conflicts,
      stagedPatches: prevState.stagedPatches,
      latestSync: prevState.latestSync,
    ));
    try {
      final existingPatches = prevState.stagedPatches ?? [];
      final patch = Patch(
        id: ObjectId().hexString,
        action: PatchAction.update,
        patchDate: DateTime.now(),
        itemType: ItemType.task,
        itemId: event.taskId,
        changes: event.changes,
      );
      existingPatches.add(patch);
      final updatedTasks = _applyPatchToState(state: prevState, patch: patch);
      emit(TaskEdited(
        updatedTasks,
        conflicts: prevState.conflicts,
        stagedPatches: existingPatches,
        latestSync: prevState.latestSync,
      ));
      add(const SyncTasks());
    } catch (e) {
      emit(TaskLoadingError(
        prevState.tasks ?? [],
        e.toString(),
        conflicts: prevState.conflicts,
        stagedPatches: prevState.stagedPatches,
        latestSync: prevState.latestSync,
      ));
      add(const LoadTasks());
    }
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) async {
    final prevState = state;
    emit(TasksLoading(
      prevState.tasks ?? [],
      conflicts: prevState.conflicts,
      stagedPatches: prevState.stagedPatches,
      latestSync: prevState.latestSync,
    ));
    try {
      //TODO: replace with patch
      final existingPatches = prevState.stagedPatches ?? [];
      final patch = Patch(
        id: ObjectId().hexString,
        action: PatchAction.delete,
        patchDate: DateTime.now(),
        itemType: ItemType.task,
        itemId: event.task.id!,
        changes: [],
      );
      existingPatches.add(patch);
      final updatedTasks = _applyPatchToState(state: prevState, patch: patch);
      emit(
        TaskDeleted(
          updatedTasks,
          conflicts: prevState.conflicts,
          stagedPatches: existingPatches,
          latestSync: prevState.latestSync,
        ),
      );
      add(const SyncTasks());
    } catch (e) {
      emit(TaskLoadingError(
        prevState.tasks ?? [],
        e.toString(),
        conflicts: prevState.conflicts,
        stagedPatches: prevState.stagedPatches,
        latestSync: prevState.latestSync,
      ));
      add(const LoadTasks());
    }
  }

  FutureOr<void> _onSyncTasks(SyncTasks event, Emitter<TasksState> emit) async {
    final prevState = state;
    emit(
      TaskSyncInProgress(
        prevState.tasks ?? [],
        conflicts: prevState.conflicts,
        stagedPatches: prevState.stagedPatches,
        latestSync: prevState.latestSync,
      ),
    );
    try {
      if (prevState.tasks == null) {
        add(const LoadTasks());
        return;
      }
      final syncResult = await _tasksService.patchTasks(
        prevState.stagedPatches ?? [],
      );

      final newConflictList =
          List<ConflictedItem>.from(prevState.conflicts ?? []);
      newConflictList.addAll(syncResult.conflicts);

      final newPatchList = List<Patch>.from(prevState.stagedPatches ?? []);
      newPatchList
          .removeWhere((patch) => syncResult.success.contains(patch.id));

      emit(TaskSyncSuccess(
        prevState.tasks ?? [],
        latestSync: syncResult,
        conflicts: newConflictList,
        stagedPatches: newPatchList,
      ));
      add(const LoadTasks());
    } catch (e) {
      emit(TaskLoadingError(
        prevState.tasks ?? [],
        e.toString(),
        conflicts: prevState.conflicts,
        stagedPatches: prevState.stagedPatches,
        latestSync: prevState.latestSync,
      ));
      add(const LoadTasks());
    }
  }
}

List<TaskEntity> _applyPatchToState({required TasksState state, required Patch patch}) {
  final tasks = List<TaskEntity>.from(state.tasks ?? []);
  final taskIndex = tasks.indexWhere((task) => task.id == patch.itemId);

  switch (patch.action) {
    case PatchAction.create:
      if (taskIndex == -1) {
        final newTask = patch.changes.first.value as TaskEntity;
        tasks.add(newTask);
      }
      break;
    case PatchAction.update:
      if (taskIndex != -1) {
        final task = tasks[taskIndex];
        for (var change in patch.changes) {
          task.updateField(change.key, change.value);
        }
      }
      break;
    case PatchAction.delete:
      if (taskIndex != -1) {
        tasks.removeAt(taskIndex);
      }
      break;
  }
  return tasks;
}
