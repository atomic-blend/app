import 'package:freezed_annotation/freezed_annotation.dart';

part 'change.freezed.dart';
part 'change.g.dart';

@unfreezed
class Change with _$Change {
  const factory Change({
    required String key,
    required String value,
  }) = _Change;

  factory Change.fromJson(Map<String, dynamic> json) => _$ChangeFromJson(json);
}