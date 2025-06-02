import 'package:app/blocs/time_entries/time_entry.bloc.dart';
import 'package:app/components/buttons/primary_button_square.dart';
import 'package:app/entities/tasks/tasks.entity.dart';
import 'package:app/entities/time_entry/time_entry.entity.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:jiffy/jiffy.dart';

class AddTimeEntry extends StatefulWidget {
  final TaskEntity task;

  const AddTimeEntry({super.key, required this.task});

  @override
  State<AddTimeEntry> createState() => _AddTimeEntryState();
}

class _AddTimeEntryState extends State<AddTimeEntry> {
  DateTime? _startDate;
  DateTime? _endDate;

  @override
  void initState() {
    _startDate = DateTime.now().subtract(const Duration(minutes: 30));
    _endDate = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TimeEntryBloc, TimeEntryState>(
      listener: (context, state) {
        if (state is TimeEntryAddSuccess) {
          Navigator.pop(context);
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: $constants.insets.sm,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: $constants.insets.xs,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Container(
                      width: 30,
                      height: 30,
                      padding: EdgeInsets.all($constants.insets.xxs),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Icon(
                        CupertinoIcons.xmark,
                        size: 18,
                      ),
                    )),
                SizedBox(
                  width: $constants.insets.xs,
                ),
                Expanded(
                  child: AutoSizeText(
                    maxLines: 1,
                    context.t.tasks.add_time_entry.title,
                    style: getTextTheme(context).headlineLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: $constants.insets.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.t.tasks.add_time_entry.description,
                  ),
                  SizedBox(
                    height: $constants.insets.sm,
                  ),
                  CustomPopup(
                      content: SizedBox(
                        width: getSize(context).width * 0.7,
                        height: getSize(context).height * 0.3,
                        child: CupertinoDatePicker(
                            use24hFormat: true,
                            initialDateTime: DateTime.now()
                                .subtract(const Duration(minutes: 30)),
                            onDateTimeChanged: (DateTime dateTime) {
                              setState(() {
                                _startDate = dateTime;
                              });
                            },
                            mode: CupertinoDatePickerMode.dateAndTime),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.t.tasks.add_time_entry.start_time,
                          ),
                          Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(
                                    $constants.corners.md)),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: $constants.insets.sm,
                                ),
                                const Icon(
                                  CupertinoIcons.calendar,
                                ),
                                SizedBox(
                                  width: $constants.insets.sm,
                                ),
                                Text(
                                  _startDate != null
                                      ? Jiffy.parseFromDateTime(_startDate!)
                                          .yMMMEdjm
                                      : context
                                          .t.tasks.add_time_entry.not_defined,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: $constants.insets.sm,
                  ),
                  CustomPopup(
                    content: SizedBox(
                      width: getSize(context).width * 0.7,
                      height: getSize(context).height * 0.3,
                      child: CupertinoDatePicker(
                          use24hFormat: true,
                          initialDateTime: DateTime.now()
                              .subtract(const Duration(minutes: 30)),
                          onDateTimeChanged: (DateTime dateTime) {
                            setState(() {
                              _endDate = dateTime;
                            });
                          },
                          mode: CupertinoDatePickerMode.dateAndTime),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.t.tasks.add_time_entry.end_time,
                        ),
                        Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius:
                                  BorderRadius.circular($constants.corners.md)),
                          child: Row(
                            children: [
                              SizedBox(
                                width: $constants.insets.sm,
                              ),
                              const Icon(
                                CupertinoIcons.calendar_today,
                              ),
                              SizedBox(
                                width: $constants.insets.sm,
                              ),
                              Text(
                                _endDate != null
                                    ? Jiffy.parseFromDateTime(_endDate!)
                                        .yMMMEdjm
                                    : context
                                        .t.tasks.add_time_entry.not_defined,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: $constants.insets.sm,
                  ),
                  PrimaryButtonSquare(
                    text: context.t.actions.save,
                    onPressed: () {
                      if (_startDate == null || _endDate == null) {
                        return;
                      }
                      final timeEntry = TimeEntry(
                        taskId: widget.task.id,
                        startDate: _startDate!,
                        endDate: _endDate!,
                        duration: _endDate!.difference(_startDate!).inSeconds,
                      );

                      if (!context.mounted) {
                        return;
                      }

                      context.read<TimeEntryBloc>().add(
                            CreateTimeEntry(
                              timeEntry,
                            ),
                          );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
