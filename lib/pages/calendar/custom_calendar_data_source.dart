import 'package:app/pages/calendar/custom_appointment.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CustomCalendarDataSource extends CalendarDataSource {
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
    return (appointments![index] as CustomAppointment).isAllDay;
  }

  String getItemId(int index) {
    return (appointments![index] as CustomAppointment).itemId;
  }
}
