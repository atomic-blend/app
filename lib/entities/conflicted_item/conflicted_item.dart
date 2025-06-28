import 'package:freezed_annotation/freezed_annotation.dart';

part 'conflicted_item.freezed.dart';
part 'conflicted_item.g.dart';

@freezed
class ConflictedItem with _$ConflictedItem {
  const factory ConflictedItem({
   required String type,
    dynamic oldItem,
    dynamic newItem,
  }) = _ConflictedItem;

  factory ConflictedItem.fromJson(Map<String, dynamic> json) =>
      _$ConflictedItemFromJson(json);
}
