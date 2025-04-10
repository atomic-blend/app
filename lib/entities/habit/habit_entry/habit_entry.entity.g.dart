// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_entry.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HabitEntryImpl _$$HabitEntryImplFromJson(Map<String, dynamic> json) =>
    _$HabitEntryImpl(
      id: json['id'] as String?,
      habitId: json['habitId'] as String,
      userId: json['userId'] as String?,
      entryDate: DateTime.parse(json['entryDate'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$HabitEntryImplToJson(_$HabitEntryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'habitId': instance.habitId,
      'userId': instance.userId,
      'entryDate': instance.entryDate.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
