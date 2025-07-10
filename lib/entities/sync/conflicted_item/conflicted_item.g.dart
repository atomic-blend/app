// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conflicted_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConflictedItemImpl _$$ConflictedItemImplFromJson(Map<String, dynamic> json) =>
    _$ConflictedItemImpl(
      type: $enumDecode(_$ItemTypeEnumMap, json['type']),
      patchId: json['patchId'] as String,
      remoteObject: json['remoteObject'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$ConflictedItemImplToJson(
        _$ConflictedItemImpl instance) =>
    <String, dynamic>{
      'type': _$ItemTypeEnumMap[instance.type]!,
      'patchId': instance.patchId,
      'remoteObject': instance.remoteObject,
    };

const _$ItemTypeEnumMap = {
  ItemType.task: 'task',
  ItemType.note: 'note',
};
