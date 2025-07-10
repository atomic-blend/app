import 'package:app/entities/sync/item_type/item_type.dart';
import 'package:app/entities/sync/patch_action/patch_action.dart';
import 'package:app/entities/sync/patch_change/patch_change.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'patch.freezed.dart';
part 'patch.g.dart';

@unfreezed
class Patch with _$Patch {
  factory Patch({
    required String id,
    required PatchAction action,
    @Iso8601DateTimeConverter() required DateTime patchDate,
    required ItemType itemType,
    required String itemId,
    required List<PatchChange> changes,
    bool? force,
  }) = _Patch;

  factory Patch.fromJson(Map<String, dynamic> json) => _$PatchFromJson(json);
}

class Iso8601DateTimeConverter implements JsonConverter<DateTime, String> {
  const Iso8601DateTimeConverter();

  @override
  DateTime fromJson(String s) => DateTime.parse(s);

  @override
  String toJson(DateTime dt) => dt.toUtc().toIso8601String();
}
