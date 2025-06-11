import 'package:app/entities/time_entry/time_entry.entity.dart';
import 'package:app/services/time_entry_service.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'time_entry.event.dart';
part 'time_entry.state.dart';

class TimeEntryBloc extends HydratedBloc<TimeEntryEvent, TimeEntryState> {
    final TimeEntryService _timeEntryService = TimeEntryService();

    TimeEntryBloc() : super(const TimeEntryInitial()) {
        on<LoadTimeEntries>(_onLoadTimeEntries);
        on<CreateTimeEntry>(_onAddTimeEntry);
        on<EditTimeEntry>(_onEditTimeEntry);
        on<DeleteTimeEntry>(_onDeleteTimeEntry);
    }

    @override
    TimeEntryState? fromJson(Map<String, dynamic> json) {
        if (json["timeEntries"] != null) {
        return TimeEntryLoaded(
            (json["timeEntries"] as List)
                .map((e) => TimeEntry.fromJson(e))
                .toList(),
        );
        }
        return const TimeEntryInitial();
    }

    @override
    Map<String, dynamic>? toJson(TimeEntryState state) {
        if (state is TimeEntryLoaded && state.timeEntries != null) {
        return {
            "timeEntries": state.timeEntries!.map((e) => e.toJson()).toList(),
        };
        }
        return null;
    }

    void _onLoadTimeEntries(
        LoadTimeEntries event, Emitter<TimeEntryState> emit) async {
        final prevState = state;
        emit(TimeEntryLoading(prevState.timeEntries ?? []));
        try {
        final timeEntries = await _timeEntryService.getAllTimeEntries();
        emit(TimeEntryLoaded(timeEntries));
        } catch (e) {
        emit(TimeEntryLoadingError(prevState.timeEntries ?? [], e.toString()));
        }
    }

    void _onAddTimeEntry(
        CreateTimeEntry event, Emitter<TimeEntryState> emit) async {
        final prevState = state;
        emit(TimeEntryAddLoading(prevState.timeEntries ?? []));
        try {
        await _timeEntryService.createTimeEntry(timeEntry: event.timeEntry);
        emit(TimeEntryAddSuccess(prevState.timeEntries ?? []));
        add(const LoadTimeEntries());
        } catch (e) {
        emit(TimeEntryLoadingError(prevState.timeEntries ?? [], e.toString()));
        add(const LoadTimeEntries());
        }
    }

    void _onEditTimeEntry(
        EditTimeEntry event, Emitter<TimeEntryState> emit) async {
        final prevState = state;
        emit(TimeEntryEditLoading(prevState.timeEntries ?? []));
        try {
        await _timeEntryService.updateTimeEntry(timeEntry: event.timeEntry);
            emit(TimeEntryEditSuccess(prevState.timeEntries ?? []));
        add(const LoadTimeEntries());
        } catch (e) {
        emit(TimeEntryLoadingError(prevState.timeEntries ?? [], e.toString()));
        add(const LoadTimeEntries());
        }
    }

    void _onDeleteTimeEntry(
        DeleteTimeEntry event, Emitter<TimeEntryState> emit) async {
        final prevState = state;
        emit(TimeEntryDeleteLoading(prevState.timeEntries ?? []));
        try {
        await _timeEntryService.deleteTimeEntry(timeEntry: event.timeEntry);
        emit(TimeEntryDeleteSuccess(prevState.timeEntries ?? []));
        add(const LoadTimeEntries());
        } catch (e) {
        emit(TimeEntryLoadingError(prevState.timeEntries ?? [], e.toString()));
        add(const LoadTimeEntries());
        }
    }
}
