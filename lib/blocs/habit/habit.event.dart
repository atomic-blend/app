part of 'habit.bloc.dart';

sealed class HabitEvent {
  const HabitEvent();
}

final class LoadHabits extends HabitEvent {
  const LoadHabits();
}