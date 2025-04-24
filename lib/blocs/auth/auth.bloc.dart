import 'dart:async';

import 'package:app/entities/user/user.entity.dart';
import 'package:app/entities/user_device/user_device.dart';
import 'package:app/services/user.service.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'auth.event.dart';
part 'auth.state.dart';

class AuthBloc extends HydratedBloc<AuthEvent, AuthState> {
  final UserService _userService = UserService();

  AuthBloc() : super(const LoggedOut()) {
    on<LoginEvent>(_onLogIn);
    on<Logout>(_onLogOut);
    on<RegisterEvent>(_onRegister);
    on<RefreshUser>(_onRefreshUser);
    on<DeleteUser>(_onDeleteUser);
    on<UpdateUserDevice>(_onUpdateUserDevice);
    on<UpdateUserProfile>(_onUpdateUserProfile);
    on<ChangePassword>(_onChangePassword);
    on<StartResetPassword>(_onStartResetPassword);
    on<ConfirmResetPassword>(_onConfirmResetPassword);
    on<GetBackupKeyForResetPassword>(_onGetBackupKeyForPasswordReset);
  }

  void _onLogOut(Logout event, Emitter<AuthState> emit) async {
    await _userService.logOut();
    emit(const LoggedOut());
  }

  void _onLogIn(LoginEvent event, Emitter<AuthState> emit) async {
    emit(const Loading());
    try {
      final updatedUser = await _userService.login(event.email, event.password);
      if (updatedUser == null) {
        emit(const LoggedOut());
        return;
      }
      emit(LoggedIn(updatedUser, false));
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      if (e.response?.statusCode == 401) {
        emit(const AuthError("wrong_email_password"));
      } else if (e.response?.statusCode == 400) {
        emit(const AuthError("email_malformed"));
      }
    }
  }

  void _onRefreshUser(RefreshUser event, Emitter<AuthState> emit) async {
    if (state.user == null) {
      emit(const LoggedOut());
      return;
    }
    final user = state.user!;
    final updatedUser = await _userService.getUser(user);
    emit(LoggedIn(updatedUser!, false));
  }

  void _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(const Loading());
    final updatedUser =
        await _userService.register(event.email, event.password);
    if (updatedUser == null) {
      emit(const LoggedOut());
      return;
    }
    emit(LoggedIn(updatedUser, true));
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    if (json['user'] != null) {
      return LoggedIn(UserEntity.fromJson(json['user']), false);
    }
    return const LoggedOut();
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    return {'user': state.user?.toJson()};
  }

  void _onDeleteUser(DeleteUser event, Emitter<AuthState> emit) async {
    emit(const UserDeleting());
    await _userService.deleteUser();
    emit(const UserDeleted());
  }

  void _onUpdateUserDevice(
      UpdateUserDevice event, Emitter<AuthState> emit) async {
    if (state.user == null) {
      emit(const LoggedOut());
      return;
    }
    final user = state.user!;
    final updatedUser = await _userService.updateUserDevice(
      user,
      event.deviceInfo,
    );
    emit(LoggedIn(updatedUser, false));
  }

  FutureOr<void> _onUpdateUserProfile(
      UpdateUserProfile event, Emitter<AuthState> emit) async {
    final prevState = state;
    if (state.user == null) {
      emit(const LoggedOut());
    }
    emit(const UserUpdateProfileLoading());
    final user = prevState.user!;
    final updatedUser = await _userService.updateUserProfile(
      user.id!,
      event.user,
    );
    emit(UserUpdateProfileSuccess(updatedUser));
    emit(LoggedIn(updatedUser, false));
  }

  FutureOr<void> _onChangePassword(
      ChangePassword event, Emitter<AuthState> emit) async {
    if (state.user == null) {
      emit(const LoggedOut());
      return;
    }
    final user = state.user!;
    emit(const UserChangePasswordLoading());
    await _userService.changePassword(
      oldPassword: event.oldPassword,
      newPassword: event.newPassword,
      newEncryptedDataKey: event.newEncryptedDataKey,
      newUserKey: event.newUserKey,
      newUserSalt: event.newSalt,
    );
    emit(UserChangePasswordSuccess(user));
    add(const RefreshUser());
  }

  FutureOr<void> _onStartResetPassword(
      StartResetPassword event, Emitter<AuthState> emit) async {
    emit(const StartResetPasswordLoading());
    try {
      await _userService.startResetPassword(event.email);
    } on Exception catch (e) {
      emit(StartResetPasswordError(e.toString()));
    }
    emit(const StartResetPasswordSuccess());
  }

  FutureOr<void> _onConfirmResetPassword(
      ConfirmResetPassword event, Emitter<AuthState> emit) async {
    emit(const ConfirmResetPasswordLoading());
    try {
      await _userService.confirmResetPassword(
        resetCode: event.resetCode,
        resetData: event.resetData,
        newPassword: event.newPassword,
        userKey: event.userKey,
        userSalt: event.userSalt,
        backupKey: event.backupKey,
        backupSalt: event.backupSalt,
      );
      emit(const ConfirmResetPasswordSuccess());
    } on Exception catch (e) {
      emit(StartResetPasswordError(e.toString()));
    }
  }

  FutureOr<void> _onGetBackupKeyForPasswordReset(
      GetBackupKeyForResetPassword event, Emitter<AuthState> emit) async {
    emit(const GetBackupKeyForResetPasswordLoading());
    try {
      final result =
          await _userService.getBackupKeyForPasswordReset(event.resetCode);
      emit(GetBackupKeyForResetPasswordSuccess(
          result['backup_key'], result['backup_salt']));
    } on Exception catch (e) {
      emit(GetBackupKeyForResetPasswordError(e.toString()));
    }
  }
}
