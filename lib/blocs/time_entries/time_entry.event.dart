part of 'time_entry.bloc.dart';

sealed class TimeEntryEvent {
  const TimeEntryEvent();
}

final class LoadTimeEntries extends TimeEntryEvent {
  const LoadTimeEntries();
}

final class CreateTimeEntry extends TimeEntryEvent {
  const CreateTimeEntry(this.timeEntry);
  final TimeEntry timeEntry;
}

final class EditTimeEntry extends TimeEntryEvent {
  const EditTimeEntry(this.timeEntry);
  final TimeEntry timeEntry;
}

final class DeleteTimeEntry extends TimeEntryEvent {
  const DeleteTimeEntry(this.timeEntry);
  final TimeEntry timeEntry;
}
