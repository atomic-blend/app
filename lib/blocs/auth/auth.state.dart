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

class Error extends AuthState {
  final String message;
  const Error(this.message) : super(null);

  @override
  String toString() => 'Error { $message }';
}

class LoggedIn extends AuthState {
  const LoggedIn(UserEntity super.user);

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
