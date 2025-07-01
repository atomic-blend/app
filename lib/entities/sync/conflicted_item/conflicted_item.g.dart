// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conflicted_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConflictedItemImpl _$$ConflictedItemImplFromJson(Map<String, dynamic> json) =>
    _$ConflictedItemImpl(
      type: $enumDecode(_$ItemTypeEnumMap, json['type']),
      remoteItem: json['remoteItem'],
      localItem: json['localItem'],
    );

Map<String, dynamic> _$$ConflictedItemImplToJson(
        _$ConflictedItemImpl instance) =>
    <String, dynamic>{
      'type': _$ItemTypeEnumMap[instance.type]!,
      'remoteItem': instance.remoteItem,
      'localItem': instance.localItem,
    };

const _$ItemTypeEnumMap = {
  ItemType.task: 'task',
  ItemType.note: 'note',
};
