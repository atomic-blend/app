// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conflicted_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConflictedItemImpl _$$ConflictedItemImplFromJson(Map<String, dynamic> json) =>
    _$ConflictedItemImpl(
      type: json['type'] as String,
      oldItem: json['oldItem'],
      newItem: json['newItem'],
    );

Map<String, dynamic> _$$ConflictedItemImplToJson(
        _$ConflictedItemImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'oldItem': instance.oldItem,
      'newItem': instance.newItem,
    };
