import 'package:app/entities/habit/habit.entity.dart';
import 'package:app/entities/habit/habit_entry/habit_entry.entity.dart';
import 'package:app/services/user.service.dart';
import 'package:app/utils/api_client.dart';

class HabitService {
  HabitService();

  Future<List<Habit>> getAll() async {
    final result = await globalApiClient.get('/habits');
    if (result.statusCode == 200) {
      final List<Habit> tasks = [];
      for (var i = 0; i < (result.data as List).length; i++) {
        tasks.add(await Habit.decrypt(result.data[i], encryptionService!));
      }
      return tasks;
    } else {
      throw Exception('habit_fetch_failed');
    }
  }

  Future<bool> create(Habit habit) async {
    final result = await globalApiClient.post('/habits',
        data: await habit.encrypt(encryptionService: encryptionService!));
    if (result.statusCode == 201) {
      return true;
    } else {
      throw Exception('habit_create_failed');
    }
  }

  Future<bool> update(Habit habit) async {
    final result =
        await globalApiClient.put('/habits/${habit.id}', data: await habit.encrypt(encryptionService: encryptionService!));
    if (result.statusCode == 200) {
      return true;
    } else {
      throw Exception('habit_update_failed');
    }
  }

  Future<bool> addEntry(HabitEntry habitEntry) async {
    final result = await globalApiClient.post('/habits/entry/add',
        data:  habitEntry.toJson());
    if (result.statusCode == 201) {
      return true;
    } else {
      throw Exception('habit_entry_create_failed');
    }
  }

  Future<bool> updateEntry(HabitEntry habitEntry) async {
    final result = await globalApiClient.put('/habits/entry/edit/${habitEntry.id}',
        data: habitEntry.toJson());
    if (result.statusCode == 200) {
      return true;
    } else {
      throw Exception('habit_entry_update_failed');
    }
  }

  Future<bool> deleteEntry(String id) async {
    final result = await globalApiClient.delete('/habits/entry/delete/$id');
    if (result.statusCode == 200) {
      return true;
    } else {
      throw Exception('habit_entry_delete_failed');
    }
  }

  Future<bool> delete(String id) async {
    final result = await globalApiClient.delete('/habits/$id');
    if (result.statusCode == 200) {
      return true;
    } else {
      throw Exception('habit_delete_failed');
    }
  }
}
