import 'package:app/entities/habit/habit.entity.dart';
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
}
