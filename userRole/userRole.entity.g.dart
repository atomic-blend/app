// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userRole.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserRoleEntityImpl _$$UserRoleEntityImplFromJson(Map<String, dynamic> json) =>
    _$UserRoleEntityImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      creation_date: DateTime.parse(json['creation_date'] as String),
      last_updated: DateTime.parse(json['last_updated'] as String),
    );

Map<String, dynamic> _$$UserRoleEntityImplToJson(
        _$UserRoleEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'creation_date': instance.creation_date.toIso8601String(),
      'last_updated': instance.last_updated.toIso8601String(),
    };
