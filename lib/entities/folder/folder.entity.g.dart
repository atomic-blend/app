// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FolderImpl _$$FolderImplFromJson(Map<String, dynamic> json) => _$FolderImpl(
      id: json['id'] as String?,
      name: json['name'] as String,
      emoji: json['emoji'] as String?,
      color: json['color'] as String?,
      userId: json['userId'] as String?,
      parentId: json['parentId'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$FolderImplToJson(_$FolderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'emoji': instance.emoji,
      'color': instance.color,
      'userId': instance.userId,
      'parentId': instance.parentId,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
