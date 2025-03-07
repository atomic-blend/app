import 'dart:convert';

import 'package:app/entities/user/user.entity.dart';
import 'package:app/entities/userRole/userRole.entity.dart';
import 'package:app/main.dart';
import 'package:app/services/encryption.service.dart';
import 'package:app/utils/api_client.dart';
import 'package:dio/dio.dart';

EncryptionService? encryptionService;

class UserService {
  final ApiClient _apiClient = ApiClient().init();

  UserService();

  Future<void> logOut() async {
    await prefs?.setString('user', 'null');
  }

  Future<UserEntity> createUser(UserEntity user) async {
    _apiClient.setIdToken(user.accessToken!);
    final result = await _apiClient.post('/user/setup', data: user);
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
      _apiClient.setIdToken(user.accessToken!);
      var result = await _apiClient.get('/users/profile');
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
    var result = await _apiClient.delete('/user/delete');
    if (result.statusCode == 200) {
      logOut();
      return true;
    } else {
      return false;
    }
  }

  Future<UserEntity?> login(String email, String password) async {
    final result = await _apiClient.post('/auth/login', data: {
      'email': email,
      'password': password,
    });
    if (result.statusCode == 200) {
      final userData = result.data['user'];
      final user = UserEntity.fromJson(userData);
      prefs?.setString('user', json.encode(user.toJson()));

      //TODO: derive and persist key from password
      encryptionService ??= EncryptionService(userSalt: user.keySalt);
      await encryptionService?.deriveAndPersistKey(password);
      return user;
    } else {
      throw Exception('login_failed');
    }
  }
}
