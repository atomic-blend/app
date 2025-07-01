import 'package:freezed_annotation/freezed_annotation.dart';

part 'patch_error.freezed.dart';
part 'patch_error.g.dart';

@freezed
class PatchError with _$PatchError {
  const factory PatchError({
    required String patchId,
    required String errorCode,
  }) = _PatchError;

  factory PatchError.fromJson(Map<String, dynamic> json) => _$PatchErrorFromJson(json);
}