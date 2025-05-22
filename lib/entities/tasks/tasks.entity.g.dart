// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskEntityImpl _$$TaskEntityImplFromJson(Map<String, dynamic> json) =>
    _$TaskEntityImpl(
      id: json['id'] as String?,
      title: json['title'] as String,
      description: json['description'] as String?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      priority: (json['priority'] as num?)?.toInt(),
      folder: json['folder'] == null
          ? null
          : Folder.fromJson(json['folder'] as Map<String, dynamic>),
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => TagEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      reminders: (json['reminders'] as List<dynamic>?)
          ?.map((e) => DateTime.parse(e as String))
          .toList(),
      timeEntries: (json['timeEntries'] as List<dynamic>?)
          ?.map((e) => TimeEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      completed: json['completed'] as bool?,
    );

Map<String, dynamic> _$$TaskEntityImplToJson(_$TaskEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'priority': instance.priority,
      'folder': instance.folder,
      'tags': instance.tags,
      'reminders': instance.reminders?.map((e) => e.toIso8601String()).toList(),
      'timeEntries': instance.timeEntries,
      'completed': instance.completed,
    };
