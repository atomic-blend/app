import 'package:app/blocs/app/app.bloc.dart';
import 'package:app/blocs/device_calendar/device_calendar.bloc.dart';
import 'package:app/blocs/habit/habit.bloc.dart';
import 'package:app/blocs/tasks/tasks.bloc.dart';
import 'package:app/components/widgets/elevated_container.dart';
import 'package:app/entities/device_calendar/calendar/device_calendar.dart';
import 'package:app/entities/habit/habit.entity.dart';
import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/pages/calendar/custom_appointment.dart';
import 'package:app/pages/calendar/custom_calendar_data_source.dart';
import 'package:app/pages/calendar/device_event_detail.dart';
import 'package:app/pages/tasks/task_detail.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/exntensions/date_time_extension.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:collection/collection.dart';
import 'package:device_calendar/device_calendar.dart';
import 'package:flutter/foundation.dart';
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
  final calendarEndDate = DateTime.now().add(const Duration(days: 3650));

  @override
  void initState() {
    final deviceCalendarPlugin = DeviceCalendarPlugin();
    deviceCalendarPlugin.requestPermissions().then((_) {
      if (!context.mounted) return;
      _refreshCalendarEvents();
    });
    super.initState();
  }

  _refreshCalendarEvents() {
    context.read<DeviceCalendarBloc>().add(
          GetDeviceCalendar(
            DateTime.now().subtract(const Duration(days: 30)),
            DateTime.now().add(const Duration(days: 30)),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HabitBloc, HabitState>(builder: (context, habitState) {
      return BlocBuilder<DeviceCalendarBloc, DeviceCalendarState>(
          builder: (context, deviceCalendarState) {
        return BlocBuilder<TasksBloc, TasksState>(
            builder: (context, taskState) {
          return Padding(
            padding: EdgeInsets.only(top: $constants.insets.xs),
            child: Padding(
              padding: isDesktop(context)
                  ? EdgeInsets.only(
                      right: $constants.insets.md,
                      left: $constants.insets.sm,
                      bottom: $constants.insets.sm,
                    )
                  : EdgeInsets.only(
                      right: $constants.insets.sm,
                      left: $constants.insets.sm,
                      bottom: $constants.insets.sm,
                    ),
              child: ElevatedContainer(
                padding: EdgeInsets.symmetric(
                  horizontal: $constants.insets.sm,
                  vertical: $constants.insets.xs,
                ),
                child: SfCalendar(
                  view: widget.view,
                  initialDisplayDate: DateTime.now(),
                  maxDate: calendarEndDate,
                  backgroundColor: getTheme(context).surfaceContainer,
                  showTodayButton: true,
                  cellBorderColor: isDarkMode(context)
                      ? Colors.grey.shade800
                      : Colors.grey.shade400,
                  todayHighlightColor: getTheme(context).primary,
                  timeSlotViewSettings: TimeSlotViewSettings(
                      minimumAppointmentDuration: const Duration(minutes: 27),
                      numberOfDaysInView: widget.numberOfDays ?? -1,
                      timeFormat: "HH:mm"),
                  selectionDecoration: BoxDecoration(
                    color: getTheme(context).primary.withValues(alpha: 0.2),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  headerStyle: CalendarHeaderStyle(
                      backgroundColor: getTheme(context).surfaceContainer,
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
                      taskState.tasks ?? [],
                      deviceCalendarState.deviceCalendar ?? [],
                      habitState.habits ?? []),
                  appointmentBuilder: (BuildContext context,
                      CalendarAppointmentDetails details) {
                    final CustomAppointment appointment =
                        details.appointments.first as CustomAppointment;

                    return LayoutBuilder(builder: (context, constraints) {
                      return Container(
                        decoration: BoxDecoration(
                          color: appointment.color,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: $constants.insets.sm),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: constraints.maxHeight,
                              child: AutoSizeText(
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                appointment.subject,
                                style: getTextTheme(context)
                                    .bodyMedium!
                                    .copyWith(fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      );
                    });
                  },
                  onTap: (calendarTapDetails) {
                    if (calendarTapDetails.appointments?.first.itemType ==
                        CustomAppointmentType.task) {
                      showDialog(
                          context: context,
                          builder: (context) => Dialog(
                                insetPadding: EdgeInsets.symmetric(
                                    horizontal: $constants.insets.xs),
                                child: SizedBox(
                                  height: getSize(context).height * 0.7,
                                  width: getSize(context).width,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        $constants.corners.md),
                                    child: TaskDetail(
                                      smallNotes: true,
                                      task: taskState.tasks!.firstWhere(
                                          (element) =>
                                              element.id ==
                                              calendarTapDetails
                                                  .appointments?.first.itemId),
                                    ),
                                  ),
                                ),
                              ));
                    } else if (calendarTapDetails
                            .appointments?.first.itemType ==
                        CustomAppointmentType.event) {
                      Event? event;
                      for (DeviceCalendar calendar
                          in deviceCalendarState.deviceCalendar ?? []) {
                        var findedEvent = calendar.events.firstWhereOrNull(
                            (element) =>
                                element.eventId ==
                                calendarTapDetails.appointments?.first.itemId);
                        if (findedEvent != null) {
                          event = findedEvent;
                          break;
                        }
                      }
                      if (event != null) {
                        showDialog(
                          context: context,
                          builder: (context) => Dialog(
                            insetPadding: EdgeInsets.symmetric(
                                horizontal: $constants.insets.xs),
                            child: SizedBox(
                              height: getSize(context).height * 0.7,
                              width: getSize(context).width,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    $constants.corners.md),
                                child: DeviceEventDetail(
                                  event: event!,
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                    }
                  },
                ),
              ),
            ),
          );
        });
      });
    });
  }

  CustomCalendarDataSource _getTasks(List<TaskEntity> tasks) {
    final List<CustomAppointment> appointments = <CustomAppointment>[];
    for (TaskEntity task in tasks) {
      if (task.startDate != null && task.endDate != null) {
        appointments.add(
          CustomAppointment(
            startTime: task.startDate!.toLocal(),
            endTime: task.endDate!.toLocal(),
            subject: task.title,
            color: task.priority == null
                ? getTheme(context).primary.withValues(alpha: 0.2)
                : (task.priority == 1
                        ? Colors.blueAccent
                        : task.priority == 2
                            ? Colors.deepOrangeAccent
                            : Colors.red)
                    .withValues(
                    alpha: 0.2,
                  ),
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
            color: getTheme(context).primary.withValues(alpha: 0.2),
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
            endTime: event.allDay == true
                ? event.start!.toLocal()
                : event.end!.toLocal(),
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

  CustomCalendarDataSource _getHabitDataSource(List<Habit>? habits,
      {int maxOccurrences = 100}) {
    final List<CustomAppointment> appointments = <CustomAppointment>[];
    for (Habit habit in habits ?? []) {
      switch (habit.frequency) {
        case "daily":
        case "weekly":
          final now = DateTime.now();
          final startTime = habit.startDate!.isBefore(now)
              ? now
              : habit.startDate!; // skip if the habit is not started yet
          final endLimit = habit.endDate ?? calendarEndDate;

          var current = startTime;
          int count = 0;

          while (current.isBefore(endLimit) && count < maxOccurrences) {
            bool shouldAdd = false;

            if (habit.daysOfWeek != null &&
                habit.daysOfWeek!.contains(current.weekday - 1)) {
              shouldAdd = true;
            }

            if (shouldAdd) {
              for (String reminder in habit.reminders ?? []) {
                final startHabitTime = DateTime(
                  current.year,
                  current.month,
                  current.day,
                  int.parse(reminder.split(":")[0]),
                  int.parse(reminder.split(":")[1]),
                );
                final endTime = startHabitTime
                    .add(habit.duration ?? const Duration(minutes: 5));
                appointments.add(
                  CustomAppointment(
                    startTime: startHabitTime,
                    endTime: endTime,
                    subject: habit.name!,
                    color: getTheme(context).primary.withValues(alpha: 0.2),
                    notes: habit.citation,
                    isAllDay: false,
                    itemType: CustomAppointmentType.habit,
                    itemId: habit.id ?? '',
                  ),
                );
              }
              count++;
            }
            current = current.add(const Duration(days: 1));
          }

          break;
        case "monthly":
          final now = DateTime.now();
          final startTime = habit.startDate!.isBefore(now)
              ? now
              : habit.startDate!; // skip if the habit is not started yet
          final endLimit = habit.endDate ?? calendarEndDate;

          var current = startTime;
          int count = 0;

          while (current.isBefore(endLimit) && count < maxOccurrences) {
            bool shouldAdd = false;

            if (habit.daysOfMonth != null &&
                habit.daysOfMonth!.contains(current.midnight())) {
              shouldAdd = true;
            }

            if (shouldAdd) {
              for (String reminder in habit.reminders ?? []) {
                final startHabitTime = DateTime(
                  current.year,
                  current.month,
                  current.day,
                  int.parse(reminder.split(":")[0]),
                  int.parse(reminder.split(":")[1]),
                );
                final endTime = startHabitTime
                    .add(habit.duration ?? const Duration(minutes: 5));
                appointments.add(
                  CustomAppointment(
                    startTime: startHabitTime,
                    endTime: endTime,
                    subject: habit.name!,
                    color: getTheme(context).primary.withValues(alpha: 0.2),
                    notes: habit.citation,
                    isAllDay: false,
                    itemType: CustomAppointmentType.habit,
                    itemId: habit.id ?? '',
                  ),
                );
              }
              count++;
            }
            current = current.add(const Duration(days: 1));
          }
          break;
        case "repeatition":
          final now = DateTime.now();
          final startTime = habit.startDate!.isBefore(now)
              ? now
              : habit.startDate!; // skip if the habit is not started yet
          final endLimit = habit.endDate ?? calendarEndDate;

          // get the last entry date of the habit or use start date
          DateTime lastEntryDate = startTime;

          var current = startTime;
          int count = 0;

          // loop through reminders with the same logic as daily
          while (current.isBefore(endLimit) && count < maxOccurrences) {
            bool shouldAdd = false;

            if (current.difference(lastEntryDate).inDays ==
                habit.numberOfTimes!) {
              shouldAdd = true;
            }

            if (shouldAdd) {
              for (String reminder in habit.reminders ?? []) {
                final startHabitTime = DateTime(
                  current.year,
                  current.month,
                  current.day,
                  int.parse(reminder.split(":")[0]),
                  int.parse(reminder.split(":")[1]),
                );
                final endTime = startHabitTime
                    .add(habit.duration ?? const Duration(minutes: 5));
                appointments.add(
                  CustomAppointment(
                    startTime: startHabitTime,
                    endTime: endTime,
                    subject: habit.name!,
                    color: getTheme(context).primary.withValues(alpha: 0.2),
                    notes: habit.citation,
                    isAllDay: false,
                    itemType: CustomAppointmentType.habit,
                    itemId: habit.id ?? '',
                  ),
                );
                lastEntryDate = current;
              }
              count++;
            }
            current = current.add(const Duration(days: 1));
          }
          break;
        default:
          if (kDebugMode) {
            print("Habit frequency is not supported: ${habit.frequency}");
          }
      }
    }
    return CustomCalendarDataSource(appointments);
  }

  CalendarDataSource _getDataSource(List<TaskEntity> tasks,
      List<DeviceCalendar> calendars, List<Habit>? habits) {
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

    // Add habits
    if (context.read<AppCubit>().state.displayHabitsInCalendar == true) {
      final habitAppointments = _getHabitDataSource(habits);
      if (habitAppointments.appointments != null) {
        appointments
            .addAll(habitAppointments.appointments!.cast<CustomAppointment>());
      }
    }

    return CustomCalendarDataSource(appointments);
  }
}
