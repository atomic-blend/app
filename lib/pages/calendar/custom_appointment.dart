import 'dart:ui';

enum CustomAppointmentType {
  task,
  event,
  habit,
}

class CustomAppointment {
  final CustomAppointmentType itemType;
  final String itemId;
  final DateTime startTime;
  final DateTime endTime;
  final String subject;
  final Color color;
  final String? notes;
  final bool? isAllDay;

  CustomAppointment({
    required this.startTime,
    required this.endTime,
    required this.subject,
    required this.color,
    this.notes,
    this.isAllDay,
    required this.itemType,
    required this.itemId,
  });
}
