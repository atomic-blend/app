import 'dart:async';

import 'package:ab_shared/entities/sync/conflicted_item/conflicted_item.dart';
import 'package:ab_shared/entities/sync/item_type/item_type.dart';
import 'package:ab_shared/entities/sync/patch/patch.dart';
import 'package:ab_shared/entities/sync/patch_action/patch_action.dart';
import 'package:ab_shared/entities/sync/patch_change/patch_change.dart';
import 'package:ab_shared/entities/sync/sync_result/sync_result.dart';
import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:ab_shared/entities/user/user.entity.dart';
import 'package:app/services/tasks.service.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:objectid/objectid.dart';

part 'tasks.event.dart';
part 'tasks.state.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  final TasksService _tasksService = TasksService();
  TasksBloc() : super(const TasksInitial()) {
    on<SyncAllTasks>(_onSyncAllTasks);
    on<SyncTasksSince>(_onSyncTasksSince);
    on<AddTask>(_onAddTask);
    on<EditTask>(_onEditTask);
    on<DeleteTask>(_onDeleteTask);
    on<SyncTasks>(_onSyncTasks);
    on<ForceTaskPatch>(_onForceTaskPatch);
    on<DiscardTaskPatch>(_onDiscardTaskPatch);
  }

  @override
  TasksState? fromJson(Map<String, dynamic> json) {
    if (json["tasks"] != null) {
      return TasksLoaded(
        (json["tasks"] as List).map((e) => TaskEntity.fromJson(e)).toList(),
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
      "stagedPatches": state.stagedPatches?.map((e) => e.toJson()).toList(),
      "latestSync": state.latestSync?.toJson(),
    };
  }

  void _onSyncAllTasks(SyncAllTasks event, Emitter<TasksState> emit) async {
    final prevState = state;
    emit(TasksLoading(
      prevState.tasks ?? [],
      stagedPatches: prevState.stagedPatches,
      latestSync: prevState.latestSync,
    ));
    try {
      // Load all pages of tasks
      List<TaskEntity> allTasks = [];
      int currentPage = 1;
      int totalPages = 1;
      bool hasMorePages = true;

      while (hasMorePages && currentPage <= totalPages) {
        final paginationResult = await _tasksService.getAllTasksWithPagination(
            page: currentPage, size: 10);

        final List<TaskEntity> pageTasks =
            paginationResult['tasks'] as List<TaskEntity>;
        totalPages = paginationResult['total_pages'] as int;

        // Add all tasks from this page to our collection
        allTasks.addAll(pageTasks);

        // Check if we have more pages to load
        hasMorePages = currentPage < totalPages;
        currentPage++;

        // Emit intermediate state to show progress
        if (hasMorePages) {
          emit(TasksLoaded(
            allTasks,
            stagedPatches: prevState.stagedPatches ?? [],
            latestSync: prevState.latestSync,
          ));
        }
      }

      // Emit final state with all tasks
      emit(TasksLoaded(
        allTasks,
        stagedPatches: prevState.stagedPatches ?? [],
        latestSync: prevState.latestSync,
      ));
    } catch (e) {
      emit(TaskLoadingError(
        prevState.tasks ?? [],
        e.toString(),
        stagedPatches: prevState.stagedPatches,
        latestSync: prevState.latestSync,
      ));
    }
  }

  void _onSyncTasksSince(SyncTasksSince event, Emitter<TasksState> emit) async {
    final prevState = state;
    emit(TasksLoading(
      prevState.tasks ?? [],
      stagedPatches: prevState.stagedPatches,
      latestSync: prevState.latestSync,
    ));

    try {
      // Load tasks since the given date
      List<TaskEntity> newTasks = [];
      int currentPage = 1;
      int totalPages = 1;
      bool hasMorePages = true;

      while (hasMorePages && currentPage <= totalPages) {
        final paginationResult = await _tasksService.getTasksSince(
            since: prevState.latestSync?.date ?? DateTime.now(),
            page: currentPage,
            size: 10);

        final List<TaskEntity> pageTasks =
            paginationResult['tasks'] as List<TaskEntity>;
        totalPages = paginationResult['total_pages'] as int;

        // Add all tasks from this page to our collection
        newTasks.addAll(pageTasks);

        // Check if we have more pages to load
        hasMorePages = currentPage < totalPages;
        currentPage++;

        // Emit intermediate state to show progress
        if (hasMorePages) {
          final mergedTasks = _mergeTasks(prevState.tasks ?? [], newTasks);
          emit(TasksLoaded(
            mergedTasks,
            stagedPatches: prevState.stagedPatches ?? [],
            latestSync: prevState.latestSync,
          ));
        }
      }

      // Merge with existing state
      final mergedTasks = _mergeTasks(prevState.tasks ?? [], newTasks);

      // Emit final state with merged tasks
      emit(TasksLoaded(
        mergedTasks,
        stagedPatches: prevState.stagedPatches ?? [],
        latestSync: prevState.latestSync,
      ));
    } catch (e) {
      emit(TaskLoadingError(
        prevState.tasks ?? [],
        e.toString(),
        stagedPatches: prevState.stagedPatches,
        latestSync: prevState.latestSync,
      ));
    }
  }

  void _onAddTask(AddTask event, Emitter<TasksState> emit) async {
    final prevState = state;
    emit(TaskCreateInProgress(
      prevState.tasks ?? [],
      stagedPatches: prevState.stagedPatches,
      latestSync: prevState.latestSync,
    ));
    try {
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
        stagedPatches: existingPatches,
        latestSync: prevState.latestSync,
      ));
      add(const SyncTasks());
    } catch (e) {
      emit(TaskLoadingError(
        prevState.tasks ?? [],
        e.toString(),
        stagedPatches: prevState.stagedPatches,
        latestSync: prevState.latestSync,
      ));
      add(const SyncAllTasks());
    }
  }

  void _onEditTask(EditTask event, Emitter<TasksState> emit) async {
    final prevState = state;
    emit(TasksLoading(
      prevState.tasks ?? [],
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
        stagedPatches: existingPatches,
        latestSync: prevState.latestSync,
      ));
      add(const SyncTasks());
    } catch (e) {
      emit(TaskLoadingError(
        prevState.tasks ?? [],
        e.toString(),
        stagedPatches: prevState.stagedPatches,
        latestSync: prevState.latestSync,
      ));
      add(const SyncAllTasks());
    }
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) async {
    final prevState = state;
    emit(TasksLoading(
      prevState.tasks ?? [],
      stagedPatches: prevState.stagedPatches,
      latestSync: prevState.latestSync,
    ));
    try {
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
          stagedPatches: existingPatches,
          latestSync: prevState.latestSync,
        ),
      );
      add(const SyncTasks());
    } catch (e) {
      emit(TaskLoadingError(
        prevState.tasks ?? [],
        e.toString(),
        stagedPatches: prevState.stagedPatches,
        latestSync: prevState.latestSync,
      ));
      add(const SyncAllTasks());
    }
  }

  FutureOr<void> _onSyncTasks(SyncTasks event, Emitter<TasksState> emit) async {
    final prevState = state;
    emit(
      TaskSyncInProgress(
        prevState.tasks ?? [],
        stagedPatches: prevState.stagedPatches,
        latestSync: prevState.latestSync,
      ),
    );
    try {
      if (prevState.tasks == null) {
        add(const SyncAllTasks());
        return;
      }
      final syncResult = await _tasksService.patchTasks(
        prevState.stagedPatches ?? [],
      );

      final newConflictList = <ConflictedItem>[];
      newConflictList.addAll(syncResult.conflicts);

      final newPatchList = List<Patch>.from(prevState.stagedPatches ?? []);
      newPatchList
          .removeWhere((patch) => syncResult.success.contains(patch.id));

      emit(TaskSyncSuccess(
        prevState.tasks ?? [],
        latestSync: syncResult,
        stagedPatches: newPatchList,
      ));
      add(const SyncAllTasks());
    } catch (e) {
      emit(TaskLoadingError(
        prevState.tasks ?? [],
        e.toString(),
        stagedPatches: prevState.stagedPatches,
        latestSync: prevState.latestSync,
      ));
      add(const SyncAllTasks());
    }
  }

  FutureOr<void> _onForceTaskPatch(
      ForceTaskPatch event, Emitter<TasksState> emit) async {
    final prevState = state;
    emit(TasksLoading(
      prevState.tasks ?? [],
      stagedPatches: prevState.stagedPatches,
      latestSync: prevState.latestSync,
    ));
    try {
      final existingPatches = prevState.stagedPatches ?? [];
      final patchIndex =
          existingPatches.indexWhere((p) => p.id == event.patch.id);
      if (patchIndex != -1) {
        existingPatches[patchIndex].force = true;
      } else {
        event.patch.force = true;
        existingPatches.add(event.patch);
      }
      emit(TaskEdited(
        prevState.tasks ?? [],
        stagedPatches: existingPatches,
        latestSync: prevState.latestSync,
      ));
      add(const SyncTasks());
    } catch (e) {
      emit(TaskLoadingError(
        prevState.tasks ?? [],
        e.toString(),
        stagedPatches: prevState.stagedPatches,
        latestSync: prevState.latestSync,
      ));
      add(const SyncAllTasks());
    }
  }

  FutureOr<void> _onDiscardTaskPatch(
      DiscardTaskPatch event, Emitter<TasksState> emit) async {
    final prevState = state;
    emit(TasksLoading(
      prevState.tasks ?? [],
      stagedPatches: prevState.stagedPatches,
      latestSync: prevState.latestSync,
    ));
    try {
      final existingPatches = prevState.stagedPatches ?? [];
      existingPatches.removeWhere((p) => p.id == event.patch.id);
      emit(TaskEdited(
        prevState.tasks ?? [],
        stagedPatches: existingPatches,
        latestSync: prevState.latestSync,
      ));
    } catch (e) {
      emit(TaskLoadingError(
        prevState.tasks ?? [],
        e.toString(),
        stagedPatches: prevState.stagedPatches,
        latestSync: prevState.latestSync,
      ));
      add(const SyncAllTasks());
    }
  }
}

List<TaskEntity> _applyPatchToState(
    {required TasksState state, required Patch patch}) {
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

List<TaskEntity> _mergeTasks(
    List<TaskEntity> existingTasks, List<TaskEntity> newTasks) {
  final Map<String, TaskEntity> taskMap = {};

  // Add existing tasks to map
  for (var task in existingTasks) {
    if (task.id != null) {
      taskMap[task.id!] = task;
    }
  }

  // Add or update with new tasks
  for (var task in newTasks) {
    if (task.id != null) {
      taskMap[task.id!] = task;
    }
  }

  return taskMap.values.toList();
}
