import 'package:app/entities/folder/folder.entity.dart';
import 'package:app/entities/tag/tag.entity.dart';
import 'package:app/entities/time_entry/time_entry.entity.dart';
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
    Folder? folder,
    List<TagEntity>? tags,
    List<DateTime>? reminders,
    List<TimeEntry>? timeEntries,
    bool? completed,
  }) = _TaskEntity;

  static final nonEncryptedFields = [
    'id',
    'createdAt',
    'updatedAt',
    'user',
    'reminders',
    'startDate',
    'endDate',
    'priority',
    'completed'
  ];

  static final manualParseFields = ['tags', 'timeEntries', 'folder'];

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
    final encryptedTimeEntries = [];
    if (timeEntries != null) {
      for (var timeEntry in timeEntries!) {
        encryptedTimeEntries
            .add(await timeEntry.encrypt(encryptionService: encryptionService));
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
      'folder': folder?.id,
      'timeEntries': encryptedTimeEntries,
      'priority': priority,
      'reminders': reminders?.map((e) => e.toUtc().toIso8601String()).toList(),
      'completed': completed
    };
    return encryptedData;
  }

  static Future<TaskEntity> decrypt(
      Map<String, dynamic> data, EncryptionService encryptionService) async {
    Map<String, dynamic> decryptedData = {};

    List<dynamic>? encryptedTimeEntries = [];
    dynamic encryptedFolder;

    for (var entry in data.entries) {
      if (nonEncryptedFields.contains(entry.key) ||
          manualParseFields.contains(entry.key)) {
        decryptedData[entry.key] = entry.value;
      } else {
        decryptedData[entry.key] =
            await encryptionService.decryptJson(entry.value);
      }
    }

    encryptedTimeEntries = decryptedData['timeEntries'];
    decryptedData['timeEntries'] = null;
    encryptedFolder = decryptedData['folder'];
    decryptedData['folder'] = null;

    final task = TaskEntity.fromJson(decryptedData);

    if (decryptedData['tags'] != null) {
      decryptedData['tags'] = await Future.wait((decryptedData['tags'] as List)
          .map((tag) => TagEntity.decrypt(tag, encryptionService)));
      task.tags = decryptedData['tags'];
    }

    if (encryptedTimeEntries != null) {
      decryptedData['timeEntries'] = await Future.wait(encryptedTimeEntries.map(
          (timeEntry) => TimeEntry.decrypt(
              data: timeEntry, encryptionService: encryptionService)));
      task.timeEntries = decryptedData['timeEntries'];
    }

    if (encryptedFolder != null) {
      decryptedData['folder'] = await Folder.decrypt(
          encryptedFolder, encryptionService);
      task.folder = decryptedData['folder'];
    }

    return task;
  }
}
