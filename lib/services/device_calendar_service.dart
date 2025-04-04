import 'package:app/entities/device_calendar/calendar/device_calendar.dart';
import 'package:device_calendar/device_calendar.dart';

class DeviceCalendarService {
  final DeviceCalendarPlugin _deviceCalendarPlugin = DeviceCalendarPlugin();

  Future retrieveCalendarEvents(DateTime startDate, DateTime endDate) async {
    List<DeviceCalendar> calendars = [];
    var calendarsResult = await _deviceCalendarPlugin.retrieveCalendars();

    for (var calendarResult in calendarsResult.data ?? []) {
      var eventsResult = await _deviceCalendarPlugin.retrieveEvents(
        calendarResult.id,
        RetrieveEventsParams(
          startDate: startDate,
          endDate: endDate,
        ),
      );
      calendars.add(DeviceCalendar(
        calendar: calendarResult,
        events: eventsResult.data ?? [],
      ));
    }

    return calendars;
  }
}
