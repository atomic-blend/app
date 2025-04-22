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

class UserStartResetPasswordLoading extends AuthState {
  const UserStartResetPasswordLoading() : super(null);

  @override
  String toString() => 'UserStartResetPasswordLoading { }';
}

class UserStartResetPasswordSuccess extends AuthState {
  const UserStartResetPasswordSuccess() : super(null);

  @override
  String toString() => 'UserStartResetPasswordSuccess { }';
}

class UserStartResetPasswordError extends AuthState {
  final String message;
  const UserStartResetPasswordError(this.message) : super(null);

  @override
  String toString() => 'UserStartResetPasswordError { $message }';
}
