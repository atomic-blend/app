
import 'package:device_calendar/device_calendar.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_calendar.freezed.dart';
part 'device_calendar.g.dart';

@unfreezed
class DeviceCalendar with _$DeviceCalendar {
  DeviceCalendar._();
  factory DeviceCalendar({
    required Calendar calendar,
    required List<Event> events,
  }) = _DeviceCalendar;

  factory DeviceCalendar.fromJson(Map<String, dynamic> json) =>
      _$DeviceCalendarFromJson(json);
}