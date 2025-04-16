import 'package:app/services/encryption.service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag.entity.freezed.dart';
part 'tag.entity.g.dart';

@unfreezed
class TagEntity with _$TagEntity {
  TagEntity._();
  factory TagEntity({
    String? id,
    String? userId,
    required String name,
    String? color,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _TagEntity;

  static final nonEncryptedFields = [
    'id',
    'userId',
    'createdAt',
    'updatedAt',
  ];

  factory TagEntity.fromJson(Map<String, dynamic> json) =>
      _$TagEntityFromJson(json);

  @override
  String toString() {
    return 'TagEntity { id: $id, userId: $userId, name: $name, color: $color, created_at: $createdAt, updated_at: $updatedAt }';
  }

  Future<Map<String, dynamic>> encrypt(
      {required EncryptionService encryptionService}) async {
    Map<String, dynamic> encryptedData = {
      'id': id,
      'userId': userId,
      'name': await encryptionService.encryptJson(name),
      'color': await encryptionService.encryptJson(color),
      'createdAt': createdAt?.toUtc().toIso8601String(),
      'updatedAt': updatedAt?.toUtc().toIso8601String(),
    };
    return encryptedData;
  }

  static Future<TagEntity> decrypt(
      Map<String, dynamic> data, EncryptionService encryptionService) async {
    Map<String, dynamic> decryptedData = {};

    for (var entry in data.entries) {
      if (nonEncryptedFields.contains(entry.key)) {
        decryptedData[entry.key] = entry.value;
      } else {
        decryptedData[entry.key] =
            await encryptionService.decryptJson(entry.value);
      }
    }

    return TagEntity.fromJson(decryptedData);
  }
}
