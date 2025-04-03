import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:collection/collection.dart';
import 'package:device_calendar/device_calendar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class DeviceEventDetail extends StatefulWidget {
  final Event event;
  const DeviceEventDetail({super.key, required this.event});

  @override
  State<DeviceEventDetail> createState() => _DeviceEventDetailState();
}

class _DeviceEventDetailState extends State<DeviceEventDetail> {
  bool? _isDescriptionExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              CupertinoIcons.back,
              size: 30,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        backgroundColor: getTheme(context).surface,
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: $constants.insets.sm, vertical: $constants.insets.sm),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              AutoSizeText(
                widget.event.title ?? "",
                style: getTextTheme(context).titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(
                height: $constants.insets.sm,
              ),
              if (widget.event.description != null)
                Padding(
                  padding: EdgeInsets.only(bottom: $constants.insets.sm),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isDescriptionExpanded = !_isDescriptionExpanded!;
                      });
                    },
                    child: AutoSizeText(
                      maxLines: _isDescriptionExpanded == false ? 3 : null,
                      minFontSize: getTextTheme(context)
                              .bodyMedium
                              ?.fontSize
                              ?.roundToDouble() ??
                          12,
                      widget.event.description!,
                      style: getTextTheme(context).bodyMedium,
                    ),
                  ),
                ),
              if (widget.event.description == null)
                SizedBox(
                  height: getSize(context).height * 0.03,
                ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              CupertinoIcons.calendar,
                              size: 30,
                            ),
                            SizedBox(
                              width: $constants.insets.xs,
                            ),
                            Text(
                              context.t.calendar.event_detail.date,
                              style: getTextTheme(context).bodyLarge!.copyWith(
                                    color: Colors.grey[700],
                                  ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: $constants.insets.sm,
                        ),
                        AutoSizeText(
                          Jiffy.parseFromDateTime(
                            widget.event.start!.toLocal(),
                          ).yMMMMd.toString(),
                          style: getTextTheme(context).bodyLarge,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              CupertinoIcons.alarm,
                              size: 30,
                            ),
                            SizedBox(
                              width: $constants.insets.xs,
                            ),
                            Text(
                              context.t.calendar.event_detail.time,
                              style: getTextTheme(context).bodyLarge!.copyWith(
                                    color: Colors.grey[700],
                                  ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: $constants.insets.sm,
                        ),
                        AutoSizeText(
                          "${Jiffy.parseFromDateTime(
                            widget.event.start!.toLocal(),
                          ).Hm.toString()} - ${Jiffy.parseFromDateTime(
                            widget.event.end!.toLocal(),
                          ).Hm.toString()}",
                          style: getTextTheme(context).bodyLarge,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: $constants.insets.sm,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              CupertinoIcons.person,
                              size: 30,
                            ),
                            SizedBox(
                              width: $constants.insets.xs,
                            ),
                            Text(
                              context.t.calendar.event_detail.organizer,
                              style: getTextTheme(context).bodyLarge!.copyWith(
                                    color: Colors.grey[700],
                                  ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: $constants.insets.sm,
                        ),
                        AutoSizeText(
                          maxLines: 1,
                          widget.event.attendees
                                  ?.firstWhereOrNull(
                                      (element) => element?.isOrganiser == true)
                                  ?.name ??
                              widget.event.attendees?.first?.name ??
                              "",
                          style: getTextTheme(context).bodyLarge,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              CupertinoIcons.bell,
                              size: 30,
                            ),
                            SizedBox(
                              width: $constants.insets.xs,
                            ),
                            Text(
                              context.t.calendar.event_detail.reminders,
                              style: getTextTheme(context).bodyLarge!.copyWith(
                                    color: Colors.grey[700],
                                  ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: $constants.insets.sm,
                        ),
                        AutoSizeText(
                          widget.event.reminders?.isEmpty == true
                              ? context.t.calendar.event_detail.no_reminders
                              : widget.event.reminders?.map((e) {
                                    return "${e.minutes} ${context.t.time_units.long.minute}";
                                  }).join(", ") ??
                                  "",
                          style: getTextTheme(context).bodyLarge,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
