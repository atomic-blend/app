import 'package:app/entities/time_entry/time_entry.entity.dart';
import 'package:app/services/user.service.dart';
import 'package:app/utils/api_client.dart';

class TimeEntryService {
  Future<TimeEntry> addTimeEntry({required TimeEntry timeEntry}) async {
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
}
