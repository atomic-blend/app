import 'package:app/services/encryption.service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'folder.entity.g.dart';
part 'folder.entity.freezed.dart';

@unfreezed
class Folder with _$Folder {
  Folder._();

  factory Folder({
    required String id,
    required String name,
    String? emoji,
    String? color,
    DateTime? createdAt,
    DateTime? updatedAt,
    required List<String> notes,
  }) = _Folder;

  factory Folder.fromJson(Map<String, dynamic> json) => _$FolderFromJson(json);

  static const nonEncryptedFields = [
    'id',
    'createdAt',
    'updatedAt',
  ];

  static const manualParseFields = [];

  @override
  String toString() {
    return 'Folder { id: $id, name: $name, emoji: $emoji, color: $color, created_at: $createdAt, updated_at: $updatedAt }';
  }

  Future<Map<String, dynamic>> encrypt(
      {required EncryptionService encryptionService}) async {
    return {
      'id': id,
      'name': await encryptionService.encryptJson(name),
      'emoji': await encryptionService.encryptJson(emoji),
      'color': await encryptionService.encryptJson(color),
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  static Future<Folder> decrypt(
    Map<String, dynamic> data,
    EncryptionService encryptionService,
  ) async {
    Map<String, dynamic> decryptedData = {};

    for (var entry in data.entries) {
      if (nonEncryptedFields.contains(entry.key) ||
          manualParseFields.contains(entry.key)) {
        decryptedData[entry.key] = entry.value;
      } else {
        decryptedData[entry.key] =
            await encryptionService.decryptJson(entry.value);
      }
    }

    final folder = Folder.fromJson(decryptedData);

    return folder;
  }
}
