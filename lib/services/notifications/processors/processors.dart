import 'package:app/services/notifications/processors/task_due_processor.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class Processors {
  static processAndNotify(RemoteMessage message) {
    switch (message.data['payload_type']) {
      case 'task_due':
        TaskDueProcessor.processAndNotify(message);
        break;
      default:
        throw UnimplementedError(
            'No processor found for payload type: ${message.data['payload_type']}');
    }
  }
}
