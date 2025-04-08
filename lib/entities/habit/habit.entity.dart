import 'package:app/entities/habit/habit_entry/habit_entry.entity.dart';
import 'package:app/services/encryption.service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'habit.entity.freezed.dart';
part 'habit.entity.g.dart';

@unfreezed
class Habit with _$Habit {
  Habit._();
  factory Habit({
    String? id,
    String? userId,
    String? name,
    String? emoji,
    String? citation,
    DateTime? startDate,
    DateTime? endDate,
    String? frequency,
    Duration? duration,
    int? numberOfTimes,
    List<int>? daysOfWeek,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<String>? reminders,
    List<HabitEntry>? entries,
  }) = _Habit;

  static final nonEncryptedFields = [
    'id',
    'userId',
    'createdAt',
    'updatedAt',
    'userId',
    'entries',
    'reminders',
    'startDate',
    'endDate',
    'frequency',
    'duration',
    'numberOfTimes',
    'daysOfWeek',
    'emoji',
  ];

  Future<Map<String, dynamic>> encrypt(
      {required EncryptionService encryptionService}) async {
    return Map<String, dynamic>.from({
      'id': id,
      'name': await encryptionService.encryptJson(name),
      'emoji': emoji,
      'citation': await encryptionService.encryptJson(citation),
      'createdAt': createdAt?.toUtc().toIso8601String(),
      'updatedAt': updatedAt?.toUtc().toIso8601String(),
      'startDate': startDate?.toUtc().toIso8601String(),
      'duration': duration?.inMilliseconds,
      'endDate': endDate?.toUtc().toIso8601String(),
      'frequency': frequency,
      'numberOfTimes': numberOfTimes,
      'daysOfWeek': daysOfWeek,
      'reminders': reminders,
    });
  }

  static Future<Habit> decrypt(
      Map<String, dynamic> data, EncryptionService encryptionService) async {
    Map<String, dynamic> decryptedData = {};

    for (var entry in data.entries) {
      if (nonEncryptedFields.contains(entry.key)) {
        decryptedData[entry.key] = entry.value;
      } else {
        decryptedData[entry.key] =
            await encryptionService.decryptJson(entry.value);
      }
    }

    final habit = Habit.fromJson(decryptedData);
    habit.duration = Duration(milliseconds: data['duration'] ?? 0);

    return habit;
  }

  factory Habit.fromJson(Map<String, dynamic> json) => _$HabitFromJson(json);
}
