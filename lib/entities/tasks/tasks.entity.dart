import 'package:app/services/encryption.service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tasks.entity.freezed.dart';
part 'tasks.entity.g.dart';

@unfreezed
class TaskEntity with _$TaskEntity {
  TaskEntity._();
  factory TaskEntity({
    String? id,
    required String title,
    String? description,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? completed,
  }) = _TaskEntity;

  static final nonEncryptedFields = [
    'id',
    'createdAt',
    'updatedAt',
    'user',
    'start_date',
    'completed'
  ];

  factory TaskEntity.fromJson(Map<String, dynamic> json) =>
      _$TaskEntityFromJson(json);

  @override
  String toString() {
    return 'TaskEntity { id: $id, title: $title, description: $description, start_date: $startDate, created_at: $createdAt, updated_at: $updatedAt, completed: $completed }';
  }

  Future<Map<String, dynamic>> encrypt(
      {required EncryptionService encryptionService}) async {
    Map<String, dynamic> encryptedData = {};

    for (var entry in toJson().entries) {
      if (nonEncryptedFields.contains(entry.key)) {
        encryptedData[entry.key] = entry.value;
      } else {
        encryptedData[entry.key] =
            await encryptionService.encryptJson(entry.value);
      }
    }
    return encryptedData;
  }

  static Future<TaskEntity> decrypt(
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

    return TaskEntity.fromJson(decryptedData);
  }
}
