// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PatchImpl _$$PatchImplFromJson(Map<String, dynamic> json) => _$PatchImpl(
      id: json['id'] as String,
      action: $enumDecode(_$PatchActionEnumMap, json['action']),
      patchDate: const Iso8601DateTimeConverter()
          .fromJson(json['patchDate'] as String),
      itemType: $enumDecode(_$ItemTypeEnumMap, json['itemType']),
      itemId: json['itemId'] as String,
      changes: (json['changes'] as List<dynamic>)
          .map((e) => PatchChange.fromJson(e as Map<String, dynamic>))
          .toList(),
      force: json['force'] as bool?,
    );

Map<String, dynamic> _$$PatchImplToJson(_$PatchImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'action': _$PatchActionEnumMap[instance.action]!,
      'patchDate': const Iso8601DateTimeConverter().toJson(instance.patchDate),
      'itemType': _$ItemTypeEnumMap[instance.itemType]!,
      'itemId': instance.itemId,
      'changes': instance.changes,
      'force': instance.force,
    };

const _$PatchActionEnumMap = {
  PatchAction.create: 'create',
  PatchAction.update: 'update',
  PatchAction.delete: 'delete',
};

const _$ItemTypeEnumMap = {
  ItemType.task: 'task',
  ItemType.note: 'note',
};
