import 'package:freezed_annotation/freezed_annotation.dart';

part 'patch_change.freezed.dart';
part 'patch_change.g.dart';

@unfreezed
class PatchChange with _$PatchChange {
  factory PatchChange({
    required String key,
    required dynamic value,
  }) = _PatchChange;

  factory PatchChange.fromJson(Map<String, dynamic> json) => _$PatchChangeFromJson(json);
}