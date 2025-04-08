part of 'habit.bloc.dart';

sealed class HabitState extends Equatable {
  final List<Habit>? habits;
  const HabitState(this.habits);

  @override
  List<Object?> get props => [habits];
}

class HabitInitial extends HabitState {
  const HabitInitial() : super(null);
}

class HabitLoading extends HabitState {
  const HabitLoading(List<Habit> super.habits);
}

class HabitsLoaded extends HabitState {
  const HabitsLoaded(List<Habit> super.habits);

  @override
  List<Object?> get props => [habits];
}

class HabitCreated extends HabitState {
  const HabitCreated(List<Habit> super.habits);
}

class HabitDeleted extends HabitState {
  const HabitDeleted(List<Habit> super.habits);
}

class HabitUpdated extends HabitState {
  const HabitUpdated(List<Habit> super.habits);
}

class HabitLoadingError extends HabitState {
  const HabitLoadingError(List<Habit> super.habits, this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}