part of 'habit.bloc.dart';

sealed class HabitEvent {
  const HabitEvent();
}

final class LoadHabits extends HabitEvent {
  const LoadHabits();
}

final class CreateHabit extends HabitEvent {
  const CreateHabit(this.habit);
  final Habit habit;
}

final class UpdateHabit extends HabitEvent {
  const UpdateHabit(this.habit);
  final Habit habit;
}

final class DeleteHabit extends HabitEvent {
  const DeleteHabit(this.habit);
  final Habit habit;
}
