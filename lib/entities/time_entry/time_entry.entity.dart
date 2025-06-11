import 'package:app/services/encryption.service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'time_entry.entity.freezed.dart';
part 'time_entry.entity.g.dart';

@unfreezed
class TimeEntry with _$TimeEntry {
  TimeEntry._();

  factory TimeEntry({
    String? id,
    String? taskId,
    required DateTime startDate,
    required DateTime endDate,
    // Duration in seconds
    required int duration,
    bool? pomodoro,
    bool? timer,
    bool? pomoBreak,
    String? note,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _TimeEntry;

  static final nonEncryptedFields = [
    'id',
    'createdAt',
    'pomodoro',
    'timer',
    'pomoBreak',
    'updatedAt',
  ];

  factory TimeEntry.fromJson(Map<String, dynamic> json) =>
      _$TimeEntryFromJson(json);

  @override
  String toString() {
    return 'TimeEntry { id: $id, start_date: $startDate, end_date: $endDate, created_at: $createdAt, updated_at: $updatedAt }';
  }

  Future<Map<String, dynamic>> encrypt(
      {required EncryptionService encryptionService}) async {
    Map<String, dynamic> encryptedData = {
      'id': id,
      'startDate': await encryptionService
          .encryptJson(startDate.toUtc().toIso8601String()),
      'endDate': await encryptionService
          .encryptJson(endDate.toUtc().toIso8601String()),
      'taskId': taskId,
      'duration': await encryptionService.encryptJson(duration.toString()),
      'pomodoro': pomodoro,
      'timer': timer,
      'pomoBreak': pomoBreak,
      'note': await encryptionService.encryptJson(note ?? ''),
      'createdAt': createdAt?.toUtc().toIso8601String(),
      'updatedAt': updatedAt?.toUtc().toIso8601String(),
    };
    return encryptedData;
  }

  static Future<TimeEntry> decrypt(
      {required Map<String, dynamic> data,
      required EncryptionService encryptionService}) async {
    final decryptedStartDate =
        await encryptionService.decryptJson(data['startDate']);
    final decryptedEndDate =
        await encryptionService.decryptJson(data['endDate']);

    return TimeEntry(
      id: data['id'],
      startDate: DateTime.parse(decryptedStartDate),
      endDate: DateTime.parse(decryptedEndDate),
      duration: int.parse(await encryptionService.decryptJson(data['duration'])),
      taskId: data['taskId'] as String?,
      pomodoro: data['pomodoro'] as bool?,
      timer: data['timer'] as bool?,
      pomoBreak: data['pomoBreak'] as bool?,
      note: data['note'] != null
          ? await encryptionService.decryptJson(data['note'])
          : null,
      createdAt:
          data['createdAt'] != null ? DateTime.parse(data['createdAt']) : null,
      updatedAt:
          data['updatedAt'] != null ? DateTime.parse(data['updatedAt']) : null,
    );
  }
}
