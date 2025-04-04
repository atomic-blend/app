import 'package:freezed_annotation/freezed_annotation.dart';

part 'habit_entry.entity.freezed.dart';
part 'habit_entry.entity.g.dart';

@unfreezed

class HabitEntry with _$HabitEntry {
  const factory HabitEntry({
    required String id,
    required String habitId,
    required String userId,
    required DateTime entryDate,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _HabitEntry;

  factory HabitEntry.fromJson(Map<String, dynamic> json) =>
      _$HabitEntryFromJson(json);
}