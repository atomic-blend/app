import 'dart:async';

import 'package:app/entities/habit/habit.entity.dart';
import 'package:app/entities/habit/habit_entry/habit_entry.entity.dart';
import 'package:app/services/habit_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'habit.event.dart';
part 'habit.state.dart';

class HabitBloc extends HydratedBloc<HabitEvent, HabitState> {
  final HabitService _habitService = HabitService();
  HabitBloc() : super(const HabitInitial()) {
    on<LoadHabits>(_onLoadHabits);
    on<AddHabitEntry>(_onAddHabitEntry);
    on<UpdateHabitEntry>(_onUpdateHabitEntry);
    on<DeleteHabitEntry>(_onDeleteHabitEntry);
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
      if (kDebugMode) {
        print(e.toString());
      }
      emit(HabitLoadingError(prevState.habits ?? [], e.toString()));
    }
  }

  Future<void> _onUpdateHabit(
      UpdateHabit event, Emitter<HabitState> emit) async {
    final prevState = state;
    try {
      await _habitService.update(event.habit);
      emit(HabitUpdated(prevState.habits ?? []));
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
      emit(HabitDeleted(prevState.habits ?? []));
      add(const LoadHabits());
    } catch (e) {
      emit(HabitLoadingError(prevState.habits ?? [], e.toString()));
    }
  }

  FutureOr<void> _onAddHabitEntry(AddHabitEntry event, Emitter<HabitState> emit) {
    final prevState = state;
    try {
      _habitService.addEntry(event.habitEntry);
      emit(HabitUpdated(prevState.habits ?? []));
      add(const LoadHabits());
    } catch (e) {
      emit(HabitLoadingError(prevState.habits ?? [], e.toString()));
    }
  }

  FutureOr<void> _onUpdateHabitEntry(
      UpdateHabitEntry event, Emitter<HabitState> emit) {
    final prevState = state;
    try {
      _habitService.updateEntry(event.habitEntry);
      emit(HabitUpdated(prevState.habits ?? []));
      add(const LoadHabits());
    } catch (e) {
      emit(HabitLoadingError(prevState.habits ?? [], e.toString()));
    }
  }

  FutureOr<void> _onDeleteHabitEntry(
      DeleteHabitEntry event, Emitter<HabitState> emit) {
    final prevState = state;
    try {
      _habitService.deleteEntry(event.habitEntry.id!);
      emit(HabitUpdated(prevState.habits ?? []));
      add(const LoadHabits());
    } catch (e) {
      emit(HabitLoadingError(prevState.habits ?? [], e.toString()));
    }
  }
}
