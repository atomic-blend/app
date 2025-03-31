import 'package:app/blocs/app/app.bloc.dart';
import 'package:app/blocs/tasks/tasks.bloc.dart';
import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/pages/calendar/appointment_data_source.dart';
import 'package:app/pages/under_construction/under_construction.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiffy/jiffy.dart';
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
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(builder: (context, taskState) {
      return SfCalendar(
        view: widget.view,
        initialSelectedDate: DateTime.now(),
        backgroundColor: getTheme(context).surface,
        todayHighlightColor: getTheme(context).primary,
        timeSlotViewSettings:
            TimeSlotViewSettings(numberOfDaysInView: widget.numberOfDays ?? -1),
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
        dataSource: _getTasks(taskState.tasks ?? []),
        appointmentBuilder:
            (BuildContext context, CalendarAppointmentDetails details) {
          return Container(
            decoration: BoxDecoration(
              color: details.appointments.first.color,
              borderRadius: BorderRadius.circular(6),
            ),
            padding: EdgeInsets.symmetric(horizontal: $constants.insets.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${details.appointments.first.subject}",
                  style: getTextTheme(context).bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  overflow: TextOverflow.ellipsis,
                ),
                // Text(
                //   "${Jiffy.parseFromDateTime(details.appointments.first.startTime).Hm.toString()} - ${Jiffy.parseFromDateTime(details.appointments.first.endTime).Hm.toString()}",
                //   style: getTextTheme(context).bodySmall!,
                // ),
              ],
            ),
          );
        },
      );
    });
  }

  AppointmentDataSource _getTasks(List<TaskEntity> tasks) {
    final List<Appointment> appointments = <Appointment>[];
    for (TaskEntity task in tasks) {
      if (task.startDate != null && task.endDate != null) {
        appointments.add(
          Appointment(
            startTime: task.startDate!,
            endTime: task.endDate!,
            subject: task.title,
            color: getTheme(context).primary.withValues(alpha: 0.2),
            notes: task.description,
            isAllDay: false,
          ),
        );
      } else if (task.endDate != null) {
        appointments.add(
          Appointment(
            startTime: task.endDate!,
            endTime: task.endDate!.add(const Duration(minutes: 30)),
            subject: task.title,
            color: getTheme(context).primary,
            notes: task.description,
            isAllDay: false,
          ),
        );
      }
    }
    return AppointmentDataSource(appointments);
  }
}
