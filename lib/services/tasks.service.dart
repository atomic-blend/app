import 'package:app/entities/sync/conflicted_item/conflicted_item.dart';
import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/entities/user/user.entity.dart';
import 'package:app/main.dart';
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

  Future<List<ConflictedItem>> updateBulk(
    List<TaskEntity> tasks, {
    int batchSize = 10,
  }) async {
    final List<ConflictedItem> allConflictedItems = [];

    // Process tasks in batches
    for (int i = 0; i < tasks.length; i += batchSize) {
      final int endIndex =
          (i + batchSize < tasks.length) ? i + batchSize : tasks.length;
      final List<TaskEntity> batch = tasks.sublist(i, endIndex);

      final encryptedTasks = await Future.wait(
        batch
            .map((task) => task.encrypt(encryptionService: encryptionService!)),
      );

      final result =
          await globalApiClient.put('/tasks/bulk', data: encryptedTasks);

      if (result.statusCode == 200) {
        final batchConflictedItems = (result.data as List)
            .map((item) => ConflictedItem.fromJson(item))
            .toList();
        allConflictedItems.addAll(batchConflictedItems);

        prefs?.setString(
            "task_last_update_date", DateTime.now().toIso8601String());
      } else {
        throw Exception('tasks_bulk_update_failed');
      }
    }

    return allConflictedItems;
  }
}
