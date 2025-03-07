part of 'auth.bloc.dart';

sealed class AuthEvent {
  const AuthEvent();
}

final class LoginEvent extends AuthEvent {
  final String email;
  final String password;
  const LoginEvent({ required this.email, required this.password });
}

final class Register extends AuthEvent {
  final UserEntity user;
  const Register(this.user);
}

final class Logout extends AuthEvent {
  const Logout();
}

final class RefreshUser extends AuthEvent {
  const RefreshUser();
}

final class DeleteUser extends AuthEvent {
  const DeleteUser();
}
