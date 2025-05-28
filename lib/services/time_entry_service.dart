import 'package:app/entities/time_entry/time_entry.entity.dart';
import 'package:app/services/user.service.dart';
import 'package:app/utils/api_client.dart';

class TimeEntryService {

  Future<List<TimeEntry>> getAllTimeEntries() async {
    final result = await globalApiClient.get('/time-entries');
    if (result.statusCode != 200) {
      throw Exception('time_entry_fetch_failed');
    }
    final List<dynamic> data = result.data;
    return Future.wait(data.map((e) => TimeEntry.decrypt(
      data: e,
      encryptionService: encryptionService!,
    )).toList());
  }
  

  Future<TimeEntry> createTimeEntry({required TimeEntry timeEntry}) async {
    final encryptedTimeEntry =
        await timeEntry.encrypt(encryptionService: encryptionService!);

    final result =
        await globalApiClient.post('/time-entries', data: encryptedTimeEntry);
    if (result.statusCode != 201) {
      throw Exception('time_entry_create_failed');
    }
    return await TimeEntry.decrypt(
      data: result.data,
      encryptionService: encryptionService!,
    );
  }

  Future<TimeEntry> updateTimeEntry({
    required TimeEntry timeEntry,
  }) async {
    final encryptedTimeEntry =
        await timeEntry.encrypt(encryptionService: encryptionService!);

    final result = await globalApiClient.put(
      '/time-entries/${timeEntry.id}',
      data: encryptedTimeEntry,
    );
    if (result.statusCode != 200) {
      throw Exception('time_entry_update_failed');
    }
    return await TimeEntry.decrypt(
      data: result.data,
      encryptionService: encryptionService!,
    );
  }

  Future<void> deleteTimeEntry({required TimeEntry timeEntry}) async {
    final result =
        await globalApiClient.delete('/time-entries/${timeEntry.id}');
    if (result.statusCode != 204) {
      throw Exception('time_entry_delete_failed');
    }
  }
}
