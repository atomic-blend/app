import 'package:app/entities/device_calendar/calendar/device_calendar.dart';
import 'package:app/services/device_calendar_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'device_calendar.event.dart';
part 'device_calendar.state.dart';

class DeviceCalendarBloc extends Bloc<DeviceCalendarEvent, DeviceCalendarState> {
  final DeviceCalendarService _deviceCalendarService = DeviceCalendarService();
  DeviceCalendarBloc() : super(const DeviceCalendarInitial()) {
    on<GetDeviceCalendar>(_onGetDeviceCalendar);
  }

  Future<void> _onGetDeviceCalendar(
    GetDeviceCalendar event,
    Emitter<DeviceCalendarState> emit,
  ) async {
    emit(const DeviceCalendarLoading());
    try {
      final deviceCalendar = await _deviceCalendarService.retrieveCalendarEvents(
        event.startDate,
        event.endDate,
      );
      emit(DeviceCalendarLoaded(deviceCalendar));
    } catch (e) {
      emit(const DeviceCalendarError("load_device_calendar_error"));
    }
  }
}
//