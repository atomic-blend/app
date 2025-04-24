part of 'auth.bloc.dart';

sealed class AuthEvent {
  const AuthEvent();
}

final class LoginEvent extends AuthEvent {
  final String email;
  final String password;
  const LoginEvent({required this.email, required this.password});
}

final class RegisterEvent extends AuthEvent {
  final String email;
  final String password;
  const RegisterEvent({required this.email, required this.password});
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

final class UpdateUserDevice extends AuthEvent {
  final UserEntity user;
  final UserDeviceEntity deviceInfo;
  const UpdateUserDevice(this.user, this.deviceInfo);
}

final class UpdateUserProfile extends AuthEvent {
  final UserEntity user;
  const UpdateUserProfile(this.user);
}

final class ChangePassword extends AuthEvent {
  final String oldPassword;
  final String newPassword;
  final String newUserKey;
  final String newEncryptedDataKey;
  final String newSalt;
  const ChangePassword(this.oldPassword, this.newPassword, this.newUserKey,
      this.newEncryptedDataKey, this.newSalt);
}

final class StartResetPassword extends AuthEvent {
  final String email;
  const StartResetPassword(this.email);
}

final class ConfirmResetPassword extends AuthEvent {
  final String resetCode;
  final bool resetData;
  final String newPassword;
  final String userKey;
  final String userSalt;
  final String backupKey;
  final String backupSalt;

  const ConfirmResetPassword({
    required this.resetCode,
    required this.resetData,
    required this.newPassword,
    required this.userKey,
    required this.userSalt,
    required this.backupKey,
    required this.backupSalt,
  });
}

final class GetBackupKeyForResetPassword extends AuthEvent {
  final String resetCode;
  const GetBackupKeyForResetPassword(this.resetCode);
}
