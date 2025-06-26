
import 'package:app/entities/tasks/tasks.entity.dart';

class WidgetData {
  final List<TaskEntity> tasks;
  final bool isSubscribed;
  WidgetData({required this.tasks, required this.isSubscribed});
  WidgetData.fromJson(Map<String, dynamic> json)
      : tasks = (json['tasks'] as List)
            .map((task) => TaskEntity.fromJson(task))
            .toList(),
        isSubscribed = json['isSubscribed'] ?? false;
  Map<String, dynamic> toJson() => {
        'tasks': tasks.map((task) => task.toJson()).toList(),
        'isSubscribed': isSubscribed,
      };
}