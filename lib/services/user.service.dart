import 'dart:convert';

import 'package:app/entities/user/user.entity.dart';
import 'package:app/entities/userRole/userRole.entity.dart';
import 'package:app/entities/user_device/user_device.dart';
import 'package:app/main.dart';
import 'package:app/services/device_info.service.dart';
import 'package:app/services/encryption.service.dart';
import 'package:app/utils/api_client.dart';
import 'package:dio/dio.dart';

EncryptionService? encryptionService;
DeviceInfoService? deviceInfoService;

class UserService {
  UserService();

  Future<void> logOut() async {
    userKey = null;
    userData = null;
    await prefs?.clear();
    globalApiClient.setIdToken(null);
    encryptionService = null;
    deviceInfoService = null;
  }

  Future<UserEntity> createUser(UserEntity user) async {
    globalApiClient.setIdToken(user.accessToken!);
    final result = await globalApiClient.post('/user/setup', data: user);
    if (result.statusCode == 201) {
      user.id = result.data['_id'];
      user.roles = result.data['roles'].map<UserRoleEntity>((role) {
        role['id'] = role['_id'];
        return UserRoleEntity.fromJson(role);
      }).toList() as List<UserRoleEntity>;

      prefs?.setString('user', json.encode(user.toJson()));
      return user;
    } else {
      throw Exception('user_creation_failed');
    }
  }

  Future<UserEntity> updateUserDevice(
      UserEntity user, UserDeviceEntity device) async {
    final result = await globalApiClient.put('/users/device', data: device);
    if (result.statusCode == 200) {
      final user = UserEntity.fromJson(result.data["data"]);
      prefs?.setString('user', json.encode(user.toJson()));
      return user;
    } else {
      throw Exception('user_device_update_failed');
    }
  }

  Future<UserEntity?> getUser(UserEntity user) async {
    try {
      globalApiClient.setIdToken(user.accessToken!);
      var result = await globalApiClient.get('/users/profile');
      if (result.statusCode == 200) {
        await prefs?.setString('user', json.encode(user.toJson()));
        return user;
      }
      return null;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse &&
          e.response?.statusCode == 404) {
        return await createUser(user);
      }
    }
    return null;
  }

  Future<UserEntity?> checkForLoggedInUser() async {
    final userRaw = prefs?.getString('accessToken');
    if (userRaw != null) {
      final user = json.decode(userRaw);
      if (user != null) {
        return UserEntity.fromJson(user);
      } else {
        return null;
      }
    }
    return null;
  }

  Future<bool> deleteUser() async {
    var result = await globalApiClient.delete('/users/me');
    if (result.statusCode == 200) {
      logOut();
      return true;
    } else {
      return false;
    }
  }

  Future<UserEntity?> login(String email, String password) async {
    final result = await globalApiClient.post('/auth/login', data: {
      'email': email,
      'password': password,
    });
    if (result.statusCode == 200) {
      final userData = result.data['user'];
      final user = UserEntity.fromJson(userData);
      await prefs?.setString('user', json.encode(user.toJson()));
      await prefs?.setString('accessToken', result.data["accessToken"]);
      await prefs?.setString('refreshToken', result.data["refreshToken"]);

      globalApiClient.setIdToken(result.data["accessToken"]);

      // restore data key from password
      encryptionService ??= EncryptionService(userSalt: user.keySet.salt);
      await encryptionService?.restoreDataKey(password, user.keySet);
      return user;
    } else if (result.statusCode == 401) {
      throw Exception("wrong_email_password");
    } else {
      throw Exception('login_failed');
    }
  }

  Future<UserEntity?> register(String email, String password) async {
    // derive and persist key from password
    final keySet = await EncryptionService.generateKeySet(password);

    final result = await globalApiClient.post('/auth/register', data: {
      'email': email,
      'password': password,
      'keySet': keySet?.toJson(),
    });
    if (result.statusCode == 201) {
      userData = result.data['user'];
      userData!['accessToken'] = result.data['accessToken'];
      userData!['refreshToken'] = result.data['refreshToken'];
      final user = UserEntity.fromJson(userData!);
      prefs?.setString('user', json.encode(user.toJson()));
      user.keySet = keySet!;

      globalApiClient.setIdToken(user.accessToken!);
      return user;
    } else {
      throw Exception('registration_failed');
    }
  }

  static Future<String?> refreshToken(UserEntity user) async {
    final refreshToken = user.refreshToken;
    if (refreshToken == null || refreshToken.isEmpty) {
      throw Exception('No refresh token available');
    }
    final apiClient = Dio();
    apiClient.options = BaseOptions(
      baseUrl: env!.restApiUrl,
      headers: {
        'Authorization': 'Bearer $refreshToken',
      },
    );
    final result = await apiClient.post('/auth/refresh');
    if (result.statusCode != 200) {
      throw Exception('Token refresh failed');
    }
    final accessToken = result.data['accessToken'];
    user.accessToken = accessToken;
    user.refreshToken = result.data['refreshToken'];
    prefs?.setString('user', json.encode(user.toJson()));
    globalApiClient.setIdToken(accessToken);

    return accessToken;
  }

  updateUserProfile(String userId, UserEntity userPayload) async {
    final result =
        await globalApiClient.put('/users/profile', data: userPayload);
    if (result.statusCode == 200) {
      final user = UserEntity.fromJson(result.data["data"]);
      prefs?.setString('user', json.encode(user.toJson()));
      return user;
    } else {
      throw Exception('user_update_failed');
    }
  }

  changePassword({required String oldPassword, required String newPassword,
      required String newEncryptedDataKey, required String newUserKey, required String newUserSalt,}) async {
    final result = await globalApiClient.put('/users/password', data: {
      'old_password': oldPassword,
      'new_password': newPassword,
      'user_key': newEncryptedDataKey,
      'salt': newUserSalt,
    });
    if (result.statusCode == 200) {
      await EncryptionService.persistNewUserKey(base64.decode(newUserKey));
      return true;
    } else {
      throw Exception('password_change_failed');
    }
  }

  Future<bool> startResetPassword(String email) async {
    final result = await globalApiClient.post('/auth/reset-password', data: {
      'email': email,
    });
    if (result.statusCode == 200) {
      return true;
    } else {
      throw Exception('reset_password_failed');
    }
  }
}
