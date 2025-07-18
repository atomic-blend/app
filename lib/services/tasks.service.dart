import 'package:app/entities/sync/conflicted_item/conflicted_item.dart';
import 'package:app/entities/sync/item_type/item_type.dart';
import 'package:app/entities/sync/patch/patch.dart';
import 'package:app/entities/sync/patch_action/patch_action.dart';
import 'package:app/entities/sync/patch_error/patch_error.dart';
import 'package:app/entities/sync/sync_result/sync_result.dart';
import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/entities/user/user.entity.dart';
import 'package:app/services/user.service.dart';
import 'package:app/utils/api_client.dart';

class TasksService {
  TasksService();

  Future<List<TaskEntity>> getAllTasks() async {
    final result = await globalApiClient.get('/tasks');
    if (result.statusCode == 200) {
      final List<TaskEntity> tasks = [];
      for (var i = 0; i < (result.data as List).length; i++) {
        tasks.add(await TaskEntity.decrypt(result.data[i], encryptionService!));
      }
      return tasks;
    } else {
      throw Exception('tasks_fetch_failed');
    }
  }

  Future<bool> createTask(UserEntity user, TaskEntity task) async {
    if (encryptionService == null) {
      await UserService.refreshToken(user);
    }
    final encryptedTask =
        await task.encrypt(encryptionService: encryptionService!);
    final result = await globalApiClient.post('/tasks', data: encryptedTask);
    if (result.statusCode == 201) {
      return true;
    } else {
      throw Exception('task_create_failed');
    }
  }

  Future<bool> updateTask(TaskEntity task) async {
    final encryptedTask =
        await task.encrypt(encryptionService: encryptionService!);

    final result =
        await globalApiClient.put('/tasks/${task.id}', data: encryptedTask);
    if (result.statusCode == 200) {
      return true;
    } else {
      throw Exception('task_update_failed');
    }
  }

  Future<bool> deleteTask(TaskEntity task) async {
    final result = await globalApiClient.delete('/tasks/${task.id}');
    if (result.statusCode == 204) {
      return true;
    } else {
      throw Exception('task_delete_failed');
    }
  }

  Future<SyncResult> patchTasks(List<Patch> patches,
      {int batchSize = 10}) async {
    final eligiblePatches =
        patches.where((patch) => patch.itemType == ItemType.task).toList();

    if (eligiblePatches.isEmpty) {
      return SyncResult(
        success: [],
        conflicts: [],
        errors: [],
        date: DateTime.now(),
      );
    }

    final List<String> success = [];
    final List<ConflictedItem> conflicts = [];
    final List<PatchError> errors = [];

    for (var i = 0; i < eligiblePatches.length; i += batchSize) {
      final batch = eligiblePatches.sublist(
        i,
        (i + batchSize < eligiblePatches.length)
            ? i + batchSize
            : eligiblePatches.length,
      );

      try {
        // Create encrypted patches without modifying the original patches
        final List<Patch> encryptedPatches = [];

        for (var patch in batch) {
          // Create a copy of the patch
          final encryptedPatch = Patch(
            id: patch.id,
            itemId: patch.itemId,
            itemType: patch.itemType,
            action: patch.action,
            changes: [],
            patchDate: patch.patchDate,
            force: patch.force,
          );

          if (patch.action == PatchAction.update) {
            for (var change in patch.changes) {
              // Create a copy of the change
              final encryptedChange = change.copyWith();

              // if key is not part of nonEncryptedFields, encrypt it
              if (!TaskEntity.nonEncryptedFields.contains(change.key) &&
                  !TaskEntity.manualParseFields.contains(change.key) &&
                  change.value != null) {
                encryptedChange.value =
                    await encryptionService!.encryptJson(change.value);
              }

              encryptedPatch.changes.add(encryptedChange);
            }
          } else if (patch.action == PatchAction.create) {
            final data = patch.changes.first.value;
            if (data is! Map) {
              final task = patch.changes.first.value as TaskEntity;
              final encryptedTask =
                  await task.encrypt(encryptionService: encryptionService!);
              final encryptedChange =
                  patch.changes.first.copyWith(value: encryptedTask);
              encryptedPatch.changes.add(encryptedChange);
            } else {
              // If it's already a Map, just copy the change as is
              encryptedPatch.changes
                  .addAll(patch.changes.map((c) => c.copyWith()));
            }
          } else {
            // For other actions (delete, etc.), just copy the changes as is
            encryptedPatch.changes
                .addAll(patch.changes.map((c) => c.copyWith()));
          }

          encryptedPatches.add(encryptedPatch);
        }

        final result = await globalApiClient.post(
          '/tasks/patch',
          data: encryptedPatches.map((e) => e.toJson()).toList(),
        );

        if (result.statusCode == 200) {
          final responseData = result.data as Map<String, dynamic>;
          final syncResult = SyncResult.fromJson(responseData);
          success.addAll(syncResult.success);
          conflicts.addAll(syncResult.conflicts);
          errors.addAll(syncResult.errors);
        } else {
          throw Exception('patch_tasks_failed');
        }
      } catch (e) {
        batch.map((patch) {
          errors.add(PatchError(
            patchId: patch.id,
            errorCode: e.toString(),
          ));
        });
      }
    }

    return SyncResult(
      success: success,
      conflicts: conflicts,
      errors: errors,
      date: DateTime.now(),
    );
  }
}
