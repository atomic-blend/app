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

final class AddHabitEntry extends HabitEvent {
  const AddHabitEntry(this.habitEntry);
  final HabitEntry habitEntry;
}

final class UpdateHabitEntry extends HabitEvent {
  const UpdateHabitEntry(this.habitEntry);
  final HabitEntry habitEntry;
}

final class DeleteHabitEntry extends HabitEvent {
  const DeleteHabitEntry(this.habitEntry);
  final HabitEntry habitEntry;
}

final class DeleteHabit extends HabitEvent {
  const DeleteHabit(this.habit);
  final Habit habit;
}
