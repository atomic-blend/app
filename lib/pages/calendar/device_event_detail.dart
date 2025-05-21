import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/meeting_link_parser.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:app/utils/url_launcher.dart';
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
    final meetingLink = MeetingLinkParser.parse(widget.event.description ?? "");
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: $constants.insets.sm),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: $constants.insets.sm,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: getTheme(context).surfaceContainer,
                borderRadius: BorderRadius.circular($constants.corners.sm),
              ),
              padding: EdgeInsets.all($constants.insets.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    maxLines: 3,
                    widget.event.title ?? "",
                    style: getTextTheme(context).titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(
                    height: $constants.insets.sm,
                  ),
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
                        widget.event.description ?? "-",
                        style: getTextTheme(context).bodyMedium,
                      ),
                    ),
                  ),
                  if (widget.event.description == null)
                    SizedBox(
                      height: getSize(context).height * 0.03,
                    ),
                ],
              ),
            ),
            SizedBox(
              height: $constants.insets.xs,
            ),
            // Text(context.t.calendar.event_detail.details,
            //     style: getTextTheme(context).titleMedium!.copyWith(
            //           fontWeight: FontWeight.bold,
            //         )),
            Row(
              spacing: $constants.insets.xs,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: getTheme(context).surfaceContainer,
                      borderRadius:
                          BorderRadius.circular($constants.corners.sm),
                    ),
                    padding: EdgeInsets.all($constants.insets.sm),
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
                        if (widget.event.start != null)
                          AutoSizeText(
                            Jiffy.parseFromDateTime(
                              widget.event.start!.toLocal(),
                            ).yMMMMd.toString(),
                            style: getTextTheme(context).bodyLarge,
                          ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: getTheme(context).surfaceContainer,
                      borderRadius:
                          BorderRadius.circular($constants.corners.sm),
                    ),
                    padding: EdgeInsets.all($constants.insets.sm),
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
                        if (widget.event.start != null &&
                            widget.event.end != null)
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
                ),
              ],
            ),
            SizedBox(
              height: $constants.insets.xs,
            ),
            Row(
              spacing: $constants.insets.xs,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: getTheme(context).surfaceContainer,
                      borderRadius:
                          BorderRadius.circular($constants.corners.sm),
                    ),
                    padding: EdgeInsets.all($constants.insets.sm),
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
                          widget.event.attendees?.isNotEmpty != true
                              ? "-"
                              : widget.event.attendees
                                      ?.firstWhereOrNull((element) =>
                                          element?.isOrganiser == true)
                                      ?.name ??
                                  widget.event.attendees?.first?.name ??
                                  "",
                          style: getTextTheme(context).bodyLarge,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: getTheme(context).surfaceContainer,
                      borderRadius:
                          BorderRadius.circular($constants.corners.sm),
                    ),
                    padding: EdgeInsets.all($constants.insets.sm),
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
                              ? "-"
                              : widget.event.reminders?.map((e) {
                                    return "${e.minutes} ${context.t.time_units.long.minute(n: e.minutes ?? 0)}";
                                  }).join(", ") ??
                                  "",
                          style: getTextTheme(context).bodyLarge,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: $constants.insets.sm,
            ),
            if (meetingLink != null) ...[
              Text(context.t.calendar.event_detail.join_meeting,
                  style: getTextTheme(context).titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      )),
              SizedBox(
                height: $constants.insets.xxs,
              ),
              GestureDetector(
                onTap: () {
                  final meeting = meetingLink.url;

                  UrlLauncher.launchUrl(meeting);
                },
                child: Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular($constants.corners.sm),
                  elevation: 1,
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: getTheme(context).surface,
                      borderRadius:
                          BorderRadius.circular($constants.corners.sm),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: $constants.insets.xl,
                        ),
                        SizedBox(
                          width: 40,
                          child: Image.asset(
                            meetingLinkIcons[meetingLink.type]!,
                          ),
                        ),
                        SizedBox(
                          width: $constants.insets.sm,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              _getMeetingButtonTitle(context, meetingLink.type),
                              style:
                                  getTextTheme(context).headlineSmall!.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                            ),
                            Text(
                              context.t.calendar.event_detail.join_now,
                              style:
                                  getTextTheme(context).bodyMedium!.copyWith(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: $constants.insets.sm,
              ),
              Text(context.t.calendar.event_detail.attendee(n: 2),
                  style: getTextTheme(context).titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      )),
              SizedBox(
                height: $constants.insets.xs,
              ),
              ...widget.event.attendees!
                  .where((element) => element?.isOrganiser != true)
                  .map((e) {
                return Padding(
                  padding: EdgeInsets.only(bottom: $constants.insets.xs),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: getTheme(context).surfaceContainer,
                        child: Text(
                          e?.name?.substring(0, 1).toUpperCase() ??
                              e?.emailAddress?.substring(0, 1).toUpperCase() ??
                              "",
                          style: getTextTheme(context).bodyLarge,
                        ),
                      ),
                      SizedBox(
                        width: $constants.insets.sm,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(e?.name ?? e?.emailAddress ?? "",
                              style: getTextTheme(context).bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  )),
                          Text(
                            context.t.calendar.event_detail.attendee(
                              n: 1,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              }),
              SizedBox(
                height: $constants.insets.lg,
              ),
            ]
          ],
        ),
      ),
    );
  }

  String _getMeetingButtonTitle(BuildContext context, MeetingLinkType type) {
    switch (type) {
      case MeetingLinkType.zoom:
        return context.t.calendar.event_detail.zoom_meet_call;
      case MeetingLinkType.googleMeet:
        return context.t.calendar.event_detail.google_meet_call;
      case MeetingLinkType.microsoftTeams:
        return context.t.calendar.event_detail.ms_teams_call;
      default:
        return "";
    }
  }
}
