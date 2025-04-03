// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_calendar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeviceCalendarImpl _$$DeviceCalendarImplFromJson(Map<String, dynamic> json) =>
    _$DeviceCalendarImpl(
      calendar: Calendar.fromJson(json['calendar'] as Map<String, dynamic>),
      events: (json['events'] as List<dynamic>)
          .map((e) => Event.fromJson(e as Map<String, dynamic>?))
          .toList(),
    );

Map<String, dynamic> _$$DeviceCalendarImplToJson(
        _$DeviceCalendarImpl instance) =>
    <String, dynamic>{
      'calendar': instance.calendar,
      'events': instance.events,
    };
