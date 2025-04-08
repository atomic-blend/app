import 'dart:async';

import 'package:app/entities/habit/habit.entity.dart';
import 'package:app/services/habit_service.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'habit.event.dart';
part 'habit.state.dart';

class HabitBloc extends HydratedBloc<HabitEvent, HabitState> {
  final HabitService _habitService = HabitService();
  HabitBloc() : super(const HabitInitial()) {
    on<LoadHabits>(_onLoadHabits);
    on<CreateHabit>(_onCreateHabit);
    on<UpdateHabit>(_onUpdateHabit);
    on<DeleteHabit>(_onDeleteHabit);
  }

  @override
  HabitState? fromJson(Map<String, dynamic> json) {
    if (json["habits"] != null) {
      return HabitsLoaded(
        (json["habits"] as List).map((e) => Habit.fromJson(e)).toList(),
      );
    }
    return const HabitInitial();
  }

  @override
  Map<String, dynamic>? toJson(HabitState state) {
    if (state is HabitsLoaded && state.habits != null) {
      return {"habits": state.habits!.map((e) => e.toJson()).toList()};
    }
    return null;
  }

  FutureOr<void> _onLoadHabits(
      LoadHabits event, Emitter<HabitState> emit) async {
    final prevState = state;
    emit(HabitLoading(prevState.habits ?? []));
    try {
      final habits = await _habitService.getAll();
      emit(HabitsLoaded(habits));
    } catch (e) {
      emit(HabitLoadingError(prevState.habits ?? [], e.toString()));
    }
  }

  Future<void> _onCreateHabit(
      CreateHabit event, Emitter<HabitState> emit) async {
    final prevState = state;
    try {
      final res = await _habitService.create(event.habit);
      if (!res) {
        emit(HabitLoadingError(prevState.habits ?? [], 'habit_create_failed'));
        return;
      }
      emit(HabitCreated(prevState.habits ?? []));
      add(const LoadHabits());
    } catch (e) {
      print(e.toString());
      emit(HabitLoadingError(prevState.habits ?? [], e.toString()));
    }
  }

  Future<void> _onUpdateHabit(
      UpdateHabit event, Emitter<HabitState> emit) async {
    final prevState = state;
    try {
      await _habitService.update(event.habit);
      add(const LoadHabits());
    } catch (e) {
      emit(HabitLoadingError(prevState.habits ?? [], e.toString()));
    }
  }

  Future<void> _onDeleteHabit(
      DeleteHabit event, Emitter<HabitState> emit) async {
    final prevState = state;
    try {
      await _habitService.delete(event.habit.id!);
      add(const LoadHabits());
    } catch (e) {
      emit(HabitLoadingError(prevState.habits ?? [], e.toString()));
    }
  }
}
