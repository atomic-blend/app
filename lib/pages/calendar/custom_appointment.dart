import 'package:syncfusion_flutter_calendar/calendar.dart';

enum CustomAppointmentType {
  task,
  event,
  habit,
}

class CustomAppointment extends Appointment {
  final CustomAppointmentType itemType;
  final String itemId;

  CustomAppointment({
    required super.startTime,
    required super.endTime,
    required super.subject,
    required super.color,
    super.notes,
    super.isAllDay,
    required this.itemType,
    required this.itemId,
  });
}
