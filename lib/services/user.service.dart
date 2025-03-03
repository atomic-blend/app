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
    _apiClient.setIdToken(user.idToken!);
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
      _apiClient.setIdToken(user.idToken!);
      var result = await _apiClient.get('/user');
      if (result.statusCode == 200) {
        user.id = result.data['_id'];
        user.roles = result.data['roles'].map<UserRoleEntity>((role) {
          role['id'] = role['_id'];
          return UserRoleEntity.fromJson(role);
        }).toList() as List<UserRoleEntity>;
        user.salt = result.data['salt'];
        encryptionService ??= EncryptionService(userSalt: result.data["salt"]);
        await encryptionService?.deriveAndPersistKey(user.idToken!);
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
}
