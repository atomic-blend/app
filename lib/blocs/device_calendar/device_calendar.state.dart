part of 'device_calendar.bloc.dart';

sealed class DeviceCalendarState extends Equatable {
  const DeviceCalendarState({
    this.deviceCalendar,
  });

  final List<DeviceCalendar>? deviceCalendar;

  @override
  List<Object?> get props => [deviceCalendar];
}

class DeviceCalendarInitial extends DeviceCalendarState {
  const DeviceCalendarInitial() : super();
}

class DeviceCalendarLoading extends DeviceCalendarState {
  const DeviceCalendarLoading() : super();
}

class DeviceCalendarLoaded extends DeviceCalendarState {
  const DeviceCalendarLoaded(List<DeviceCalendar> deviceCalendar)
      : super(deviceCalendar: deviceCalendar);
}

class DeviceCalendarError extends DeviceCalendarState {
  const DeviceCalendarError(this.message) : super();

  final String message;

  @override
  List<Object?> get props => [message];
}
