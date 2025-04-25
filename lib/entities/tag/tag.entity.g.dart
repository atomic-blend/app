// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TagEntityImpl _$$TagEntityImplFromJson(Map<String, dynamic> json) =>
    _$TagEntityImpl(
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      name: json['name'] as String,
      color: json['color'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$TagEntityImplToJson(_$TagEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'color': instance.color,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
