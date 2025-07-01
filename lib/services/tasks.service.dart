import 'package:app/entities/sync/conflicted_item/conflicted_item.dart';
import 'package:app/entities/sync/item_type/item_type.dart';
import 'package:app/entities/sync/patch/patch.dart';
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
        final result = await globalApiClient.post(
          '/tasks/patch',
          data: batch.map((e) => e.toJson()).toList(),
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
