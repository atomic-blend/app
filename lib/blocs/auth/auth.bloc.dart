import 'package:app/entities/user/user.entity.dart';
import 'package:app/services/user.service.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
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
      emit(LoggedIn(updatedUser));
    } on DioException catch (e) {
      // TODO
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
    emit(LoggedIn(updatedUser!));
  }

  void _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(const Loading());
    final updatedUser =
        await _userService.register(event.email, event.password);
    if (updatedUser == null) {
      emit(const LoggedOut());
      return;
    }
    emit(LoggedIn(updatedUser));
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    if (json['user'] != null) {
      return LoggedIn(UserEntity.fromJson(json['user']));
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
}
