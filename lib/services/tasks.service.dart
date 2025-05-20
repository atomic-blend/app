import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/entities/time_entry/time_entry.entity.dart';
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

  Future<bool> addTimeEntryToTask(TaskEntity task, TimeEntry timeEntry) async {
    final encryptedTimeEntry =
        await timeEntry.encrypt(encryptionService: encryptionService!);
    final result = await globalApiClient.post(
      '/tasks/${task.id}/time-entries',
      data: encryptedTimeEntry,
    );

    if (result.statusCode == 200) {
      return true;
    } else {
      throw Exception('task_add_time_entry_failed');
    }
  }

  Future<bool> removeTimeEntryFromTask(
      TaskEntity task, TimeEntry timeEntry) async {
    final result = await globalApiClient.delete(
      '/tasks/${task.id}/time-entries/${timeEntry.id}',
    );

    if (result.statusCode == 204) {
      return true;
    } else {
      throw Exception('task_remove_time_entry_failed');
    }
  }

  Future<bool> updateTimeEntryInTask(
      TaskEntity task, TimeEntry timeEntry) async {
    final encryptedTimeEntry =
        await timeEntry.encrypt(encryptionService: encryptionService!);
    final result = await globalApiClient.delete(
      '/tasks/${task.id}/time-entries/${timeEntry.id}',
      data: encryptedTimeEntry,
    );

    if (result.statusCode == 200) {
      return true;
    } else {
      throw Exception('task_update_time_entry_failed');
    }
  }
}
