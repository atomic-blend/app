// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SyncResultImpl _$$SyncResultImplFromJson(Map<String, dynamic> json) =>
    _$SyncResultImpl(
      success:
          (json['success'] as List<dynamic>).map((e) => e as String).toList(),
      conflicts: (json['conflicts'] as List<dynamic>)
          .map((e) => ConflictedItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      errors: (json['errors'] as List<dynamic>)
          .map((e) => PatchError.fromJson(e as Map<String, dynamic>))
          .toList(),
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$SyncResultImplToJson(_$SyncResultImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'conflicts': instance.conflicts,
      'errors': instance.errors,
      'date': instance.date.toIso8601String(),
    };
