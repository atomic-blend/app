import 'package:freezed_annotation/freezed_annotation.dart';

part 'habit_entry.entity.freezed.dart';
part 'habit_entry.entity.g.dart';

@unfreezed

class HabitEntry with _$HabitEntry {
   factory HabitEntry({
    String? id,
    required String habitId,
    String? userId,
    required DateTime entryDate,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _HabitEntry;

  factory HabitEntry.fromJson(Map<String, dynamic> json) =>
      _$HabitEntryFromJson(json);
}