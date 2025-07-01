import 'package:app/entities/sync/item_type/item_type.dart';
import 'package:app/entities/sync/patch_action/patch_action.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'patch.freezed.dart';
part 'patch.g.dart';

@unfreezed
class Patch with _$Patch {
  const factory Patch({
    required String id,
    required PatchAction action,
    required DateTime patchDate,
    required ItemType type,
    required String itemId, 
  }) = _Patch;

  factory Patch.fromJson(Map<String, dynamic> json) => _$PatchFromJson(json);
}