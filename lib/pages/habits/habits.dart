import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:app/blocs/habit/habit.bloc.dart';
import 'package:app/entities/habit/habit.entity.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          if (mode == 0) _listView(context, habitState.habits!)
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
            return Container(
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
                        habits[index].emoji ?? "📋",
                        maxLines: 1,
                        style: getTextTheme(context).titleLarge!.copyWith(
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
                        "${context.t.habits.add.frequency[habits[index].frequency!]}, ${context.t.habits.times_a_day(n: habits[index].numberOfTimes ?? 0, nb: habits[index].numberOfTimes ?? 0)}",
                        style: getTextTheme(context).bodyMedium,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
