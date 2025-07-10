import 'package:app/entities/sync/conflicted_item/conflicted_item.dart';
import 'package:app/entities/sync/patch_error/patch_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sync_result.freezed.dart';
part 'sync_result.g.dart';

@freezed
class SyncResult with _$SyncResult {
  const factory SyncResult({
    required List<String> success,
    required List<ConflictedItem> conflicts,
    required List<PatchError> errors,
    required DateTime date,
  }) = _SyncResult;

  factory SyncResult.fromJson(Map<String, dynamic> json) =>
      _$SyncResultFromJson(json);
}