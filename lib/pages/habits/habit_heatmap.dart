import 'package:app/entities/habit/habit.entity.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class HabitHeatmap extends StatelessWidget {
  final Habit habit;
  final bool? hideTitle;
  const HabitHeatmap({super.key, required this.habit, this.hideTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: getTheme(context).surfaceContainerHigh,
        borderRadius: BorderRadius.circular($constants.corners.sm),
      ),
      padding: EdgeInsets.all($constants.insets.sm),
      margin: EdgeInsets.only(bottom: $constants.insets.sm),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (hideTitle != true)
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: getTheme(context).surface,
                    borderRadius:
                        BorderRadius.circular($constants.corners.full),
                  ),
                  child: Center(
                    child: Text(
                      habit.emoji != null && habit.emoji != ""
                          ? habit.emoji!
                          : "📋",
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(width: $constants.insets.xs),
                Expanded(
                  child: Text(
                    habit.name ?? context.t.habits.add.title,
                    style: getTextTheme(context).titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
          HeatMap(
            scrollable: true,
            endDate: DateTime.now(),
            defaultColor: Colors.white,
            showColorTip: false,
            colorMode: ColorMode.opacity,
            datasets: _generateHeatMapData(habit),
            colorsets: {
              1: getTheme(context).primary,
            },
            onClick: (value) {},
          )
        ],
      ),
    );
  }

  _generateHeatMapData(Habit habit) {
    final data = <DateTime, int>{};
    for (var entry in habit.entries ?? []) {
      // Normalize date to remove time component
      final date = DateTime(
          entry.entryDate.year, entry.entryDate.month, entry.entryDate.day);
      // Initialize with 1 instead of 0, as the colorsets start at 1
      data[date] ??= 0;
      data[date] = data[date]! + 1;
    }
    return data;
  }
}
