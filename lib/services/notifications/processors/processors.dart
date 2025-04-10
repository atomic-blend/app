import 'package:app/services/notifications/processors/habit_reminder_processor.dart';
import 'package:app/services/notifications/processors/task_due_processor.dart';
import 'package:app/services/notifications/processors/task_starting_processor.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class Processors {
  static processAndNotify(RemoteMessage message) async {
    switch (message.data['type']) {
      case 'TASK_DUE':
        await TaskDueProcessor.processAndNotify(message);
        break;
      case 'TASK_STARTING':
        await TaskStartingProcessor.processAndNotify(message);
        break;
      case 'HABIT_REMINDER':
        await HabitReminderProcessor.processAndNotify(message);
        break;
      default:
        throw UnimplementedError(
            'No processor found for payload type: ${message.data['payload_type']}');
    }
  }
}
