import 'package:app/blocs/habit/habit.bloc.dart';
import 'package:app/components/modals/delete_confirm_modal.dart';
import 'package:app/entities/habit/habit.entity.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/pages/habits/habit_heatmap.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiffy/jiffy.dart';

class HabitDetail extends StatefulWidget {
  final Habit habit;
  final VoidCallback? onEdit;
  const HabitDetail({super.key, required this.habit, this.onEdit});

  @override
  State<HabitDetail> createState() => _HabitDetailState();
}

class _HabitDetailState extends State<HabitDetail> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<HabitBloc, HabitState>(
      listener: (context, state) {
        if (state is HabitDeleted) {
          Navigator.popUntil(context, (_) => true);
        }
      },
      child: Container(
        height: getSize(context).height * 0.88,
        padding: EdgeInsets.symmetric(
            horizontal: $constants.insets.md, vertical: $constants.insets.sm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: $constants.insets.xxs,
            ),
            Row(
              children: [
                Text(
                  widget.habit.emoji != null && widget.habit.emoji != ""
                      ? widget.habit.emoji!
                      : "📋",
                  style: const TextStyle(fontSize: 30),
                ),
                SizedBox(
                  width: $constants.insets.sm,
                ),
                AutoSizeText(
                  maxLines: 1,
                  widget.habit.name ?? "",
                  style: getTextTheme(context).headlineLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    widget.onEdit?.call();
                  },
                  child: Container(
                    padding: EdgeInsets.all($constants.insets.xs),
                    child: const Icon(
                      CupertinoIcons.pencil,
                      size: 20,
                    ),
                  ),
                ),
                SizedBox(
                  width: $constants.insets.xs,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: getTheme(context).surfaceContainerHighest,
                      borderRadius:
                          BorderRadius.circular($constants.corners.full),
                    ),
                    padding: EdgeInsets.all($constants.insets.xs),
                    child: const Icon(
                      CupertinoIcons.xmark,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: $constants.insets.md,
            ),
            Text(
              context.t.calendar.event_detail.details,
              style: getTextTheme(context).titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(
              height: $constants.insets.xs,
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
                            CupertinoIcons.quote_bubble,
                            size: 30,
                          ),
                          SizedBox(
                            width: $constants.insets.xs,
                          ),
                          Text(
                            context.t.habits.add.citation,
                            style: getTextTheme(context).bodyLarge!.copyWith(),
                          )
                        ],
                      ),
                      SizedBox(
                        height: $constants.insets.sm,
                      ),
                      AutoSizeText(
                        maxLines: 1,
                        widget.habit.citation != null &&
                                widget.habit.citation != ""
                            ? widget.habit.citation!
                            : context.t.habits.habit_detail.no_citation,
                        style: getTextTheme(context).bodyMedium!.copyWith(
                              color: getTheme(context).onSurfaceVariant,
                            ),
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
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            CupertinoIcons.metronome,
                            size: 30,
                          ),
                          SizedBox(
                            width: $constants.insets.xs,
                          ),
                          Text(
                            context.t.habits.add.frequency_label,
                            style: getTextTheme(context).bodyLarge!.copyWith(),
                          )
                        ],
                      ),
                      SizedBox(
                        height: $constants.insets.sm,
                      ),
                      AutoSizeText(
                        maxLines: 1,
                        context
                            .t.habits.add.frequency[widget.habit.frequency!]!,
                        style: getTextTheme(context).bodyMedium!.copyWith(
                              color: getTheme(context).onSurfaceVariant,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: $constants.insets.xs,
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
                            CupertinoIcons.clock,
                            size: 30,
                          ),
                          SizedBox(
                            width: $constants.insets.xs,
                          ),
                          Text(
                            context.t.habits.add.start_date,
                            style: getTextTheme(context).bodyLarge!.copyWith(),
                          )
                        ],
                      ),
                      SizedBox(
                        height: $constants.insets.sm,
                      ),
                      AutoSizeText(
                        maxLines: 1,
                        Jiffy.parseFromDateTime(widget.habit.startDate!).yMMMd,
                        style: getTextTheme(context).bodyMedium!.copyWith(
                              color: getTheme(context).onSurfaceVariant,
                            ),
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
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            CupertinoIcons.clock_fill,
                            size: 30,
                          ),
                          SizedBox(
                            width: $constants.insets.xs,
                          ),
                          Text(
                            context.t.habits.add.end_date,
                            style: getTextTheme(context).bodyLarge!.copyWith(),
                          )
                        ],
                      ),
                      SizedBox(
                        height: $constants.insets.sm,
                      ),
                      AutoSizeText(
                        maxLines: 1,
                        widget.habit.endDate != null
                            ? Jiffy.parseFromDateTime(widget.habit.endDate!)
                                .yMMMd
                            : context.t.habits.habit_detail.no_end_date,
                        style: getTextTheme(context).bodyMedium!.copyWith(
                              color: getTheme(context).onSurfaceVariant,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: $constants.insets.md,
            ),
            Text(
              context.t.habits.overview,
              style: getTextTheme(context).titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(
              height: $constants.insets.xs,
            ),
            HabitHeatmap(habit: widget.habit, hideTitle: true),
            SizedBox(
              height: $constants.insets.xs,
            ),
            AutoSizeText(
              context.t.habits.habit_detail.entries,
              style: getTextTheme(context).titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(
              height: $constants.insets.xs,
            ),
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: widget.habit.entries != null
                    ? widget.habit.entries!
                        .map((e) => ListTile(
                              title: Text(
                                Jiffy.parseFromDateTime(e.entryDate).yMMMd,
                                style:
                                    getTextTheme(context).bodyMedium!.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                              ),
                            ))
                        .toList()
                    : [Text(context.t.habits.habit_detail.no_entries)],
              ),
            ),
            const Spacer(),
            Center(
              child: TextButton(
                  onPressed: () async {
                    final result = await showDialog(
                      context: context,
                      builder: (context) => DeleteConfirmModal(
                        title: context.t.habits.habit_detail.delete_habit,
                        description: context
                            .t.habits.habit_detail.delete_habit_description,
                        warning:
                            context.t.habits.habit_detail.delete_habit_warning,
                        onDelete: () async {
                          if (!context.mounted) return;
                          context.read<HabitBloc>().add(
                                DeleteHabit(
                                  widget.habit,
                                ),
                              );
                        },
                      ),
                    );
                    if (result == true) {
                      if (!context.mounted) return;
                      Navigator.pop(context, true);
                    }
                  },
                  child: Text(
                    context.t.habits.habit_detail.delete_habit,
                    style: getTextTheme(context).bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: getTheme(context).error),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
