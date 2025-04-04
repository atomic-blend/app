import 'package:app/blocs/habit/habit.bloc.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class Habits extends StatefulWidget {
  const Habits({super.key});

  @override
  State<Habits> createState() => _HabitsState();
}

class _HabitsState extends State<Habits> {
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
        children: [],
      );
    });
  }
}
