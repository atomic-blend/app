// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HabitImpl _$$HabitImplFromJson(Map<String, dynamic> json) => _$HabitImpl(
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      name: json['name'] as String?,
      emoji: json['emoji'] as String?,
      citation: json['citation'] as String?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      frequency: json['frequency'] as String?,
      duration: json['duration'] == null
          ? null
          : Duration(microseconds: (json['duration'] as num).toInt()),
      numberOfTimes: (json['numberOfTimes'] as num?)?.toInt(),
      daysOfWeek: (json['daysOfWeek'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      daysOfMonth: (json['daysOfMonth'] as List<dynamic>?)
          ?.map((e) => DateTime.parse(e as String))
          .toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      reminders: (json['reminders'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      entries: (json['entries'] as List<dynamic>?)
          ?.map((e) => HabitEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$HabitImplToJson(_$HabitImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'emoji': instance.emoji,
      'citation': instance.citation,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'frequency': instance.frequency,
      'duration': instance.duration?.inMicroseconds,
      'numberOfTimes': instance.numberOfTimes,
      'daysOfWeek': instance.daysOfWeek,
      'daysOfMonth':
          instance.daysOfMonth?.map((e) => e.toIso8601String()).toList(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'reminders': instance.reminders,
      'entries': instance.entries,
    };
