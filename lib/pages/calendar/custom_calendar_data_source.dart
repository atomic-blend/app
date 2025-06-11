import 'package:app/pages/calendar/custom_appointment.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CustomCalendarDataSource extends CalendarDataSource<CustomAppointment> {
  CustomCalendarDataSource(List<CustomAppointment> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return (appointments![index] as CustomAppointment).startTime;
  }

  @override
  DateTime getEndTime(int index) {
    return (appointments![index] as CustomAppointment).endTime;
  }

  @override
  String getSubject(int index) {
    return (appointments![index] as CustomAppointment).subject;
  }

  @override
  Color getColor(int index) {
    return (appointments![index] as CustomAppointment).color;
  }

  @override
  bool isAllDay(int index) {
    return (appointments![index] as CustomAppointment).isAllDay ?? false;
  }

  String getItemId(int index) {
    return (appointments![index] as CustomAppointment).itemId;
  }

  @override
  CustomAppointment convertAppointmentToObject(
      Object? customData, Appointment appointment) {
    return CustomAppointment(
      startTime: appointment.startTime,
      endTime: appointment.endTime,
      subject: appointment.subject,
      color: appointment.color,
      notes: appointment.notes,
      isAllDay: appointment.isAllDay,
      itemType: (customData as CustomAppointment).itemType,
      itemId: customData.itemId,
    );
  }
}
