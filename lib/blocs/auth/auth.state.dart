part of 'auth.bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState(this.user);
  final UserEntity? user;

  @override
  List<Object?> get props => [user];
}

class LoggedOut extends AuthState {
  const LoggedOut() : super(null);

  @override
  String toString() => 'LoggedOut { }';
}

class Loading extends AuthState {
  const Loading() : super(null);

  @override
  String toString() => 'Loading { }';
}

class AuthError extends AuthState {
  final String message;
  const AuthError(this.message) : super(null);

  @override
  String toString() => 'Error { $message }';
}

class LoggedIn extends AuthState {
  final bool? isRegistration;
  const LoggedIn(UserEntity super.user, this.isRegistration);

  @override
  List<Object?> get props => [user];

  @override
  String toString() => 'LoggedIn { user: $user }';
}

class UserDeleting extends AuthState {
  const UserDeleting() : super(null);

  @override
  String toString() => 'UserDeleting { }';
}

class UserDeleted extends AuthState {
  const UserDeleted() : super(null);

  @override
  String toString() => 'UserDeleted { }';
}

class UserUpdateProfileLoading extends AuthState {
  const UserUpdateProfileLoading() : super(null);

  @override
  String toString() => 'UserUpdateProfileLoading { }';
}

class UserUpdateProfileSuccess extends AuthState {
  const UserUpdateProfileSuccess(UserEntity super.user);

  @override
  String toString() => 'UserUpdateProfileSuccess { user: $user }';
}

class UserChangePasswordLoading extends AuthState {
  const UserChangePasswordLoading() : super(null);

  @override
  String toString() => 'UserChangePasswordLoading { }';
}

class UserChangePasswordSuccess extends AuthState {
  const UserChangePasswordSuccess(UserEntity super.user);

  @override
  String toString() => 'UserChangePasswordSuccess { user: $user }';
}

class StartResetPasswordLoading extends AuthState {
  const StartResetPasswordLoading() : super(null);

  @override
  String toString() => 'UserStartResetPasswordLoading { }';
}

class StartResetPasswordSuccess extends AuthState {
  const StartResetPasswordSuccess() : super(null);

  @override
  String toString() => 'UserStartResetPasswordSuccess { }';
}

class StartResetPasswordError extends AuthState {
  final String message;
  const StartResetPasswordError(this.message) : super(null);

  @override
  String toString() => 'UserStartResetPasswordError { $message }';
}

class ConfirmResetPasswordLoading extends AuthState {
  const ConfirmResetPasswordLoading() : super(null);

  @override
  String toString() => 'UserConfirmResetPasswordLoading { }';
}

class ConfirmResetPasswordSuccess extends AuthState {
  const ConfirmResetPasswordSuccess() : super(null);

  @override
  String toString() => 'UserConfirmResetPasswordSuccess { }';
}

class ConfirmResetPasswordError extends AuthState {
  final String message;
  const ConfirmResetPasswordError(this.message) : super(null);

  @override
  String toString() => 'UserConfirmResetPasswordError { $message }';
}

class GetBackupKeyForResetPasswordLoading extends AuthState {
  const GetBackupKeyForResetPasswordLoading() : super(null);

  @override
  String toString() => 'GetBackupKeyForResetPasswordLoading { }';
}

class GetBackupKeyForResetPasswordSuccess extends AuthState {
  final String? backupKey;
  final String? backupSalt;

  const GetBackupKeyForResetPasswordSuccess(
    this.backupKey,
    this.backupSalt,
  ) : super(null);

  @override
  String toString() => 'GetBackupKeyForResetPasswordSuccess { $backupKey, $backupSalt }';
}

final class GetBackupKeyForResetPasswordError extends AuthState {
  final String message;
  const GetBackupKeyForResetPasswordError(this.message) : super(null);

  @override
  String toString() => 'GetBackupKeyForResetPasswordError { $message }';
}