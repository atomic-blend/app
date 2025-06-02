part of 'app.bloc.dart';

@freezed
class AppState with _$AppState {
  factory AppState(
      {required String primaryMenuSelectedKey,
      required String secondaryMenuSelectedKey,
      bool? mobileSyncDisabled,
      bool? warnUserOnMobileInternetAccess,
      bool? isIntroCompleted,
      bool? displayHabitsInCalendar,
      int? pomodoroDuration,
      int? pomodoroBreakDuration,
      Map<String, bool>? showcasePageStatus}) = _AppState;

  factory AppState.initial() => _AppState(
        primaryMenuSelectedKey: 'tasks',
        secondaryMenuSelectedKey: 'overview',
      );

  factory AppState.fromJson(Map<String, dynamic> stored) =>
      _$AppStateFromJson(stored);
}
