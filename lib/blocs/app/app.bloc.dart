import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app.bloc.freezed.dart';
part 'app.bloc.g.dart';
part 'app.state.dart';

@lazySingleton
class AppCubit extends HydratedCubit<AppState> {
  AppCubit() : super(AppState.initial()) {
    hydrate();
  }

  void changeMobileSyncDisabled({required bool value}) => emit(
        state.copyWith(
          mobileSyncDisabled: value,
        ),
      );

  void changeWarnUserOnMobileInternetAccess({required bool value}) => emit(
        state.copyWith(
          warnUserOnMobileInternetAccess: value,
        ),
      );

  void completeIntroduction() => emit(
        state.copyWith(
          isIntroCompleted: true,
        ),
      );

  void resetTutorials() => emit(
        state.copyWith(
          isIntroCompleted: false,
        ),
      );

  void changeDisplayHabitsInCalendar({required bool value}) => emit(
        state.copyWith(
          displayHabitsInCalendar: value,
        ),
      );

  void changePrimaryMenuSelectedKey({required String key}) => emit(
        state.copyWith(
          primaryMenuSelectedKey: key,
        ),
      );

  void changeSecondaryMenuSelectedKey({required String key}) => emit(
        state.copyWith(
          secondaryMenuSelectedKey: key,
        ),
      );

  void changeShowcasePageStatus({required String key, required bool value}) {
    final showcasePageStatus = {
      ...?state.showcasePageStatus,
    };
    showcasePageStatus[key] = value;
    emit(
      state.copyWith(
        showcasePageStatus: showcasePageStatus,
      ),
    );
  }

  void changePomodoroDuration({required int value}) => emit(
        state.copyWith(
          pomodoroDuration: value,
        ),
      );

  void changePomodoroBreakDuration({required int value}) => emit(
        state.copyWith(
          pomodoroBreakDuration: value,
        ),
      );

  @override
  AppState? fromJson(Map<String, dynamic> json) {
    return AppState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(AppState state) {
    return state.toJson();
  }
}
