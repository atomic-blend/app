import 'package:app/blocs/device_calendar/device_calendar.bloc.dart';
import 'package:app/blocs/tasks/tasks.bloc.dart';
import 'package:app/entities/device_calendar/calendar/device_calendar.dart';
import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/pages/calendar/appointment_data_source.dart';
import 'package:app/pages/calendar/custom_appointment.dart';
import 'package:app/pages/calendar/custom_calendar_data_source.dart';
import 'package:app/pages/calendar/device_event_detail.dart';
import 'package:app/pages/tasks/task_detail.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:collection/collection.dart';
import 'package:device_calendar/device_calendar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Calendar extends StatefulWidget {
  final CalendarView view;
  final int? numberOfDays;
  const Calendar({super.key, required this.view, this.numberOfDays});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  void initState() {
    context.read<DeviceCalendarBloc>().add(
          GetDeviceCalendar(
            DateTime.now().subtract(const Duration(days: 30)),
            DateTime.now().add(const Duration(days: 30)),
          ),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeviceCalendarBloc, DeviceCalendarState>(
        builder: (context, deviceCalendarState) {
      return BlocBuilder<TasksBloc, TasksState>(builder: (context, taskState) {
        return SfCalendar(
          view: widget.view,
          initialSelectedDate: DateTime.now(),
          backgroundColor: getTheme(context).surface,
          showTodayButton: true,
          todayHighlightColor: getTheme(context).primary,
          timeSlotViewSettings: TimeSlotViewSettings(
              numberOfDaysInView: widget.numberOfDays ?? -1,
              timeFormat: "HH:mm"),
          selectionDecoration: BoxDecoration(
            color: getTheme(context).primary.withValues(alpha: 0.2),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(6),
          ),
          headerStyle: CalendarHeaderStyle(
              backgroundColor: getTheme(context).surface,
              textStyle: getTextTheme(context).headlineMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  )),
          monthViewSettings: MonthViewSettings(
            showAgenda: true,
            dayFormat: 'EEE',
            agendaStyle: AgendaStyle(
              appointmentTextStyle: getTextTheme(context).bodyMedium,
              dateTextStyle: getTextTheme(context).bodyMedium,
            ),
          ),
          dataSource: _getDataSource(
              taskState.tasks ?? [], deviceCalendarState.deviceCalendar ?? []),
          appointmentBuilder:
              (BuildContext context, CalendarAppointmentDetails details) {
            final CustomAppointment appointment =
                details.appointments.first as CustomAppointment;

            return LayoutBuilder(builder: (context, constraints) {
              return Container(
                decoration: BoxDecoration(
                  color: appointment.color,
                  borderRadius: BorderRadius.circular(6),
                ),
                padding: EdgeInsets.symmetric(horizontal: $constants.insets.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: constraints.maxHeight,
                      child: AutoSizeText(
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        appointment.subject,
                        style: getTextTheme(context).bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    // Text(
                    //   "${Jiffy.parseFromDateTime(details.appointments.first.startTime).Hm.toString()} - ${Jiffy.parseFromDateTime(details.appointments.first.endTime).Hm.toString()}",
                    //   style: getTextTheme(context).bodySmall!,
                    // ),
                  ],
                ),
              );
            });
          },
          onTap: (calendarTapDetails) {
            if (calendarTapDetails.appointments?.first.itemType ==
                CustomAppointmentType.task) {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => Container(
                        height: getSize(context).height * 0.8,
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular($constants.corners.md),
                          child: TaskDetail(
                            task: taskState.tasks!.firstWhere((element) =>
                                element.id ==
                                calendarTapDetails.appointments?.first.itemId),
                          ),
                        ),
                      ));
            } else if (calendarTapDetails.appointments?.first.itemType ==
                CustomAppointmentType.event) {
              //TODO
              Event? event;
              for (DeviceCalendar calendar
                  in deviceCalendarState.deviceCalendar ?? []) {
                event = calendar.events.firstWhereOrNull((element) =>
                    element.eventId ==
                    calendarTapDetails.appointments?.first.itemId);
              }
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => Container(
                        height: getSize(context).height * 0.83,
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular($constants.corners.md),
                          child: DeviceEventDetail(
                            event: event!,
                          ),
                        ),
                      ));
            }
          },
        );
      });
    });
  }

  CustomCalendarDataSource _getTasks(List<TaskEntity> tasks) {
    final List<CustomAppointment> appointments = <CustomAppointment>[];
    for (TaskEntity task in tasks) {
      if (task.startDate != null && task.endDate != null) {
        appointments.add(
          CustomAppointment(
            startTime: task.startDate!.toLocal()!,
            endTime: task.endDate!.toLocal(),
            subject: task.title,
            color: getTheme(context).primary.withValues(alpha: 0.2),
            notes: task.description,
            isAllDay: false,
            itemType: CustomAppointmentType.task,
            itemId: task.id ?? '',
          ),
        );
      } else if (task.endDate != null) {
        appointments.add(
          CustomAppointment(
            startTime: task.endDate!,
            endTime: task.endDate!.add(const Duration(minutes: 30)),
            subject: task.title,
            color: getTheme(context).primary,
            notes: task.description,
            isAllDay: false,
            itemType: CustomAppointmentType.task,
            itemId: task.id ?? '',
          ),
        );
      }
    }
    return CustomCalendarDataSource(appointments);
  }

  CustomCalendarDataSource _getDeviceEvents(List<DeviceCalendar> calendars) {
    final List<CustomAppointment> appointments = <CustomAppointment>[];
    for (DeviceCalendar calendar in calendars) {
      for (Event event in calendar.events) {
        appointments.add(
          CustomAppointment(
            startTime: event.start!.toLocal(),
            endTime: event.end!.toLocal(),
            subject: event.title ?? "No title",
            color: calendar.calendar.color != null
                ? Color(calendar.calendar.color!).withValues(alpha: 0.5)
                : getTheme(context).primary.withValues(alpha: 0.2),
            notes: event.description,
            isAllDay: event.allDay ?? false,
            itemType: CustomAppointmentType.event,
            itemId: event.eventId ?? '',
          ),
        );
      }
    }
    return CustomCalendarDataSource(appointments);
  }

  CalendarDataSource _getDataSource(
      List<TaskEntity> tasks, List<DeviceCalendar> calendars) {
    final List<CustomAppointment> appointments = <CustomAppointment>[];

    // Add tasks
    final taskAppointments = _getTasks(tasks);
    if (taskAppointments.appointments != null) {
      appointments
          .addAll(taskAppointments.appointments!.cast<CustomAppointment>());
    }

    // Add events
    final eventAppointments = _getDeviceEvents(calendars);
    if (eventAppointments.appointments != null) {
      appointments
          .addAll(eventAppointments.appointments!.cast<CustomAppointment>());
    }

    return CustomCalendarDataSource(appointments);
  }
}
