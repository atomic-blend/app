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

  void changePageIndex({required int index}) => emit(
        state.copyWith(
          pageIndex: index,
          selectedTabIndex: 0,
        ),
      );

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

  void changeSelectedTabIndex({required int index}) => emit(
        state.copyWith(
          selectedTabIndex: index,
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

  @override
  AppState? fromJson(Map<String, dynamic> json) {
    return AppState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(AppState state) {
    return state.toJson();
  }
}
