part of 'device_calendar.bloc.dart';

sealed class DeviceCalendarEvent {
  const DeviceCalendarEvent();
}

final class GetDeviceCalendar extends DeviceCalendarEvent {
  final DateTime startDate;
  final DateTime endDate;
  const GetDeviceCalendar(this.startDate, this.endDate);
}