part of 'time_entry.bloc.dart';

sealed class TimeEntryState extends Equatable {
  final List<TimeEntry>? timeEntries;
  const TimeEntryState({this.timeEntries});

  @override
  List<Object?> get props => [timeEntries];
}

class TimeEntryInitial extends TimeEntryState {
  const TimeEntryInitial() : super(timeEntries: null);
}

class TimeEntryLoading extends TimeEntryState {
  const TimeEntryLoading(List<TimeEntry> timeEntries)
      : super(timeEntries: timeEntries);
}

class TimeEntryLoaded extends TimeEntryState {
  const TimeEntryLoaded(List<TimeEntry> timeEntries)
      : super(timeEntries: timeEntries);

  @override
  List<Object?> get props => [timeEntries];
}

class TimeEntryLoadingError extends TimeEntryState {
  const TimeEntryLoadingError(List<TimeEntry> timeEntries, this.message)
      : super(timeEntries: timeEntries);
  final String message;

  @override
  List<Object?> get props => [message];
}

class TimeEntryAddLoading extends TimeEntryState {
  const TimeEntryAddLoading(List<TimeEntry> timeEntries)
      : super(timeEntries: timeEntries);
}

class TimeEntryDeleteLoading extends TimeEntryState {
  const TimeEntryDeleteLoading(List<TimeEntry> timeEntries)
      : super(timeEntries: timeEntries);
}

class TimeEntryEditLoading extends TimeEntryState {
  const TimeEntryEditLoading(List<TimeEntry> timeEntries)
      : super(timeEntries: timeEntries);
}

class TimeEntryAddSuccess extends TimeEntryState {
  const TimeEntryAddSuccess(List<TimeEntry> timeEntries)
      : super(timeEntries: timeEntries);
}

class TimeEntryDeleteSuccess extends TimeEntryState {
  const TimeEntryDeleteSuccess(List<TimeEntry> timeEntries)
      : super(timeEntries: timeEntries);
}

class TimeEntryEditSuccess extends TimeEntryState {
  const TimeEntryEditSuccess(List<TimeEntry> timeEntries)
      : super(timeEntries: timeEntries);
}

class TimeEntryError extends TimeEntryState {
  const TimeEntryError(List<TimeEntry> timeEntries, this.message)
      : super(timeEntries: timeEntries);
  final String message;

  @override
  List<Object?> get props => [message];
}
