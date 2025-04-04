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

class HabitLoadingError extends HabitState {
  const HabitLoadingError(List<Habit> super.habits, this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}