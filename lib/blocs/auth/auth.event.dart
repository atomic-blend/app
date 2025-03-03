part of 'auth.bloc.dart';

sealed class AuthEvent {
  const AuthEvent();
}

final class Login extends AuthEvent {
  final UserEntity user;
  const Login(this.user);
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
