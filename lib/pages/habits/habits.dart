import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:app/blocs/habit/habit.bloc.dart';
import 'package:app/entities/habit/habit.entity.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:lottie/lottie.dart';

class Habits extends StatefulWidget {
  const Habits({super.key});

  @override
  State<Habits> createState() => _HabitsState();
}

class _HabitsState extends State<Habits> {
  int? mode = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HabitBloc, HabitState>(builder: (context, habitState) {
      if (habitState.habits == null || habitState.habits!.isEmpty) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Transform.scale(
                scale: 1.3,
                child: Lottie.asset(
                  'assets/animations/getting-started.json',
                  width: getSize(context).width * 0.7,
                ),
              ),
            ),
            Text(
              context.t.habits.no_habits,
              style: getTextTheme(context).headlineLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(context.t.habits.get_started_now)
          ],
        );
      }
      return Column(
        children: [
          Center(
            child: SizedBox(
              width: getSize(context).width * 0.8,
              height: 30,
              child: AnimatedToggleSwitch<int?>.rolling(
                current: mode,
                indicatorSize: Size.fromWidth(getSize(context).width * 0.8 / 2),
                values: const [0, 1],
                iconBuilder: (value, foreground) {
                  return AutoSizeText(
                      maxLines: 1,
                      [context.t.habits.list, context.t.habits.overview]
                          .elementAt(value!),
                      style: getTextTheme(context).bodyMedium!.copyWith());
                },
                styleBuilder: (value) {
                  return ToggleStyle(
                    borderColor: Colors.transparent,
                    indicatorColor: value == mode
                        ? getTheme(context).surface
                        : getTheme(context).surfaceContainer,
                    backgroundColor: getTheme(context).surfaceContainer,
                  );
                },
                onChanged: (value) {
                  setState(() {
                    mode = value;
                  });
                },
              ),
            ),
          ),
          if (mode == 0) _listView(context, habitState.habits!),
          if (mode == 1) _heatMapView(context, habitState.habits!),
        ],
      );
    });
  }

  _listView(BuildContext context, List<Habit> habits) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: $constants.insets.sm, vertical: $constants.insets.sm),
        child: ListView.builder(
          itemCount: habits.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: $constants.insets.xs),
              child: Container(
                decoration: BoxDecoration(
                  color: getTheme(context).surfaceContainer,
                  borderRadius: BorderRadius.circular($constants.corners.sm),
                ),
                padding: EdgeInsets.all($constants.insets.sm),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: getTheme(context).surface,
                        borderRadius:
                            BorderRadius.circular($constants.corners.full),
                      ),
                      child: Center(
                        child: AutoSizeText(
                          habits[index].emoji != null &&
                                  habits[index].emoji != ""
                              ? habits[index].emoji!
                              : "📋",
                          maxLines: 1,
                          style: getTextTheme(context).headlineLarge!.copyWith(
                                color: getTheme(context).onPrimary,
                              ),
                        ),
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
                          habits[index].name!,
                          style: getTextTheme(context).titleSmall!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        Text(
                          "${habits[index].duration != null ? "${habits[index].duration!.inMinutes} ${context.t.time_units.long.minute(n: habits[index].duration!.inMinutes)}, " : ""}${context.t.habits.add.frequency[habits[index].frequency!]}, ${context.t.habits.times_a_day(n: habits[index].numberOfTimes ?? 0, nb: habits[index].numberOfTimes ?? 0)}",
                          style: getTextTheme(context).bodyMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  _heatMapView(BuildContext context, List<Habit> habits) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: $constants.insets.sm, vertical: $constants.insets.sm),
        child: ListView.builder(
            itemCount: habits.length,
            itemBuilder: (context, index) {
              final habit = habits[index];
              return Container(
                decoration: BoxDecoration(
                  color: getTheme(context).surfaceContainer,
                  borderRadius: BorderRadius.circular($constants.corners.sm),
                ),
                padding: EdgeInsets.all($constants.insets.sm),
                margin: EdgeInsets.only(bottom: $constants.insets.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                              habit.emoji ?? "📋",
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
            }),
      ),
    );
  }

  _generateHeatMapData(Habit habit) {
    final data = <DateTime, int>{};
    for (var entry in habit.entries ?? []) {
      final date = entry.entryDate;
      data[date] ??= 0;
      data[date] = data[date]! + 1;
    }
    return data;
  }
}
