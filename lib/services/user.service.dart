import 'dart:convert';

import 'package:app/entities/user/user.entity.dart';
import 'package:app/entities/userRole/userRole.entity.dart';
import 'package:app/main.dart';
import 'package:app/services/encryption.service.dart';
import 'package:app/utils/api_client.dart';
import 'package:dio/dio.dart';

EncryptionService? encryptionService;

class UserService {

  UserService();

  Future<void> logOut() async {
    await prefs?.setString('user', 'null');
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
    final userRaw = prefs?.getString('user');
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
    var result = await globalApiClient.delete('/user/delete');
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
      userData['accessToken'] = result.data['accessToken'];
      userData['refreshToken'] = result.data['refreshToken'];
      final user = UserEntity.fromJson(userData);
      prefs?.setString('user', json.encode(user.toJson()));

      globalApiClient.setIdToken(user.accessToken!);
      
      // derive and persist key from password
      encryptionService ??= EncryptionService(userSalt: user.keySalt);
      await encryptionService?.deriveAndPersistKey(password);
      return user;
    } else {
      throw Exception('login_failed');
    }
  }

  Future<UserEntity?> register(String email, String password) async {
    final result = await globalApiClient.post('/auth/register', data: {
      'email': email,
      'password': password,
    });
    if (result.statusCode == 201) {
      final userData = result.data['user'];
      userData['accessToken'] = result.data['accessToken'];
      userData['refreshToken'] = result.data['refreshToken'];
      final user = UserEntity.fromJson(userData);
      prefs?.setString('user', json.encode(user.toJson()));

      globalApiClient.setIdToken(user.accessToken!);
      
      // derive and persist key from password
      encryptionService ??= EncryptionService(userSalt: user.keySalt);
      await encryptionService?.deriveAndPersistKey(password);
      return user;
    } else {
      throw Exception('registration_failed');
    }
  }

  static Future<String?> refreshToken(UserEntity user) async {
    final refreshToken = user.refreshToken;
    final  apiClient = Dio();
    apiClient.options = BaseOptions(
      baseUrl: env!.restApiUrl,
      headers: {
        'Authorization': 'Bearer $refreshToken',
      },
    );
    final result = await apiClient.post('/auth/refresh');

    final accessToken = result.data['accessToken'];
    user.accessToken = accessToken;
    user.refreshToken = result.data['refreshToken'];
    prefs?.setString('user', json.encode(user.toJson()));

    return accessToken;
  }
}
