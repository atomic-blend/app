import 'package:app/entities/tag/tag.entity.dart';
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
    int? priority,
    String? folderId,
    List<TagEntity>? tags,
    List<DateTime>? reminders,
    bool? completed,
  }) = _TaskEntity;

  static final nonEncryptedFields = [
    'id',
    'createdAt',
    'updatedAt',
    'user',
    'reminders',
    'folderId',
    'startDate',
    'endDate',
    'priority',
    'completed'
  ];

  static final manualParseFields = ['tags'];

  factory TaskEntity.fromJson(Map<String, dynamic> json) =>
      _$TaskEntityFromJson(json);

  @override
  String toString() {
    return 'TaskEntity { id: $id, title: $title, description: $description, start_date: $startDate, created_at: $createdAt, updated_at: $updatedAt, completed: $completed }';
  }

  Future<Map<String, dynamic>> encrypt(
      {required EncryptionService encryptionService}) async {
    final encryptedTags = [];
    if (tags != null) {
      for (var tag in tags!) {
        encryptedTags
            .add(await tag.encrypt(encryptionService: encryptionService));
      }
    }
    Map<String, dynamic> encryptedData = {
      'id': id,
      'title': await encryptionService.encryptJson(title),
      'description': await encryptionService.encryptJson(description),
      'createdAt': createdAt?.toUtc().toIso8601String(),
      'updatedAt': updatedAt?.toUtc().toIso8601String(),
      'startDate': startDate?.toUtc().toIso8601String(),
      'endDate': endDate?.toUtc().toIso8601String(),
      'tags': encryptedTags,
      'folderId': folderId,
      'priority': priority,
      'reminders': reminders?.map((e) => e.toUtc().toIso8601String()).toList(),
      'completed': completed
    };
    return encryptedData;
  }

  static Future<TaskEntity> decrypt(
      Map<String, dynamic> data, EncryptionService encryptionService) async {
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

    final task = TaskEntity.fromJson(decryptedData);

    if (decryptedData['tags'] != null) {
      decryptedData['tags'] = await Future.wait((decryptedData['tags'] as List)
          .map((tag) => TagEntity.decrypt(tag, encryptionService)));
      task.tags = decryptedData['tags'];
    }

    return task;
  }
}
