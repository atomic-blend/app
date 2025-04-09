part of 'app.bloc.dart';

@freezed
class AppState with _$AppState {
  factory AppState(
      {required int pageIndex,
      required int selectedTabIndex,
      bool? mobileSyncDisabled,
      bool? warnUserOnMobileInternetAccess,
      bool? isIntroCompleted,
      bool? displayHabitsInCalendar,
      Map<String, bool>? showcasePageStatus}) = _AppState;

  factory AppState.initial() => _AppState(
        pageIndex: 0,
        selectedTabIndex: 0,
      );

  factory AppState.fromJson(Map<String, dynamic> stored) =>
      _$AppStateFromJson(stored);
}
